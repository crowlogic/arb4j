package arb.utensils.treetext;

import javax.swing.table.TableModel;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class TextTreeLayout
{

  protected TableModel tableModel;

  public TextTreeLayout()
  {
  }

  public TextTreeLayout(TableModel tableModel)
  {
    this.tableModel = tableModel;
  }

  public TableModel getTableModel()
  {
    return tableModel;
  }

  public void setTableModel(TableModel tableModel)
  {
    this.tableModel = tableModel;
  }

  abstract boolean hasSeparatorAt(int row);
}
