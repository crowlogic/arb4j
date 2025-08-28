package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.scalarType;
import static java.lang.String.format;
import static java.lang.System.err;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.Complex;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Implements the Riemann zeta function by generating calls directly to
 * {@link arblib#arb_poly_zeta_series} and {@link arblib#acb_poly_zeta_series}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             FunctionNode<D, C, F>
{
  public boolean scalar;
  private int    derivativeOrder = 0;

  public ZetaFunctionNode(Expression<D, C, F> expression)
  {
    super("ζ",
          expression.resolve(),
          expression.require(')'));
    this.scalar = expression.hasScalarCodomain();
  }

  private ZetaFunctionNode(Expression<D, C, F> expression,
                           Node<D, C, F> argument,
                           int derivativeOrder)
  {
    super("ζ",
          argument,
          expression);
    this.scalar          = expression.hasScalarCodomain();
    this.derivativeOrder = derivativeOrder;
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(arg);
  }

  @Override
  public String toString()
  {
    return String.format("ζ(%s)", arg);
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    if (!arg.dependsOn(variable))
    {
      return zero();
    }

    Node<D, C, F>             argDerivative  = arg.differentiate(variable);
    ZetaFunctionNode<D, C, F> zetaDerivative = new ZetaFunctionNode<>(expression,
                                                                      arg,
                                                                      1);
    return zetaDerivative.mul(argDerivative);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      err.printf("ζ.generate(arg=%s, resultType=%s, derivativeOrder=%d)\n",
                 arg,
                 resultType,
                 derivativeOrder);
    }

    var scalarType = scalarType(resultType);
    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);
    arg.generate(mv, resultType);
    loadBitsParameterOntoStack(mv);

    if (derivativeOrder > 0)
    {
      invokeDerivativeEvaluationMethod(mv, scalarType);
    }
    else
    {
      invokeStaticEvaluationMethod(mv, scalarType);
    }

    generatedType = scalarType;
    return mv;
  }

  public MethodVisitor invokeStaticEvaluationMethod(MethodVisitor mv, Class<?> scalarType)
  {
    return invokeStaticMethod(mv,
                              arblib.class,
                              Complex.class.equals(scalarType) ? "acb_zeta" : "arb_zeta",
                              Void.class,
                              scalarType,
                              scalarType,
                              int.class);
  }

  public MethodVisitor invokeDerivativeEvaluationMethod(MethodVisitor mv, Class<?> scalarType)
  {
    return invokeStaticMethod(mv,
                              arblib.class,
                              Complex.class.equals(scalarType) ? "acb_poly_zeta_series"
                                                               : "arb_poly_zeta_series",
                              Void.class,
                              scalarType,
                              scalarType,
                              scalarType,
                              int.class,
                              int.class,
                              int.class);
  }

  @Override
  public String typeset()
  {
    return format("ζ(%s)", arg == null ? "" : arg.typeset());
  }
}
