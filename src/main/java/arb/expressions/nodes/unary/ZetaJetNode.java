package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Jet node for the Riemann zeta function ζ(s). Replaces
 * {@link ZetaFunctionNode}.
 * 
 * <p>
 * The zeta series call has a different signature from the other series
 * functions: {@code acb_poly_zeta_series(res, f, a, deflate, n, prec)} where
 * {@code a} is set to 1 and {@code deflate} is set to 0.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaJetNode<D, C, F extends Function<? extends D, ? extends C>> extends
                        JetNode<D, C, F>
{
  public ZetaJetNode(Expression<D, C, F> expression)
  {
    super("ζ",
          expression);
  }

  protected ZetaJetNode(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                         JetState sharedState)
  {
    super("ζ",
          expression,
          arg,
          coefficientIndex,
          sharedState);
  }

  @Override
  protected void emitSeriesCall(MethodVisitor mv, Class<?> scalarType, boolean isComplex)
  {
    // The zeta series is only defined for complex polynomials via
    // acb_poly_zeta_series(res, f, a, deflate, n, prec)
    // Stack already has: jetPoly, argPoly, required, bits
    // We need to rearrange to: res, f, a(=1), deflate(=0), n, bits
    //
    // But the JetNode base already pushed (jetPoly, argPoly, required, bits) in
    // that order. For zeta we need to insert (a, deflate) between argPoly and
    // required. This requires a different approach — we override
    // emitJetComputation behavior by popping required+bits, pushing extra params,
    // then pushing required+bits back.

    // Current stack: ..., jetPoly, argPoly, required(int), bits(int)
    // We need: ..., jetPoly, argPoly, one(Complex/Real), 0(int), required(int),
    // bits(int)

    // Store bits and required temporarily
    int tmpBits     = expression.allocateLocalVariableSlot();
    int tmpRequired = expression.allocateLocalVariableSlot();
    mv.visitVarInsn(Opcodes.ISTORE, tmpBits);
    mv.visitVarInsn(Opcodes.ISTORE, tmpRequired);

    // Push a = one (allocate a temp scalar, set to 1)
    String scalarInternal = isComplex ? "arb/Complex" : "arb/Real";
    Compiler.constructNewObject(mv, scalarInternal);
    Compiler.duplicateTopOfTheStack(mv);
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, scalarInternal, "<init>", "()V", false);
    Compiler.duplicateTopOfTheStack(mv);
    generateVirtualMethodInvocation(mv, scalarType, "one", scalarType);
    pop(mv);

    // Push deflate = 0
    mv.visitInsn(Opcodes.ICONST_0);

    // Push required and bits back
    mv.visitVarInsn(Opcodes.ILOAD, tmpRequired);
    mv.visitVarInsn(Opcodes.ILOAD, tmpBits);

    Class<?> polyClass = isComplex ? ComplexPolynomial.class : RealPolynomial.class;
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? "acb_poly_zeta_series" : "arb_poly_zeta_series",
                       Void.class,
                       polyClass,
                       polyClass,
                       scalarType,
                       int.class,
                       int.class,
                       int.class);
  }

  @Override
  protected JetNode<D, C, F> newInstance(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                                         JetState sharedState)
  {
    return new ZetaJetNode<>(expression, arg, coefficientIndex, sharedState);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new ZetaJetNode<>(newExpression, arg.spliceInto(newExpression), coefficientIndex, sharedState);
  }

  @Override
  public String toString()
  {
    return "ζ(" + arg + ')';
  }

  @Override
  public String typeset()
  {
    return "\\zeta(" + (arg == null ? "" : arg.typeset()) + ')';
  }
}
