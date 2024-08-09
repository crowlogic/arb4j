package eu.hoefel.jatex;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

public final class Table implements Texable {
   public static final String LABEL_NAMESPACE = "tab:";
   private String format;
   private int numCols = 0;
   private int numRows = 0;
   private int definedNumCols;
   private boolean useTable;
   private String label = null;
   private String caption = null;
   private String captionShort = null;
   private Table.TableEnvironment env;
   private Map<Integer, Boolean> midRuleExtra = new HashMap<>();
   private int endHead = -1;
   private boolean centering;
   private String position = null;
   private Map<Integer, Map<Integer, String>> entry = new HashMap<>();
   private Map<Integer, Map<Integer, Boolean>> active = new HashMap<>();
   private Map<Integer, Map<Integer, Boolean>> useAmpersand = new HashMap<>();
   private Map<Integer, Map<Integer, Integer>> width = new HashMap<>();
   private Map<Integer, Map<Integer, String>> color = new HashMap<>();
   private List<LatexPackage> packages = new ArrayList<>();
   private List<LatexPreambleEntry> preambleExtras = new ArrayList<>();

   public Table() {
      this.centering();
      this.usePackages(new LatexPackage("booktabs"), new LatexPackage("longtable"), new LatexPackage("caption"), new LatexPackage("multirow"));
      this.usePackageWithOptions("xcolor", Map.of("table", ""));
      this.floating(true);
      this.environment(Table.TableEnvironment.TABULAR);
   }

   public Table environment(Table.TableEnvironment env) {
      this.env = env;
      return this;
   }

   public Table.TableEnvironment getEnvironment() {
      return this.env;
   }

   public Table position(String position) {
      if (!"!".equals(position) && !"h".equals(position) && !"t".equals(position) && !"b".equals(position) && !"p".equals(position)) {
         throw new IllegalArgumentException("Unknown position argument for table");
      } else {
         this.position = position;
         return this;
      }
   }

   private void calculateNumRowsCols() {
      this.numCols = 0;
      this.numRows = 0;

      for(Entry<Integer, Map<Integer, Boolean>> col : this.active.entrySet()) {
         for(Entry<Integer, Boolean> row : col.getValue().entrySet()) {
            if (Boolean.TRUE.equals(row.getValue())) {
               this.numCols = Math.max(this.numCols, col.getKey());
               this.numRows = Math.max(this.numRows, row.getKey());
            }
         }
      }

      ++this.numCols;
      ++this.numRows;
      if (this.numCols > this.definedNumCols) {
         throw new IllegalArgumentException("More columns requested than defined: " + this.numCols + " > " + this.definedNumCols);
      } else {
         for(int i = 0; i < this.numCols; ++i) {
            boolean val = i != this.numCols - 1;

            for(int j = 0; j < this.numRows; ++j) {
               Map<Integer, Boolean> innerMap = this.useAmpersand.getOrDefault(i, new HashMap<>());
               innerMap.putIfAbsent(j, val);
               this.useAmpersand.put(i, innerMap);
            }
         }

         int colorCommandLength = "{\\cellcolor{}}".length();

         for(int i = 0; i < this.numCols; ++i) {
            if (!this.entry.containsKey(i)) {
               for(int j = 0; j < this.numRows; ++j) {
                  Map<Integer, Integer> innerMap = this.width.getOrDefault(i, new HashMap<>());
                  innerMap.put(j, 0);
                  this.width.put(i, innerMap);
               }
            } else {
               int max = 0;

               for(Entry<Integer, String> w : this.entry.get(i).entrySet()) {
                  int colorlength = 0;
                  if (this.color.containsKey(i) && this.color.get(i).containsKey(w.getKey())) {
                     colorlength = colorCommandLength + this.color.get(i).get(w.getKey()).length();
                  }

                  max = Math.max(max, w.getValue().length() + colorlength);
               }

               for(int j = 0; j < this.numRows; ++j) {
                  int w = 0;
                  if (this.entry.get(i).containsKey(j)) {
                     w += this.entry.get(i).get(j).length();
                  }

                  if (this.color.containsKey(i) && this.color.get(i).containsKey(j)) {
                     w += colorCommandLength + this.color.get(i).get(j).length();
                  }

                  Map<Integer, Integer> innerMap = this.width.getOrDefault(i, new HashMap<>());
                  innerMap.put(j, max - w);
                  this.width.put(i, innerMap);
               }
            }
         }
      }
   }

   public Table entry(int col, int row, String entry) {
      this.entry.computeIfAbsent(col, HashMap::new).put(row, entry);
      this.activateCells(col, row, entry);
      return this;
   }

   public Table color(int col, int row, String color) {
      this.color.computeIfAbsent(col, HashMap::new).put(row, color);
      this.activateCells(col, row, color);
      return this;
   }

   private void activateCells(int col, int row, String str) {
      this.active.computeIfAbsent(col, HashMap::new).put(row, true);
      String multirow = "\\multirow{";
      if (str.contains(multirow)) {
         int start = str.indexOf(multirow) + multirow.length();
         int end = str.indexOf(125, start);
         int addrows = Integer.parseInt(str.substring(start, end));

         for(int i = 0; i < addrows; ++i) {
            this.active.computeIfAbsent(col, HashMap::new).put(row + i, true);
            this.useAmpersand.computeIfAbsent(col, HashMap::new).put(row + i, true);
         }
      }

      String multicolumn = "\\multicolumn{";
      if (str.contains(multicolumn)) {
         int start = str.indexOf(multicolumn) + multicolumn.length();
         int end = str.indexOf(125, start);
         int addcols = Integer.parseInt(str.substring(start, end));

         for(int i = 0; i < addcols; ++i) {
            this.active.computeIfAbsent(col + i, HashMap::new).put(row, true);
            this.useAmpersand.computeIfAbsent(col + i, HashMap::new).put(row, false);
         }
      }
   }

