package arb.theorems;

import java.util.Collections;
import java.util.List;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;
import arb.logic.Proposition;
import eu.hoefel.jatex.LatexPackage;
import eu.hoefel.jatex.LatexPreambleEntry;
import eu.hoefel.jatex.Texable;

/**
 * A {@link Theorem} is a {@link Proposition} deducible from basic postulates.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Theorem<W extends Word, S extends Sentence<? extends W>> extends Proposition<W, S>, Texable
{
  /**
   * Example implementation of Texable interface for a Theorem, should be
   * customized based on actual content.
   */

  @Override
  default List<LatexPackage> neededPackages()
  {
    return Collections.singletonList(new LatexPackage("amsthm"));
  }

  @Override
  default List<LatexPreambleEntry> preambleExtras()
  {
    // Add any preamble extras needed for the theorem
    return Collections.emptyList();
  }

  @Override
  default List<String> latexCode()
  {
    return List.of("\\begin{theorem}", state(), "\\end{theorem}");
  }

  String state();
}
