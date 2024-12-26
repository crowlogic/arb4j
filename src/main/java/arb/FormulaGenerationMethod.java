package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public enum FormulaGenerationMethod
{
 Gaussians,
 Quadratics,
 Cyclotomics,
 Cubics,
 Quartics,
 Quintics,
 Depression,
 Deflation,
 Separation,
 RESERVED1,
 RESERVED2,
 ExponentialForm,
 TrigonometricForm,
 RadicalForm,
 All,
 AutomaticForm;

  public long value()
  {
    if (this == All)
    {
      return Separation.value() * 2 - 1;
    }
    else if (this == AutomaticForm)
    {
      return 0;
    }
    else
    {
      return 2 ^ ordinal();
    }
  }
// ordinal                                 value
//  0  #define QQBAR_FORMULA_GAUSSIANS    1
//  1  #define QQBAR_FORMULA_QUADRATICS   2
//  2  #define QQBAR_FORMULA_CYCLOTOMICS  4
//  3  #define QQBAR_FORMULA_CUBICS       8
//  4  #define QQBAR_FORMULA_QUARTICS     16
//  5  #define QQBAR_FORMULA_QUINTICS     32
//  6  #define QQBAR_FORMULA_DEPRESSION   64
//  7  #define QQBAR_FORMULA_DEFLATION    128
//  8  #define QQBAR_FORMULA_SEPARATION   256
//  9     RESERVED1                       512
//  10    RESERVED2                       1024
//  11 #define QQBAR_FORMULA_EXP_FORM     2048
//  12 #define QQBAR_FORMULA_TRIG_FORM    4096
//  13 #define QQBAR_FORMULA_RADICAL_FORM 8192
//  #define QQBAR_FORMULA_AUTO_FORM       0
//
//  #define QQBAR_FORMULA_ALL ((2 * QQBAR_FORMULA_SEPARATION - 1) | QQBAR_FORMULA_AUTO_FORM)

}
