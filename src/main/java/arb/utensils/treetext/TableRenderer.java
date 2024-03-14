package arb.utensils.treetext;

import java.io.OutputStream;
import java.io.Writer;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface TableRenderer
{
  public void render(OutputStream ps, int indent);

  public void render(Writer w, int indent);
}
