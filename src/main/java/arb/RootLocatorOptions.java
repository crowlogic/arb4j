package arb;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RootLocatorOptions
{
  @Override
  public String toString()
  {
    return "RootLocatorOptions[interval=" + interval + ", maxdepth=" + maxDepth + ", maxevals=" + maxEvals
                  + ", maxfound=" + maxFound + ", prec=" + prec + "]";
  }

  public RealRootInterval interval;
  public int              maxDepth;
  public int              maxEvals;
  public int              maxFound;
  public int              prec;

  public RootLocatorOptions(RealRootInterval interval,
                            int maxdepth,
                            int maxevals,
                            int maxfound,
                            int prec)
  {
    super();
    assert maxevals > 1 : "it makes no sense to set maxevals less than 1";
    assert maxdepth > 1 : "its pointless to call this function if maxdepth<1";
    this.interval = interval;
    this.maxDepth = maxdepth;
    this.maxEvals = maxevals;
    this.maxFound = maxfound;
    this.prec     = prec;
  }
}
