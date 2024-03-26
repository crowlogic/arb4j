package arb.documentation;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Terms implements
                   Notion,
                   Term
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
