package arb.documentation;

import java.util.List;
import java.util.stream.Collectors;

import eu.hoefel.jatex.LatexPackage;
import eu.hoefel.jatex.LatexPreambleEntry;
import eu.hoefel.jatex.Texable;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Document extends Texable
{

  @Override
  default List<LatexPackage> neededPackages()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  default List<LatexPreambleEntry> preambleExtras()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  default List<String> latexCode()
  {
    assert false : "TODO";
    return null;
  }

  public default String getText()
  {
    return latexCode().stream().collect(Collectors.joining());
  }
}
