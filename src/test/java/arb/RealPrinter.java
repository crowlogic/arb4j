package arb;


public class RealPrinter
{
//  public static ArbStrParts arbGetStrParts(Real x, long n, boolean more)
//  {
//    ArbStrParts parts = new ArbStrParts();
//    parts.midExp = arblib.fmpz_init();
//    parts.radExp = arblib.fmpz_init();
//
//    if (!x.isFinite())
//    {
//      parts.negative = false;
//      arblib.fmpz_zero(parts.midExp);
//      parts.midDigits = x.getMid().isNotANumber() ? "nan" : "0";
//      arblib.fmpz_zero(parts.radExp);
//      parts.radDigits = "inf";
//      return parts;
//    }
//
//    long midPtr = arblib.fmpz_init();
//    long radPtr = arblib.fmpz_init();
//    long expPtr = arblib.fmpz_init();
//    long errPtr = arblib.fmpz_init();
//
//    if (!more)
//    {
//      long good = (long) (arblib.arb_rel_accuracy_bits(x) * 0.30102999566398119521 + 2);
//      n = Math.min(n, good);
//    }
//
//    arblib.arb_get_fmpz_mid_rad_10exp(midPtr, radPtr, expPtr, x, Math.max(n, 1));
//    parts.negative = arblib.arf_sgn(arblib.arb_midref(x)) < 0;
//    arblib.fmpz_abs(midPtr, midPtr);
//
//    parts.midDigits = arblib.fmpz_get_str(midPtr, 10);
//    parts.radDigits = null;
//
//    if (n >= 1 && !(more || arblib.fmpz_is_zero(radPtr)))
//    {
//      long lenmid = parts.midDigits.length();
//      long lenrad = arblib.fmpz_get_str(radPtr, 10).length();
//      long rem, good;
//
//      if (lenmid > lenrad)
//      {
//        good = lenmid - lenrad;
//        rem  = parts.midDigits.charAt((int) good) - '0';
//        rem  = (rem < 5) ? rem + 1 : 10 - rem;
//        rem  = rem + arblib.fmpz_get_str(radPtr, 10).charAt(0) - '0' + 1;
//        if (rem > 10)
//          good -= 1;
//        n = Math.min(n, good);
//      }
//      else
//      {
//        n = 0;
//      }
//    }
//
//    if (n < 1)
//    {
//      arblib.fmpz_add(radPtr, radPtr, midPtr);
//      arblib.fmpz_zero(midPtr);
//      parts.midDigits = "0";
//    }
//    else
//    {
//      arblib._arb_digits_round_inplace(parts.midDigits, shiftPtr, errPtr, n, arblib.ARF_RND_NEAR);
//      arblib.fmpz_add_ui(parts.midExp, expPtr, shift);
//      arblib.fmpz_abs(errPtr, errPtr);
//      arblib.fmpz_add(radPtr, radPtr, errPtr);
//    }
//
//    if (arblib.fmpz_is_zero(radPtr))
//    {
//      parts.radDigits = arblib.fmpz_get_str(radPtr, 10);
//      arblib.fmpz_zero(parts.radExp);
//    }
//    else
//    {
//      parts.radDigits = arblib.fmpz_get_str(radPtr, 10);
//      arblib._arb_digits_round_inplace(parts.radDigits, shiftPtr, errPtr, arblib.RADIUS_DIGITS, arblib.ARF_RND_UP);
//      arblib.fmpz_add_ui(parts.radExp, expPtr, shift);
//    }
//
//    arblib.fmpz_clear(midPtr);
//    arblib.fmpz_clear(radPtr);
//    arblib.fmpz_clear(expPtr);
//    arblib.fmpz_clear(errPtr);
//
//    return parts;
//  }
//
//  public static class ArbStrParts
//  {
//    boolean negative;
//    String  midDigits;
//    String  radDigits;
//    long    midExp;
//    long    radExp;
//  }
}
