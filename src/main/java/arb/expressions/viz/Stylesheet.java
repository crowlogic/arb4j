package arb.expressions.viz;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Stylesheet
{

  public static final String DarkerStyle = ".scroll-bar .thumb {\n"
                                                             + "    -fx-background-color: #808080; /* Change this to your desired thumb color */\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".scroll-bar .increment-button, .scroll-bar .decrement-button {\n"
                                                             + "    -fx-background-color: #a9a9a9; /* Change this to your desired button color */\n"
                                                             + "}\n"
                                                             + ".tree-table-view .column-resize-line {\n"
                                                             + "    -fx-background-color: #ff0000; /* Change this to your desired color */\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".tree-table-view .tree-table-row-cell .tree-table-cell .text {\n"
                                                             + "    -fx-font-size: 18px; /* This specifically targets TreeTableView cells */\n"
                                                             + "    -fx-fill: #ffff00; /* Change this to your desired color */\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".root {\n"
                                                             + "    -fx-font-weight: bold; /* Make font bold */\n"
                                                             + "  -fx-font-size: 18px; /* Change this value to increase/decrease the font size */\n"
                                                             + "  -fx-base: #1f273f;\n"
                                                             + "  -fx-default-button: #7f878f;\n"
                                                             + "  -fx-focus-color: #efefef;\n"
                                                             + "  -fx-focused-text-base-color: ladder(-fx-selection-bar, -fx-light-text-color 45%, -fx-dark-text-color\n"
                                                             + "    46%, -fx-dark-text-color 59%, -fx-mid-text-color 60%);\n"
                                                             + "  -fx-focused-mark-color: -fx-focused-text-base-color;\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".text-input:focused {\n"
                                                             + "  -fx-highlight-text-fill: ladder(-fx-highlight-fill, -fx-light-text-color 45%, -fx-dark-text-color\n"
                                                             + "    46%, -fx-dark-text-color 59%, -fx-mid-text-color 60%);\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".chart-legend-item {\n"
                                                             + "  -fx-font-size: 20px;\n"
                                                             + "  font-size: 20px;\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".chart-datapoint-tooltip-label {\n"
                                                             + "  -fx-font-size: 20px;\n"
                                                             + "  font-size: 20px;}\n"
                                                             + ".tree-table-row-cell { -fx-border-color: #CCCCCC; -fx-border-width: 0 0 1 0; }\n";

  public Stylesheet()
  {
    // TODO Auto-generated constructor stub
  }

  public static String convertStylesheetToDataURI(String CSS_CONTENT)
  {
    String encoded = Base64.getEncoder().encodeToString(CSS_CONTENT.getBytes(StandardCharsets.UTF_8));
    return "data:text/css;base64," + encoded;
  }

}
