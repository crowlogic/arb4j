package eu.hoefel.jatex;

import eu.hoefel.utils.Strings;
import eu.hoefel.utils.Types;
import java.io.File;
import java.lang.System.Logger.Level;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.stream.Stream;

public final class PgfPlots implements Texable {
   private Map<String, String> options = new HashMap<>();
   private List<String> lines = new ArrayList<>();
   private List<LatexPackage> packages = new ArrayList<>();
   private List<LatexPreambleEntry> preambleEntries = new ArrayList<>();
   private int estimatedNumRows = 0;

   public PgfPlots() {
      this.usePackages(new LatexPackage("pgfplots"));
      this.compat("newest");
   }

   public PgfPlots(PgfPlots plot) {
      this.options = new HashMap<>(plot.options);
      this.lines = new ArrayList<>(plot.lines);
      this.packages.addAll(plot.packages);
      this.preambleEntries.addAll(plot.preambleEntries);
   }

   public PgfPlots add(String line) {
      this.lines.add(line);
      return this;
   }

   public PgfPlots addOptions(Map<String, String> options) {
      this.options.putAll(options);
      return this;
   }

   public PgfPlots grid() {
      this.addOptions(Map.of("grid", "major"));
      return this;
   }

   public PgfPlots xlabel(String label) {
      this.addOptions(Map.of("xlabel", label));
      return this;
   }

   public PgfPlots ylabel(String label) {
      this.addOptions(Map.of("ylabel", label));
      return this;
   }

   public PgfPlots clabel(String label) {
      this.addOptions(Map.of("colorbar style", "{ylabel={%s}}".formatted(label)));
      return this;
   }

   public PgfPlots title(String title) {
      this.addOptions(Map.of("title", "{%s}".formatted(title)));
      return this;
   }

   public <T> PgfPlots plot(T input, String legend) {
      return this.plot(input, legend, Map.of());
   }

   public <T> PgfPlots plot(T input, String legend, Map<String, String> options) {
      boolean hasOptions = options != null && !options.isEmpty();
      String formattedOptions = hasOptions ? "+" + Latex.toOptions(options) + " " : "";
      if (input instanceof String s) {
         String file = new File(s).isFile() ? " file " : " ";
         this.add("\\addplot " + formattedOptions + file + "{" + input + "};");
      } else if (input.getClass().isArray() && Types.dimension(input.getClass()) == 2 && Array.getLength(input) == 2) {
         this.add("\\addplot " + formattedOptions + "coordinates {");

         for(int i = 0; i < Array.getLength(Array.get(input, 0)); ++i) {
            this.add(Latex.indent(1) + "(" + Array.get(Array.get(input, 0), i) + "," + Array.get(Array.get(input, 1), i) + ")");
         }

         this.add("};");
      } else {
         if (!input.getClass().isArray() || Types.dimension(input.getClass()) != 2 || Array.getLength(input) != 3) {
            throw new IllegalArgumentException("Only 2D and 3D arrays are supported");
         }

         this.add("\\addplot3 " + formattedOptions + "coordinates {");
         Set<Object> elems = new HashSet<>();

         for(int i = 0; i < Array.getLength(Array.get(input, 0)); ++i) {
            this.add(
               Latex.indent(1)
                  + "("
                  + Array.get(Array.get(input, 0), i)
                  + ","
                  + Array.get(Array.get(input, 1), i)
                  + ","
                  + Array.get(Array.get(input, 2), i)
                  + ")"
            );
            elems.add(Array.get(Array.get(input, 0), i));
         }

         this.add("};");
         this.estimatedNumRows = elems.size();
      }

      if (legend != null) {
         this.add("\\addlegendentry{%s};".formatted(legend));
      }

      return this;
   }

   public PgfPlots contour(double[] x, double[] y, double[][] z, Map<String, String> options) {
      this.addOptions(Map.of("view", "{0}{90}", "colorbar", ""));
      String[] ssvs = new String[x.length * y.length];
      double[] zFlat = flatten(z);

      for(int i = 0; i < x.length; ++i) {
         for(int j = 0; j < y.length; ++j) {
            ssvs[i * y.length + j] = x[i] + " " + y[j] + " " + zFlat[i * y.length + j];
         }
      }

      boolean hasNumber = Stream.of(options).anyMatch(s -> s.containsKey("contour filled") && s.get("contour filled").contains("{number="));
      boolean hasSamples = Stream.of(options).anyMatch(s -> s.containsKey("samples"));
      boolean hasShader = Stream.of(options).anyMatch(s -> s.containsKey("shader"));
      StringBuilder concatenatedUserOptions = new StringBuilder();

      for(Entry<String, String> option : options.entrySet()) {
         concatenatedUserOptions.append(
            (String)option.getKey() + (Latex.STRING_IS_NOT_BLANK.test(option.getValue()) ? "=" + (String)option.getValue() : "") + ","
         );
      }

      this.add(
         "\\addplot3[surf,mesh/rows="
            + x.length
            + ",mesh/cols="
            + y.length
            + ","
            + concatenatedUserOptions.toString()
            + (!hasNumber ? "contour filled={number=7}," : "")
            + (!hasSamples ? "samples=150," : "")
            + (!hasShader ? "shader=interp," : "")
            + "] table {"
      );
      this.add(Latex.indent(1) + "X Y Z");

      for(String ssv : ssvs) {
         this.add(Latex.indent(1) + ssv);
      }

      this.add("};");
      return this;
   }

