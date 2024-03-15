package arb.utensils.treetext;

import org.junit.Test;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTableTest extends
                           TestCase
{

  public void testPrintTableWithThreeColumns()
  {
    String[]   titles =
    { "column1", "column2", "column3" };
    String[][] data   =
    {
      { "val10", "val20", "val30" },
      { "val13", "val20", "val30" },
      { "val12", "val21", "val31" },
      { "val11", "val21", "val31" },
      { "val12", "val25", "val31" },
      { "val11", "val21", "val31" }, };
    TextTable  tt     = new TextTable(titles,
                                      data);
//		tt.setAddRowNumbering(true);
//		tt.addSeparatorPolicy(new LastRowSeparatorPolicy());
    tt.setSort(0);
    tt.printTable();
  }

  @Test
  public void printTableWithTwoColumns()
  {
    String[]   titles =
    { "column1", "column2" };
    String[][] data   =
    {
      { "val10", "val20" },
      { "val13", "val20" },
      { "val12", "val21" },
      { "val11", "val21" },
      { "val12", "val25" },
      { "val11", "val21" }, };
    TextTable  tt     = new TextTable(titles,
                                      data);
//		tt.setAddRowNumbering(true);
//		tt.addSeparatorPolicy(new LastRowSeparatorPolicy());
    tt.setSort(0);
    tt.printTable();
  }

  @Test
  public void printTableWithOneColumn()
  {
    String[]   titles =
    { "column1" };
    String[][] data   =
    {
      { "val10" },
      { "val13" },
      { "val12" },
      { "val11" },
      { "val12" },
      { "val11" }, };
    TextTable  tt     = new TextTable(titles,
                                      data);
//		tt.setAddRowNumbering(true);
//		tt.addSeparatorPolicy(new LastRowSeparatorPolicy());
    tt.setSort(0);
    tt.printTable();
  }
}
