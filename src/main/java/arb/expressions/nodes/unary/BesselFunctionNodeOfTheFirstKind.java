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
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;

/**
 * Implements the {@link RealBesselFunctionOfTheFirstKind} by generating calls
 * directly to {@link arblib#arb_hypgeom_bessel_j(Real, Real, Real, int)}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BesselFunctionNodeOfTheFirstKind<D, R, F extends Function<? extends D, ? extends R>> extends
                                             FunctionNode<D, R, F>
{

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(order, arg);

  }

  @Override
  public String toString()
  {
    return String.format("J(%s,%s)", order, arg);
  }

  Node<D, R, F>  order;

  public boolean scalar;

  public BesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression)
  {
    super("J",
          null,
          expression);
    order  = expression.resolve();
    arg    = expression.require(',').resolve();
    scalar = expression.require(')').hasScalarCodomain();
    // assert false : "wtf";
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      err.printf("J.generate(ν=%s, resultType=%s\n)\n", order, resultType);
    }

    var scalarType = scalarType(resultType);
    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);
    order.generate(mv, scalarType);

    // Add cast if order's generated type doesn't match result type
    if (!order.generatedType.equals(resultType))
    {
      order.generateCastTo(mv, resultType);
    }

    generateScalar(mv, resultType, scalarType);
    return mv;
  }

  

  public void generateScalar(MethodVisitor mv, Class<?> resultType, Class<?> scalarType)
  {
    arg.generate(mv, resultType);
    loadBitsParameterOntoStack(mv);
    if (scalarType.equals(Real.class))
    {
      invokeRealStaticEvaluationFunction(mv);
    }
    else if (scalarType.equals(Complex.class))
    {
      invokeComplexStaticEvaluationFunction(mv);
    }
    else
    {
      assert false : "TODO: support " + scalarType + " scalarType";
    }

    generatedType = scalarType;
  }

  public void invokeComplexStaticEvaluationFunction(MethodVisitor mv)
  {
    invokeStaticMethod(mv,
                       arblib.class,
                       "acb_hypgeom_bessel_j",
                       Void.class,
                       Complex.class,
                       Complex.class,
                       Complex.class,
                       int.class);
  }

  public void invokeRealStaticEvaluationFunction(MethodVisitor mv)
  {
    invokeStaticMethod(mv,
                       arblib.class,
                       "arb_hypgeom_bessel_j",
                       Void.class,
                       Real.class,
                       Real.class,
                       Real.class,
                       int.class);
  }

  @Override
  public String typeset()
  {
    return format("J_{%s}(%s)", order.typeset(), arg == null ? "" : arg.typeset());
  }
}