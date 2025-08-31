package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
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
 * 
 * TODO: modify this to use intermediate variables that will be part of the
 * object rather than local variables
 * 
 * @author SτΣνε
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
abstract class PolySeriesFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                     FunctionNode<D, C, F>
{
  private static final String ARB_POLY_CLEAR         = "arb_poly_clear";
  private static final String ACB_POLY_CLEAR         = "acb_poly_clear";
  private static final String ARB_POLY_GET_COEFF_ARB = "arb_poly_get_coeff_arb";
  private static final String ACB_POLY_GET_COEFF_ACB = "acb_poly_get_coeff_acb";
  private static final String ARB_POLY_SET_COEFF_ARB = "arb_poly_set_coeff_arb";
  private static final String ACB_POLY_SET_COEFF_ACB = "acb_poly_set_coeff_acb";
  private static final String ARB_POLY_FIT_LENGTH    = "arb_poly_fit_length";
  private static final String ACB_POLY_FIT_LENGTH    = "acb_poly_fit_length";
  private static final String ARB_POLY_INIT          = "arb_poly_init";
  private static final String ACB_POLY_INIT          = "acb_poly_init";
  private static final String ARG_POLY               = "arg";
  private static final String RESULT_POLY            = "resultPoly";
  protected int               derivativeOrder        = 0;

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

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    final Class<?> S               = scalarType(resultType);
    final boolean  isComplex       = Complex.class.equals(S);
    final int      n               = Math.max(1, derivativeOrder + 1);
    final int      order           = derivativeOrder;

    int            outSlot         =
                           loadOutputVariableOntoElementOfOutputPolynomialProblematically(mv, S);

    Class<?>       polynomialClass =
                                   registerIntermediatePolynomialVariablesIfNotAlreadyRegistered(isComplex);

    int            resSlot         =
                           createAndIninitializePolynomial(mv, isComplex, polynomialClass);

    int            argSlot         =
                           createAndIninitializePolynomial(mv, isComplex, polynomialClass);

    setPolynomialLength(mv, isComplex, n, polynomialClass, argSlot);

    assignArgumentToElementOfPolynomial(mv, S, isComplex, polynomialClass, argSlot);

    int oneSlot = assignOneToElementOfPolynomial(mv, S, isComplex, polynomialClass, argSlot);

    // Call the series function with local refs
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushSeriesCallParamsAndInvoke(mv, S, isComplex, n, oneSlot);

    getScalarResult(mv, S, isComplex, order, outSlot, polynomialClass, resSlot);

    clearPolynomials(mv, isComplex, polynomialClass, resSlot, argSlot);

    // Reload outScalar (now filled)
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    generatedType = S;

