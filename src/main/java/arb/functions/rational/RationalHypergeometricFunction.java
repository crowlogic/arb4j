package arb.functions.rational;

import arb.*;
import arb.Integer;
import arb.functions.Function;
import arb.functions.HypergeometricFunction;

public class RationalHypergeometricFunction extends
                                            HypergeometricFunction<Real,
                                                          RationalFunction,
                                                          RationalNullaryFunction>
{

  // CHANGE: init for constant arg
  public RationalHypergeometricFunction
         init(Fraction α, Fraction β, RationalNullaryFunction constantArg)
  {
    super.init(Real.class,
               RationalFunction.class,
               RationalNullaryFunction.class,
               α,
               β,
               constantArg);
    return this;
  }

  // CHANGE: init for input-dependent arg
  public RationalHypergeometricFunction
         init(Fraction α,
              Fraction β,
              Function<RationalFunction, RationalFunction> inputDependentArg)
  {
    super.init(Real.class,
               RationalFunction.class,
               RationalNullaryFunction.class,
               α,
               β,
               inputDependentArg);
    return this;
  }

  public RationalHypergeometricFunction
         init(Real numerator, Real denominator, RationalNullaryFunction constantArg)
  {
    var α = new Fraction();
    var β = new Fraction();
    α.set(numerator);
    β.set(denominator);
    return init(α, β, constantArg);
  }

  public RationalHypergeometricFunction
         init(Real numerator,
              Real denominator,
              Function<RationalFunction, RationalFunction> inputDependentArg)
  {
    var α = new Fraction();
    var β = new Fraction();
    α.set(numerator);
    β.set(denominator);
    return init(α, β, inputDependentArg);
  }

  public RationalHypergeometricFunction
         init(Integer numerator, Integer denominator, RationalNullaryFunction constantArg)
  {
    var α = new Fraction();
    var β = new Fraction();
    α.set(numerator);
    β.set(denominator);
    return init(α, β, constantArg);
  }

  public RationalHypergeometricFunction
         init(Integer numerator,
              Integer denominator,
              Function<RationalFunction, RationalFunction> inputDependentArg)
  {
    var α = new Fraction();
    var β = new Fraction();
    α.set(numerator);
    β.set(denominator);
    return init(α, β, inputDependentArg);
  }

}
