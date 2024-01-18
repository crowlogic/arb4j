package arb;

import org.scilab.forge.jlatexmath.LaTeXAtom;

/**
 * instances of {@link Class}es implement this to provide {@link LaTeXAtom}
 */
public interface Typesettable
{
  /**
   * 
   * @return a LaTeX {@link String} representation of this
   */
  public String typeset();
}
