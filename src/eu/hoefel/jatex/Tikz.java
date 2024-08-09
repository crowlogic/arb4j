package eu.hoefel.jatex;

import eu.hoefel.utils.Strings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public final class Tikz implements Texable {
   private List<String> options = new ArrayList<>();
   private List<String> lines = new ArrayList<>();
   private String fname = null;
   private List<LatexPackage> packages = new ArrayList<>();
   private List<LatexPreambleEntry> preambleEntries = new ArrayList<>();

   public Tikz() {
      this.usePackages(new LatexPackage("tikz"), new LatexPackage("pgf"));
   }

   public Tikz plot(PgfPlots plot) {
      this.packages.addAll(plot.neededPackages());
      this.preambleEntries.addAll(plot.preambleExtras());
      this.lines.addAll(plot.latexCode());
      return this;
   }

   public Tikz filename(String fname) {
      this.fname = fname;
      return this;
   }

   public Tikz add(String... lines) {
      Collections.addAll(this.lines, lines);
      return this;
   }

   public Tikz addOptions(String... options) {
      for(String option : options) {
         if (!this.options.contains(option)) {
            this.options.add(option);
         }
      }

      return this;
   }

   public Tikz node(String name, String label, String... options) {
      return this.node(name, null, label, options);
   }

   public Tikz node(String name, String at, String label, String... options) {
      this.add("\\node[%s] %s(%s) {%s};".formatted(String.join(",", options), Latex.STRING_IS_NOT_BLANK.test(at) ? "at (" + at + ") " : "", name, label));
      return this;
   }

   public Tikz draw(String cmd, String... options) {
      this.add("\\draw [%s] %s;".formatted(String.join(",", options), cmd));
      return this;
   }

   public Tikz path(String cmd, String... options) {
      this.add("\\path [%s] %s;".formatted(String.join(",", options), cmd));
      return this;
   }

   public Tikz fill(String cmd, String... options) {
      this.add("\\fill [%s] %s;".formatted(String.join(",", options), cmd));
      return this;
   }

   public Tikz filldraw(String cmd, String... options) {
      this.add("\\filldraw [%s] %s;".formatted(String.join(",", options), cmd));
      return this;
   }

   public static Tikz of(PgfPlots plot) {
      return new Tikz().plot(plot);
   }

   public Tikz tikzlibraries(String... libraries) {
      this.preambleEntries.add(new LatexPreambleEntry("\\usetikzlibrary", Strings.mapOf(libraries), false));
      return this;
   }

   public Tikz pgflibraries(String... libraries) {
      this.preambleEntries.add(new LatexPreambleEntry("\\usepgflibrary", Strings.mapOf(libraries), false));
      return this;
   }

   public Tikz pgfplotslibraries(String... libraries) {
      this.preambleEntries.add(new LatexPreambleEntry("\\usepgfplotslibrary", Strings.mapOf(libraries), false));
      return this;
   }

   public Tikz gdlibraries(String... libraries) {
      this.preambleEntries.add(new LatexPreambleEntry("\\usegdlibrary", Strings.mapOf(libraries), false));
      return this;
   }

   public Tikz usePackages(LatexPackage... packages) {
      this.packages.addAll(List.of(packages));
      return this;
   }

   public Tikz usePackageWithOptions(String name, Map<String, String> options) {
      this.packages.add(new LatexPackage(name, options));
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
      int outer = 1;
      List<String> ret = new ArrayList<>();
      if (this.fname != null) {
         ret.add(Latex.indent(outer) + "\\tikzsetnextfilename{" + this.fname + "}");
      }

      ret.add(Latex.indent(outer) + "\\begin{tikzpicture}");
      ret.add(Latex.indent(outer + 1) + "[");

      for(String option : this.options) {
         ret.add(Latex.indent(outer + 2) + option + ",");
      }

      ret.add(Latex.indent(outer + 1) + "]");
      ret.add("");

      for(String line : this.lines) {
         ret.add(Latex.indent(outer + 1) + line);
      }

      ret.add(Latex.indent(outer) + "\\end{tikzpicture}");
      return ret;
   }
}
