package arb.utensils.treetext;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTableExample
{

  public static void main(String[] args)
  {
    String[]   columnNames =
    { "n", "Double Factorial (2n-1)!!", "Factorization" };

    Object[][] data        =
    {
      { "01", "1", "1" },
      { "02", "1", "1" },
      { "03", "3", "3" },
      { "04", "15", "3 * 5" },
      { "05", "105", "3 * 5 * 7" },
      { "06", "945", "3^3 * 5 * 7" },
      { "07", "10395", "3^3 * 5 * 7 * 11" },
      { "08", "135135", "3^3 * 5 * 7 * 11 * 13" },
      { "09", "2027025", "3^4 * 5^2 * 7 * 11 * 13" },
      { "10", "34459425", "3^4 * 5^2 * 7 * 11 * 13 * 17" },
      { "11", "654729075", "3^4 * 5^2 * 7 * 11 * 13 * 17 * 19" },
      { "12", "13749310575", "3^5 * 5^2 * 7^2 * 11 * 13 * 17 * 19" },
      { "13", "316234143225", "3^5 * 5^2 * 7^2 * 11 * 13 * 17 * 19 * 23" },
      { "14", "7905853580625", "3^5 * 5^4 * 7^2 * 11 * 13 * 17 * 19 * 23" },
      { "15", "213458046676875", "3^8 * 5^4 * 7^2 * 11 * 13 * 17 * 19 * 23" } };

    TextTable  tt          = new TextTable(columnNames,
                                           data);
    tt.setAddRowNumbering(true);
    tt.setSort(0); // Assuming you want to sort by the first column, which is 'n'
    tt.printTable();
  }

}
