package arb.language;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Notion;

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
