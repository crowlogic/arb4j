package arb.operators;

import java.util.ArrayList;
import java.util.List;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class GramSchmidtProcess
{
  private Iterable<RealFunction> functions;
  private RealFunction           weightFunction;

  public GramSchmidtProcess(Iterable<RealFunction> functions, RealFunction weightFunction)
  {
    this.functions      = functions;
    this.weightFunction = weightFunction;
  }

  public List<RealFunction> applyGramSchmidt()
  {
    List<RealFunction> orthogonalizedFunctions = new ArrayList<>();

    for (RealFunction function : functions)
    {
      RealFunction newFunction = function;

      for (RealFunction prevFunction : orthogonalizedFunctions)
      {
        double       ip                 = innerProduct(newFunction, prevFunction);
        Real         ipval              = Real.valueOf(ip);
        RealFunction scaledPrevFunction = prevFunction.mul((x, o, b, r) -> ipval);
        newFunction = newFunction.sub(scaledPrevFunction);
      }

      orthogonalizedFunctions.add(newFunction);
    }

    return orthogonalizedFunctions;
  }

  private double innerProduct(RealFunction newFunction, RealFunction prevFunction)
  {
    assert false : "TODO: Auto-generated method stub";
    return 0.0;
  }
}
