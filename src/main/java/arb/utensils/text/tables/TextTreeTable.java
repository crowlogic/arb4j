package arb.utensils.text.tables;

import java.io.PrintStream;

import javax.swing.table.TableModel;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTreeTable extends
                           TextTable
{

  protected int hierarchicalColumn;

  public TextTreeTable(String[] columnNames, String[][] data)
  {
    super(columnNames,
          data);
    addSeparatorPolicy(new TreeTableSeparatorPolicy());
  }

  public TextTreeTable(TableModel tableModel, boolean addNumbering)
  {
    super(tableModel,
          addNumbering);
    addSeparatorPolicy(new TreeTableSeparatorPolicy());
  }

  public TextTreeTable(TableModel tableModel)
  {
    super(tableModel);
    addSeparatorPolicy(new TreeTableSeparatorPolicy());
  }

  protected void setHierarchicalColumn(int hierarchicalColumn)
  {
    this.hierarchicalColumn = hierarchicalColumn;
  }

  @Override
  public void printTable(PrintStream ps, int indent)
  {
    TextTableRenderer renderer = new TextTreeTableRenderer(this);
    renderer.render(ps, indent);
  }

  private class TreeTableSeparatorPolicy extends
                                         TextTreeLayout
  {

    @Override
    boolean hasSeparatorAt(int row)
    {
      if (row == 0)
        return false;
      Object rowAgo                = getValueAt(row - 1, hierarchicalColumn);
      Object hierarchicalColumnVal = getValueAt(row, hierarchicalColumn);
      // System.out.println(row+ "> "+rowAgo+"-"+hierarchicalColumnVal);
      if (!hierarchicalColumnVal.equals(rowAgo))
      {
        return true;
      }
      return false;
    }

  }

}
