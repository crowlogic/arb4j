package arb.functions;

import static arb.expressions.Expression.instantiate;

import arb.Integer;
import arb.RealPolynomial;
import arb.expressions.Context;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formats of the same document respectively.
 */
public interface IntegerToRealPolynomialFunction extends
                                                 Function<Integer, RealPolynomial>
{

  public static IntegerToRealPolynomialFunction
         express(String functionName, String expression, Context context, boolean verbose)
  {
    IntegerToRealPolynomialFunction func = instantiate(expression,
                                                       context,
                                                       Integer.class,
                                                       RealPolynomial.class,
                                                       IntegerToRealPolynomialFunction.class,
                                                       verbose,
                                                       functionName);

    return func;
  }

  public static IntegerToRealPolynomialFunction express(String expression, Context context, boolean verbose)
  {
    return instantiate(expression,
                       context,
                       Integer.class,
                       RealPolynomial.class,
                       IntegerToRealPolynomialFunction.class,
                       verbose,
                       null);
  }
}