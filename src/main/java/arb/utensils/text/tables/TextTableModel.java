package arb.utensils.text.tables;

import javax.swing.table.AbstractTableModel;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class TextTableModel extends
                                     AbstractTableModel
{

  /**
   * 
   */
  private static final long serialVersionUID = -663028121137688537L;

  public abstract boolean allowNumberingAt(int row);

  public abstract boolean addSeparatorAt(int row);
}
