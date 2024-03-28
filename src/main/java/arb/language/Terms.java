package arb.language;

import arb.Notion;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Terms implements
                   Notion,
                   RegularTerm
{

  final public String definition;

  public Terms(String definition)
  {
    this.definition = definition;
  }

  @Override
  public String getDefinition()
  {
    return definition;
  }

}
