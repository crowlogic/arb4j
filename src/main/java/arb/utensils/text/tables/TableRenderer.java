package arb.utensils.text.tables;

import java.io.OutputStream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface TableRenderer
{
  public void render(OutputStream ps, int indent);

}
