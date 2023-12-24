package arb.functions.complex.numbertheoretic;

import arb.Real;
import arb.functions.complex.SFunction;
import arb.operators.CompositionOperator;

/**
 * The conjugate of this function is {@link YFunction}
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class XFunction extends
                       CompositionOperator<SFunction, ZFunction>
{

  @Override
  public String toString()
  {
    return "X=" + super.toString();
  }

  public XFunction()
  {
    super(new SFunction(),
          new ZFunction());
  }

  public XFunction(Real scale)
  {
    super(new SFunction(scale),
          new ZFunction());
  }

}