    //assert !isResult : "TODO: handle isResult=true";
    return mv;
  }

  /**
   * Local: outScalar, resPoly, argPoly, oneScalar
   * 
   * @param mv
   * @param S
   * @return
   */
  protected int loadOutputVariableOntoElementOfOutputPolynomialProblematically(MethodVisitor mv,
                                                                               final Class<?> S)
  {
    loadOutputVariableOntoStack(mv, S);
    int outSlot = nextLocal++;
    mv.visitVarInsn(Opcodes.ASTORE, outSlot);
    return outSlot;
  }

  protected int assignOneToElementOfPolynomial(MethodVisitor mv,
                                               final Class<?> S,
                                               final boolean isComplex,
                                               Class<?> polynomialClass,
                                               int argSlot)
  {
    int oneSlot = putOneInSlot(mv, isComplex);
    assignOneToElementOfPolynomial(mv, S, isComplex, polynomialClass, argSlot, oneSlot);
    return oneSlot;
  }

  protected void assignOneToElementOfPolynomial(MethodVisitor mv,
                                                final Class<?> S,
                                                final boolean isComplex,
                                                Class<?> polynomialClass,
                                                int argSlot,
                                                int oneSlot)
  {
    // Set coeff 1 = 1
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, 1);
    mv.visitVarInsn(Opcodes.ALOAD, oneSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_SET_COEFF_ACB : ARB_POLY_SET_COEFF_ARB,
                       Void.class,
                       polynomialClass,
                       int.class,
                       S);
  }

  protected int createAndIninitializePolynomial(MethodVisitor mv,
                                                final boolean isComplex,
                                                Class<?> polynomialClass)
  {
    // Create and init argPoly
    newPoly(mv, isComplex);
    int argSlot = nextLocal++;
    mv.visitVarInsn(Opcodes.ASTORE, argSlot);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_INIT : ARB_POLY_INIT,
                       Void.class,
                       polynomialClass);
    return argSlot;
  }

  protected void setPolynomialLength(MethodVisitor mv,
                                     final boolean isComplex,
                                     final int n,
                                     Class<?> polynomialClass,
                                     int argSlot)
  {
    // Fit length n
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, n);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_FIT_LENGTH : ARB_POLY_FIT_LENGTH,
                       Void.class,
                       polynomialClass,
                       int.class);
  }

  protected void assignArgumentToElementOfPolynomial(MethodVisitor mv,
                                                     final Class<?> S,
                                                     final boolean isComplex,
                                                     Class<?> polynomialClass,
                                                     int argSlot)
  {
    // Set coeff 0 = arg(x)
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, 0);
    arg.generate(mv, S);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_SET_COEFF_ACB : ARB_POLY_SET_COEFF_ARB,
                       Void.class,
                       polynomialClass,
                       int.class,
                       S);
  }

  protected void getScalarResult(MethodVisitor mv,
                                 final Class<?> S,
                                 final boolean isComplex,
                                 final int order,
                                 int outSlot,
                                 Class<?> polynomialClass,
                                 int resSlot)
  {
    // Prepare stack for get_coeff: outScalar, resPoly, k (signature: Complex x,
    // ComplexPolynomial poly, int n)
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    pushInt(mv, order);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_GET_COEFF_ACB : ARB_POLY_GET_COEFF_ARB,
                       Void.class,
                       S,
                       polynomialClass,
                       int.class);
  }

  protected void clearPolynomials(MethodVisitor mv,
                                  final boolean isComplex,
                                  Class<?> polynomialClass,
                                  int resSlot,
                                  int argSlot)
  {
    // Clear polys
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_CLEAR : ARB_POLY_CLEAR,
                       Void.class,
                       polynomialClass);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_CLEAR : ARB_POLY_CLEAR,
                       Void.class,
                       polynomialClass);
  }

  protected int putOneInSlot(MethodVisitor mv, final boolean isComplex)
  {
    // Allocate + prepare a temp variable for 1
    int oneSlot = nextLocal++;
    if (isComplex)
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
    return oneSlot;
  }

  public Class<?>
         registerIntermediatePolynomialVariablesIfNotAlreadyRegistered(final boolean isComplex)
  {
    Class<?> polynomialClass = isComplex ? ComplexPolynomial.class : RealPolynomial.class;

    if (!expression.hasIntermediateVariable(RESULT_POLY))
    {
      expression.registerIntermediateVariable(RESULT_POLY, polynomialClass, true);
    }
    if (!expression.hasIntermediateVariable(ARG_POLY))
    {
      expression.registerIntermediateVariable(ARG_POLY, polynomialClass, true);
    }
    return polynomialClass;
  }

  protected abstract PolySeriesFunctionNode<D, C, F> makeWithOrder(int order);

  protected abstract void pushSeriesCallParamsAndInvoke(MethodVisitor mv,
                                                        Class<?> S,
                                                        boolean cx,
                                                        int n,
                                                        int oneSlot);

  public void call(MethodVisitor mv,
                   Class<?> S,
                   boolean complex,
                   int n,
                   int oneSlot,
                   String complexFunctionName,
                   String realFunctionName)
  {
    Class<?> polyClass = complex ? ComplexPolynomial.class : RealPolynomial.class;
    mv.visitVarInsn(Opcodes.ALOAD, oneSlot);
    pushInt(mv, 0);
    pushInt(mv, n);
    loadBitsParameterOntoStack(mv);
    invokeStaticMethod(mv,
                       arblib.class,
                       complex ? complexFunctionName : realFunctionName,
                       Void.class,
                       polyClass, // res
                       polyClass, // arg
                       S,
                       int.class,
                       int.class,
                       int.class);
  }

  public void call(MethodVisitor mv,
                   boolean complex,
                   int n,
                   String complexFunctionName,
                   String realFunctionName)
  {
    Class<?> polyClass = complex ? ComplexPolynomial.class : RealPolynomial.class;
    pushInt(mv, n);
    loadBitsParameterOntoStack(mv);

    invokeStaticMethod(mv,
                       arblib.class,
                       complex ? complexFunctionName : realFunctionName,
                       Void.class,
                       polyClass, // res
                       polyClass, // arg
                       int.class,
                       int.class);
  }

  protected static void pushInt(MethodVisitor mv, int v)
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
