package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.scalarType;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.RealPolynomial;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author StΣνε
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
abstract class PolySeriesFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                     FunctionNode<D, C, F>
{
  protected int derivativeOrder = 0;

  protected PolySeriesFunctionNode(String name, Expression<D, C, F> expr)
  {
    super(name,
          expr.resolve(),
          expr.require(')'));
  }

  protected PolySeriesFunctionNode(String name,
                                   Expression<D, C, F> expr,
                                   Node<D, C, F> arg,
                                   int order)
  {
    super(name,
          arg,
          expr);
    this.derivativeOrder = Math.max(0, order);
  }

  private static int nextLocal = 20;

  private static int allocSlot()
  {
    return nextLocal++;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    final Class<?> S  = scalarType(resultType);
    final boolean  cx = Complex.class.equals(S);
    final int      n  = Math.max(1, derivativeOrder + 1);
    final int      k  = derivativeOrder;

    // Local: outScalar, resPoly, argPoly, oneScalar
    loadOutputVariableOntoStack(mv, S);
    int outSlot = allocSlot();
    mv.visitVarInsn(Opcodes.ASTORE, outSlot);

    // Create and init resPoly
    newPoly(mv, cx);
    int resSlot = allocSlot();
    mv.visitVarInsn(Opcodes.ASTORE, resSlot);
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       cx ? "acb_poly_init" : "arb_poly_init",
                       Void.class,
                       cx ? ComplexPolynomial.class : RealPolynomial.class);

    // Create and init argPoly
    newPoly(mv, cx);
    int argSlot = allocSlot();
    mv.visitVarInsn(Opcodes.ASTORE, argSlot);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       cx ? "acb_poly_init" : "arb_poly_init",
                       Void.class,
                       cx ? ComplexPolynomial.class : RealPolynomial.class);

    // Fit length n
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, n);
    invokeStaticMethod(mv,
                       arblib.class,
                       cx ? "acb_poly_fit_length" : "arb_poly_fit_length",
                       Void.class,
                       cx ? ComplexPolynomial.class : RealPolynomial.class,
                       int.class);

    // Set coeff 0 = arg(x)
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, 0);
    arg.generate(mv, S);
    invokeStaticMethod(mv,
                       arblib.class,
                       cx ? "acb_poly_set_coeff_acb" : "arb_poly_set_coeff_arb",
                       Void.class,
                       cx ? ComplexPolynomial.class : RealPolynomial.class,
                       int.class,
                       S);

    // Allocate + prepare a temp variable for 1
    int oneSlot = allocSlot();
    if (cx)
    {
      // Complex temp = new Complex(); arblib.acb_one(temp);
      mv.visitTypeInsn(Opcodes.NEW, "arb/Complex");
      mv.visitInsn(Opcodes.DUP);
      mv.visitMethodInsn(Opcodes.INVOKESPECIAL, "arb/Complex", "<init>", "()V", false);
      mv.visitInsn(Opcodes.DUP);
      mv.visitVarInsn(Opcodes.ASTORE, oneSlot);
      invokeStaticMethod(mv, arblib.class, "acb_one", Void.class, Complex.class);
    }
    else
    {
      // Real temp = new Real(); arblib.arb_one(temp);
      mv.visitTypeInsn(Opcodes.NEW, "arb/Real");
      mv.visitInsn(Opcodes.DUP);
      mv.visitMethodInsn(Opcodes.INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      mv.visitInsn(Opcodes.DUP);
      mv.visitVarInsn(Opcodes.ASTORE, oneSlot);
      invokeStaticMethod(mv, arblib.class, "arb_one", Void.class, Real.class);
    }

    // Set coeff 1 = 1
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, 1);
    mv.visitVarInsn(Opcodes.ALOAD, oneSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       cx ? "acb_poly_set_coeff_acb" : "arb_poly_set_coeff_arb",
                       Void.class,
                       cx ? ComplexPolynomial.class : RealPolynomial.class,
                       int.class,
                       S);

    // Call the series function with local refs
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushSeriesCallParamsAndInvoke(mv, S, cx, n, oneSlot);

    // Prepare stack for get_coeff: outScalar, resPoly, k (signature: Complex x,
    // ComplexPolynomial poly, int n)
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    pushInt(mv, k);
    invokeStaticMethod(mv,
                       arblib.class,
                       cx ? "acb_poly_get_coeff_acb" : "arb_poly_get_coeff_arb",
                       Void.class,
                       S,
                       cx ? ComplexPolynomial.class : RealPolynomial.class,
                       int.class);

    // Clear polys
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       cx ? "acb_poly_clear" : "arb_poly_clear",
                       Void.class,
                       cx ? ComplexPolynomial.class : RealPolynomial.class);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       cx ? "acb_poly_clear" : "arb_poly_clear",
                       Void.class,
                       cx ? ComplexPolynomial.class : RealPolynomial.class);

    // Reload outScalar (now filled)
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    generatedType = S;
    return mv;
  }

  protected abstract PolySeriesFunctionNode<D, C, F> makeWithOrder(int order);

  protected abstract void pushSeriesCallParamsAndInvoke(MethodVisitor mv,
                                                        Class<?> S,
                                                        boolean cx,
                                                        int n,
                                                        int oneSlot);

  protected void pushInt(MethodVisitor mv, int v)
  {
    mv.visitLdcInsn(v);
  }

  private static void newPoly(MethodVisitor mv, boolean cx)
  {
    String cls = cx ? "arb/ComplexPolynomial" : "arb/RealPolynomial";
    mv.visitTypeInsn(Opcodes.NEW, cls);
    mv.visitInsn(Opcodes.DUP);
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, cls, "<init>", "()V", false);
  }
}
