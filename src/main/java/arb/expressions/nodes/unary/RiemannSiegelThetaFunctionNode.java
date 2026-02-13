package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.arblib;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class RiemannSiegelThetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>>
                                           extends
                                           PolySeriesFunctionNode<D, C, F>
{
  public RiemannSiegelThetaFunctionNode(Expression<D, C, F> expression)
  {
    super("ϑ",
          expression);
  }

  private RiemannSiegelThetaFunctionNode(Expression<D, C, F> expression,
                                         Node<D, C, F> arg,
                                         int order)
  {
    super("ϑ",
          expression,
          arg,
          order);
  }

  @Override
  protected void invokeSeriesEvaluationFunction(MethodVisitor mv,
                                                Class<?> scalarType,
                                                boolean isComplex,
                                                int hSlot,
                                                int outSlot,
                                                Class<?> polyClass)
  {
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    mv.visitVarInsn(Opcodes.ALOAD, hSlot);
    loadOrderParameter(mv);
    if (derivativeOrder > 0)
    {
      mv.visitLdcInsn(derivativeOrder);
      mv.visitInsn(Opcodes.IADD);
    }
    loadBitsParameterOntoStack(mv);

    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? "acb_poly_riemann_siegel_theta_series"
                                 : "arb_poly_riemann_siegel_theta_series",
                       Void.class,
                       polyClass,
                       polyClass,
                       int.class,
                       int.class);
  }

  @Override
  public Node<D, C, F> differentiate(arb.expressions.nodes.VariableNode<D, C, F> variable)
  {
    return new RiemannSiegelThetaFunctionNode<>(expression,
                                                arg,
                                                derivativeOrder + 1);
  }

  @Override
  public Node<D, C, F> integrate(arb.expressions.nodes.VariableNode<D, C, F> variable)
  {
    return new RiemannSiegelThetaFunctionNode<>(expression,
                                                arg,
                                                Math.max(0, derivativeOrder - 1));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new RiemannSiegelThetaFunctionNode<E, S, G>(newExpression,
                                                       arg.spliceInto(newExpression),
                                                       derivativeOrder);
  }

  @Override
  public String toString()
  {
    return derivativeOrder == 0 ? "ϑ(" + arg + ")" : "ϑ^(" + derivativeOrder + ")(" + arg + ')';
  }

  @Override
  public String typeset()
  {
    return String.format("\\vartheta(%s)", arg == null ? "" : arg.typeset());
  }
}