   private static final double[] flatten(double[][] a) {
      int size = a.length * a[0].length;
      double[] flat = new double[size];
      int index = 0;

      for(int i = 0; i < a.length; ++i) {
         int numNew = a[i].length;
         System.arraycopy(a[i], 0, flat, index, numNew);
         index += numNew;
      }

      return flat;
   }

   public int exec(String filepath) {
      Latex tex = new Latex();
      tex.compiler(TexCompiler.LUALATEX);
      String folder = new File(filepath).getParent();
      String file = new File(filepath).getName();
      tex.folder(folder);
      tex.filename(file);
      tex.repeat(1);
      tex.clean(true);
      tex.documentclassWithOptions("standalone", Map.of("tikz", ""));
      PgfPlots plot = new PgfPlots(this);
      plot.pgfplotslibraries("colormaps", "colorbrewer");
      plot.addOptions(Map.of("axis on top", "", "axis background/.style", "{fill=white}", "samples", "100", "legend cell align", "left"));
      if (this.estimatedNumRows != 0) {
         plot.addOptions(Map.of("mesh/cols", Integer.toString(this.estimatedNumRows)));
      }

      plot.preambleEntries.add(new LatexPreambleEntry("\\pgfplotsset", Map.of("cycle list/Dark2-8", "")));
      plot.preambleEntries
         .add(new LatexPreambleEntry("\\pgfplotsset", Map.of("cycle multiindex* list", "{mark list*\\nextlist Dark2-8\\nextlist}", "colormap/viridis", "")));
      tex.add(Tikz.of(plot));
      tex.save(Level.ALL);
      if (tex.isExecutable()) {
         return tex.exec();
      } else {
         throw new IllegalStateException(
            "Seems like " + tex.getCompiler() + " is not accessible from Java. Please make sure that it is installed and on the PATH environment variable."
         );
      }
   }

   public static final <T> PgfPlots of(T input, String legend) {
      return new PgfPlots().plot(input, legend, Map.of());
   }

   public static final <T> PgfPlots of(T input, String legend, Map<String, String> options) {
      return new PgfPlots().plot(input, legend, options);
   }

   public static final PgfPlots contourOf(double[] x, double[] y, double[][] z, Map<String, String> options) {
      return new PgfPlots().contour(x, y, z, options);
   }

   public PgfPlots tikzlibraries(String... libraries) {
      this.preambleEntries.add(new LatexPreambleEntry("\\usetikzlibrary", Strings.mapOf(libraries), false));
      return this;
   }

   public PgfPlots pgflibraries(String... libraries) {
      this.preambleEntries.add(new LatexPreambleEntry("\\usepgflibrary", Strings.mapOf(libraries), false));
      return this;
   }

   public PgfPlots pgfplotslibraries(String... libraries) {
      this.preambleEntries.add(new LatexPreambleEntry("\\usepgfplotslibrary", Strings.mapOf(libraries), false));
      return this;
   }

   public PgfPlots gdlibraries(String... libraries) {
      this.preambleEntries.add(new LatexPreambleEntry("\\usegdlibrary", Strings.mapOf(libraries), false));
      return this;
   }

   public PgfPlots compat(String compat) {
      this.preambleEntries.add(new LatexPreambleEntry("\\pgfplotsset", Map.of("compat", compat), false));
      return this;
   }

   public PgfPlots usePackages(LatexPackage... packages) {
      this.packages.addAll(List.of(packages));
      return this;
   }

   public PgfPlots usePackageWithOptions(String packageName, Map<String, String> options) {
      this.packages.add(new LatexPackage(packageName, options));
      return this;
   }

   @Override
   public List<LatexPackage> neededPackages() {
      return this.packages;
   }

   @Override
   public List<LatexPreambleEntry> preambleExtras() {
      return this.preambleEntries;
   }

   @Override
   public List<String> latexCode() {
      List<String> ret = new ArrayList<>();
      ret.add("\\begin{axis}");
      ret.add(Latex.indent(1) + "[");

      for(Entry<String, String> option : this.options.entrySet()) {
         ret.add(Latex.indent(2) + (String)option.getKey() + (Latex.STRING_IS_NOT_BLANK.test(option.getValue()) ? "=" + (String)option.getValue() : "") + ",");
      }

      ret.add(Latex.indent(1) + "]");
      ret.add("");

      for(String line : this.lines) {
         ret.add(Latex.indent(1) + line);
      }

      ret.add("\\end{axis}");
      return ret;
   }
}
