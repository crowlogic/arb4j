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
    assert scalar : "TODO: support non-scalar codomain";

    generateScalar(mv, resultType, scalarType);

    return mv;
  }

  public void generateScalar(MethodVisitor mv, Class<?> resultType, Class<?> scalarType)
  {
    arg.generate(mv, resultType);
    loadBitsParameterOntoStack(mv);
    if ( scalarType.equals(Real.class))
    {
      invokeStaticMethod(mv,
                         arblib.class,
                         "arb_hypgeom_bessel_j",
                         Void.class,
                         Real.class,
                         Real.class,
                         Real.class,
                         int.class);
    } else if ( scalarType.equals(Complex.class))
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
    else
    {
      assert false : "TODO: support " + scalarType + " scalarType";
    }
    
    generatedType = scalarType;
  }

  @Override
  public String typeset()
  {
    return format("J_{%s}(%s)", order.typeset(), arg == null ? "" : arg.typeset());
  }
}