   public Table row(int row, String... cells) {
      for(int i = 0; i < cells.length; ++i) {
         this.entry(i, row, cells[i]);
      }

      return this;
   }

   public Table column(int col, String... cells) {
      for(int i = 0; i < cells.length; ++i) {
         this.entry(col, i, cells[i]);
      }

      return this;
   }

   public Table column(int col, int row, String... cells) {
      for(int i = 0; i < cells.length; ++i) {
         this.entry(col, row + i, cells[i]);
      }

      return this;
   }

   public boolean isCentering() {
      return this.centering;
   }

   public Table centering(boolean centering) {
      this.centering = centering;
      return this;
   }

   public Table centering() {
      return this.centering(true);
   }

   public Table midrule(int row) {
      this.midRuleExtra.put(row, true);
      return this;
   }

   public Table endHead(int row) {
      this.endHead = row;
      return this;
   }

   public Table format(String... formats) {
      String[] formatsTrimmed = new String[formats.length];

      for(int i = 0; i < formatsTrimmed.length; ++i) {
         formatsTrimmed[i] = formats[i].trim();
      }

      this.format = String.join(" ", formatsTrimmed);
      this.definedNumCols = formatsTrimmed.length;
      return this;
   }

   public Table floating(boolean floating) {
      this.useTable = floating;
      return this;
   }

   public boolean isFloating() {
      return this.useTable;
   }

   public String getCaption() {
      return this.caption;
   }

   public Table caption(String caption) {
      this.caption = caption;
      return this;
   }

   public String getCaptionShort() {
      return this.captionShort;
   }

   public Table captionShort(String captionShort) {
      this.captionShort = captionShort;
      return this;
   }

   public String getLabel() {
      return this.label;
   }

   public Table label(String label) {
      this.label = label;
      return this;
   }

   public static String multirow(int numRows, String width, String content) {
      return "\\multirow{%d}{%s}{%s}".formatted(numRows, width, content);
   }

   public static String multirow(int numRows, String content) {
      return "\\multirow{%d}{*}{%s}".formatted(numRows, content);
   }

   public static String multicolumn(int numCols, String alignment, String content) {
      return "\\multicolumn{%d}{%s}{%s}".formatted(numCols, alignment, content);
   }

   public Table usePackages(LatexPackage... packages) {
      this.packages.addAll(List.of(packages));
      return this;
   }

   public Table usePackageWithOptions(String packageName, Map<String, String> options) {
      this.packages.add(new LatexPackage(packageName, options));
      return this;
   }

   @Override
   public List<LatexPackage> neededPackages() {
      return this.packages;
   }

   @Override
   public List<LatexPreambleEntry> preambleExtras() {
      return this.preambleExtras;
   }

   @Override
   public List<String> latexCode() {
      if (!this.isFloating()) {
         this.label(null);
      }

      this.calculateNumRowsCols();
      List<String> ret = new ArrayList<>();
      int n = 1;
      if (this.isFloating()) {
         ret.add(Latex.indent(n) + "\\begin{table}[" + (this.position != null ? this.position : "") + "]%");
         if (this.centering) {
            ret.add(Latex.indent(n) + "\\centering");
         }

         if (this.caption != null) {
            ret.add(Latex.indent(n + 1) + "\\caption" + (this.captionShort != null ? "[" + this.captionShort + "]" : "") + "{" + this.caption + "}%");
         }

         if (this.label != null) {
            ret.add("%s\\label{%s%s}%%".formatted(Latex.indent(n + 1), "tab:", this.label));
         }

         ++n;
      } else if (this.centering) {
         ret.add(Latex.indent(n) + "{\\centering");
      }

      ret.add(Latex.indent(n) + "\\begin{" + this.env.name().toLowerCase(Locale.ENGLISH) + "}{" + this.format + "}\\toprule");

      for(int i = 0; i < this.numRows; ++i) {
         StringBuilder str = new StringBuilder();
         str.append(Latex.indent(n + 1));

         for(int j = 0; j < this.numCols; ++j) {
            if (this.color.containsKey(j) && this.color.get(j).containsKey(i)) {
               str.append("{\\cellcolor{" + (String)this.color.get(j).get(i) + "}}");
            }

            if (this.entry.containsKey(j) && this.entry.get(j).containsKey(i)) {
               str.append(this.entry.get(j).get(i));
            }

            str.append(" ".repeat(this.width.get(j).get(i)));
            if (Boolean.TRUE.equals(this.useAmpersand.get(j).get(i))) {
               str.append(" & ");
            }
         }

         str.append(
            " \\tabularnewline"
               + (this.midRuleExtra.containsKey(i) ? "\\midrule" : "")
               + (i == this.endHead && this.env == Table.TableEnvironment.LONGTABLE ? "\\endhead" : "")
               + (i == this.numRows - 1 ? "\\bottomrule" : "")
         );
         ret.add(str.toString());
      }

      ret.add(Latex.indent(n) + "\\end{" + this.env.name().toLowerCase(Locale.ENGLISH) + "}");
      if (this.isFloating()) {
         ret.add(Latex.indent(n - 1) + "\\end{table}");
      } else if (this.centering) {
         ret.add(Latex.indent(n) + "}");
      }

      return ret;
   }

   public static enum TableEnvironment {
      TABULAR,
      LONGTABLE;
   }
}
