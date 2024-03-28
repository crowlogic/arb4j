package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerConstants

{
  public static final int  ARB_STR_CONDENSE  = 16;
  public static final int  ARB_STR_NO_RADIUS = 2;
  public static final int  ARB_STR_MORE      = 1;
  public static final int  MAG_BITS          = 30;
  public static final int  ARF_RND_DOWN      = RoundingMode.Down.ordinal();
  public static final int  ARF_RND_UP        = RoundingMode.Up.ordinal();;
  public static final int  ARF_RND_FLOOR     = RoundingMode.Floor.ordinal();
  public static final int  ARF_RND_CEIL      = RoundingMode.Ceiling.ordinal();
  public static final int  ARF_RND_NEAR      = RoundingMode.Near.ordinal();
  public static final int  FMPR_RND_DOWN     = ARF_RND_DOWN;
  public static final int  FMPR_RND_UP       = ARF_RND_UP;
  public static final int  FMPR_RND_FLOOR    = ARF_RND_FLOOR;
  public static final int  FMPR_RND_CEIL     = ARF_RND_CEIL;
  public static final int  FMPR_RND_NEAR     = ARF_RND_NEAR;
  public static final int  ARB_RND           = ARF_RND_DOWN;
  public static final int  FLINT_BITS        = 64;
  public static final long PAGESIZE          = arblib.getpagesize();

}
