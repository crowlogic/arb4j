package arb;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class RealConstants
{
  static
  {
    System.loadLibrary("arblib");
  }

  public static final int           prec       = 256;

  public static final Real          constants  = Real.newAlignedVector(17);

  private static final RealIterator enumerator = constants.iterator();

  private static Real next()
  {
    return enumerator.next();
  }

  public static Real half          = next().one().div(2, prec);
  public static Real one           = next().one();
  public static Real zero          = next().zero();
  public static Real posInf        = next().posInf();
  public static Real π             = next().π(prec);
  public static Real πsquared      = next().set(π).pow(2, prec);
  public static Real sqrtπ         = next().set(π).sqrt(prec);
  public static Real sqrt2π        = next().set(π).mul(2, prec).sqrt(prec);
  public static Real sqrt2         = next().set(2).sqrt(prec);
  public static Real negOne        = next().set(-1);
  public static Real twoπ          = next().set(2).mul(π, prec);
  public static Real indeterminant = next().indeterminate();
  public static Real two           = next().set(2);
  public static Real negInf        = next().negInf();
  public static Real negHalf       = next().one().div(2, prec).neg();
  public static Real oneQuarter    = next().one().div(4, prec);
  public static Real threeQuarters = next().set(3).div(4, prec);

  static
  {
    constants.lock();
  }

  public static void main(String args[])
  {
    System.out.println(constants);
  }

}
