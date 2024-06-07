package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoSTack;
import static arb.expressions.Compiler.scalarType;
import static java.lang.System.err;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

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
public class BesselFunctionOfTheFirstKind<D, R, F extends Function<? extends D, ? extends R>> extends
                                         FunctionCall<D, R, F>
{


  @Override
  public List<Node<D, R, F>>
         getBranches()
  {
    return List.of(ν,
                   arg);

  }

  @Override
  public String
         toString()
  {
    return String.format("J(%s,%s)",
                         ν,
                         arg);
  }

  Node<D, R, F> ν;

  public BesselFunctionOfTheFirstKind(Expression<D, R, F> expression)
  {
    super("J",
          null,
          expression);

    ν = expression.resolve();

    expression.require(',');

    arg = expression.resolve();

    expression.require(')');
  }

  @Override
  public MethodVisitor
         generate(Class<?> resultType,
                  MethodVisitor mv)
  {
    if (Expression.trace)
    {
      err.printf("J.generate(ν=%s, resultType=%s\n)\n",
                 ν,
                 resultType);
    }
    var scalarType = scalarType(resultType);

    loadOutputVariableOntoStack(mv,
                                scalarType);
    duplicateTopOfTheStack(mv);
    ν.generate(scalarType,
               mv);
    arg.generate(resultType,
                 mv);
    loadBitsParameterOntoSTack(mv);

    invokeStaticMethod(mv,
                       arblib.class,
                       "arb_hypgeom_bessel_j",
                       Void.class,
                       Real.class,
                       Real.class,
                       Real.class,
                       int.class);

    generatedType = scalarType;

    return mv;
  }
}