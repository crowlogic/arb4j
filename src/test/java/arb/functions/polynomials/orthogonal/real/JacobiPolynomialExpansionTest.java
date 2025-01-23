package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class JacobiPolynomialExpansionTest extends
                                           TestCase
{

  public static void main(String args[])
  {
    // this should come out looking like arctanh
    var coeffs = Real.newVector(18);
    coeffs.get(0).set("0", 128);
    coeffs.get(1).set("1.57079632679489661923132169164", 128);
    coeffs.get(2).set("0", 128);
    coeffs.get(3).set("0.327249234748936795673192019093", 128);
    coeffs.get(4).set("0", 128);
    coeffs.get(5).set("0.154625263418872635955583229021", 128);
    coeffs.get(6).set("0", 128);
    coeffs.get(7).set("0.0940111082861342982212942251275", 128);
    coeffs.get(8).set("0", 128);
    coeffs.get(9).set("0.0647414460998262817611922036467", 128);
    coeffs.get(10).set("0", 128);
    coeffs.get(11).set("0.0480344076331562350835622320857", 128);
    coeffs.get(12).set("0", 128);
    coeffs.get(13).set("0.0374528634467102054861354928430", 128);
    coeffs.get(14).set("0", 128);
    coeffs.get(15).set("0.0302565632558780302891566017182", 128);
    coeffs.get(16).set("0", 128);
    coeffs.get(17).set("0.0251020200671198299517251326431", 128);
    RealFunction expansion = new JacobiPolynomialExpansion(coeffs);
    var          y         = expansion.eval(0.76);
    System.out.println("y(0.76)=" + y);
  }

}
