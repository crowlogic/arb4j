package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.Polynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Negation<D, R, F extends Function<? extends D, ? extends R>>
                     extends
                     FunctionCall<D, R, F>
{

  @Override
  public boolean isBitless()
  {
    return true;
  }

  public Negation(Expression<D, R, F> expression, Node<D, R, F> argument)
  {
    super("neg",
          argument,
          expression);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor generate(Class<?> resultType, MethodVisitor mv)
  {
    if (Polynomial.class.isAssignableFrom(expression.coDomainType))
    {
      resultType = expression.coDomainType;
    }
    return super.generate(resultType, mv);
  }

 

}
