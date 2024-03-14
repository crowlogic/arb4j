package arb.expressions.nodes.binary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * n≀=2^(n-(n mod 2))*∏(k=1..n)k^((-1)^(k+1))=n!/⌊n/2⌋!²
 * 
 * <a href="https://oeis.org/A056040">The swinging factorial, n≀ = 2^(n-(n mod
 * 2))*∏{k=1..n} k^((-1)^(k+1))</a>
 * 
 * @param <D>
 * @param <R>
 * @param <F>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SwingingFactorial<D, R, F extends Function<D, R>> extends
                              BinaryOperation<D, R, F>
{

  public SwingingFactorial(Expression<D, R, F> expression, Node<D, R, F> left, String operation, Node<D, R, F> right)
  {
    super(expression,
          left,
          operation,
          right);
  }

  @Override
  public String typeset()
  {
    assert false : "TODO: implement https://github.com/crowlogic/arb4j/issues/319";
    return "TODO";
  }

}
