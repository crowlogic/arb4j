package arb.documentation;

import arb.documentation.references.Reference;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PageReferral implements Reference
{
  @Override
  public String toString()
  {
    return String.format("%s p. %s", of, page );
  }

  public PageReferral(String page, Reference of)
  {
    super();
    this.page = page;
    this.of   = of;
  }

  String page;
  
  Reference of ;

  @Override
  public String year()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String title()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String cite(String by)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String author()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Reference setVolume(String volume)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Reference setPublisher(String string)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Reference setAddress(String address)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }
}
