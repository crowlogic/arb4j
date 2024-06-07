package arb.utensils.text.tables;

import java.io.PrintStream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTreeTableRenderer extends
                                   TextTableRenderer
{

  public TextTreeTableRenderer(TextTreeTable textTable)
  {
    super(textTable);
  }

  private TextTreeTable getTextTreeTable()
  {
    return (TextTreeTable) textTable;
  }

  @Override
  protected void printValue(PrintStream ps, int row, int col, boolean c)
  {
    boolean empty = false;
    if (row != 0 && col == getTextTreeTable().hierarchicalColumn && !textTable.hasSeparatorAt(row))
    {
      empty = true;
    }
    super.printValue(ps, row, col, empty);
  }
}
