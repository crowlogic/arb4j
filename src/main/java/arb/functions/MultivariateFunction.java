package arb.functions;

import arb.Real;
import arb.Tuple;
import arb.expressions.Context;

/**
 * See {@link Tuple}
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 * 
 * @param <R>
 */
public interface MultivariateFunction<R> extends
                                     Function<Tuple, R>
{

  public static MultivariateFunction<Real> express(String string, String string2, Context context, boolean b)
  {
    assert false : "TODO: implement";
    return null;
  }

}
