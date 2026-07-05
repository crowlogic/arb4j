package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeStaticMethod;

import org.objectweb.asm.MethodVisitor;

import arb.ComplexPolynomial;
import arb.RealPolynomial;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Jet node for the log-gamma function lnΓ(t).
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LogGammaJetNode<D, C, F extends Function<? extends D, ? extends C>> extends
                            JetNode<D, C, F>
{
  public LogGammaJetNode(Expression<D, C, F> expression)
  {
    super("lnΓ",
          expression);
  }

  protected LogGammaJetNode(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                             JetState sharedState)
  {
    super("lnΓ",
          expression,
          arg,
          coefficientIndex,
          sharedState);
  }

  @Override
  protected void emitSeriesCall(MethodVisitor mv, Class<?> scalarType, boolean isComplex)
  {
    Class<?> polyClass = isComplex ? ComplexPolynomial.class : RealPolynomial.class;
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? "acb_poly_lgamma_series" : "arb_poly_lgamma_series",
                       Void.class,
                       polyClass,
                       polyClass,
                       int.class,
                       int.class);
  }

  @Override
  protected JetNode<D, C, F> newInstance(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                                         JetState sharedState)
  {
    return new LogGammaJetNode<>(expression, arg, coefficientIndex, sharedState);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new LogGammaJetNode<>(newExpression, arg.spliceInto(newExpression), coefficientIndex, sharedState);
  }

  @Override
  public String toString()
  {
    return switch (coefficientIndex)
    {
      case 0 -> String.format("lnΓ(%s)", arg);
      case 1 -> String.format("ψ(%s)", arg);
      default -> String.format("ψ⁽%d⁾(%s)/%d!", coefficientIndex - 1, arg, coefficientIndex);
    };
  }

  @Override
  public String typeset()
  {
    String argument = arg == null ? "" : arg.typeset();
    return switch (coefficientIndex)
    {
      case 0 -> String.format("\\ln\\Gamma\\left(%s\\right)", argument);
      case 1 -> String.format("\\psi\\left(%s\\right)", argument);
      default -> String.format("\\frac{\\psi^{(%d)}\\left(%s\\right)}{%d!}",
                               coefficientIndex - 1,
                               argument,
                               coefficientIndex);
    };
  }
}
