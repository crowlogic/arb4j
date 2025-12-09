package arb;

import org.scilab.forge.jlatexmath.LaTeXAtom;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * instances of {@link Class}es implement this to provide {@link LaTeXAtom}
 * 
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Typesettable
{
  /**
   * 
   * @return a LaTeX {@link String} representation of this
   */
  public String typeset();
}
