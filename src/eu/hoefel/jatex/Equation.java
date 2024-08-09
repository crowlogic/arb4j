package eu.hoefel.jatex;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public final class Equation implements Texable {
   public static final String LABEL_NAMESPACE = "eq:";
   private List<Object> input = new ArrayList<>();
   private List<Boolean> endLines = new ArrayList<>();
   private List<LatexPackage> packages = new ArrayList<>();
   private List<LatexPreambleEntry> preambleExtras = new ArrayList<>();
   private Equation.EquationEnvironment env;
   private boolean isStarred;
   private boolean useSubequations;
   private String label = null;
   private boolean outermost = true;
   private int equationColumns = 0;

   public Equation() {
      this.packages.add(new LatexPackage("amsmath", "breqn", Equation.class));
      this.environment(Equation.EquationEnvironment.EQUATION, false);
   }

   public Equation.EquationEnvironment getEnvironment() {
      return this.env;
   }

   public Equation environment(Equation.EquationEnvironment env, boolean isStarred) {
      this.env = env;
      if (env.canBeStarred()) {
         this.isStarred = isStarred;
      } else {
         this.isStarred = false;
      }

      return this;
   }

   public Equation environment(Equation.EquationEnvironment env) {
      return this.environment(env, false);
   }

   public boolean isStarred() {
      return this.isStarred;
   }

   public Equation starred(boolean isStarred) {
      this.isStarred = isStarred;
      return this;
   }

   public String getLabel() {
      return this.label;
   }

   public Equation label(String label) {
      this.label = label;
      return this;
   }

   public Equation equationColumns(int columns) {
      this.equationColumns = columns;
      return this;
   }

   public Equation add(String line, boolean endLine) {
      this.input.add(line);
      this.endLines.add(endLine);
      return this;
   }

   public Equation add(String line) {
      return this.add(line, true);
   }

   public Equation add(Equation eq, boolean endLine) {
      if (!eq.getEnvironment().mathModeOnly()) {
         throw new IllegalArgumentException(
            "Cannot use a "
               + eq.env
               + " environment inside a "
               + this.env
               + " environment. Maybe you wanted to use parse(Equation eq) instead of add(Equation eq)?"
         );
      } else {
         this.input.add(eq);
         this.endLines.add(endLine);
         return this;
      }
   }

   public Equation add(Equation eq) {
      return this.add(eq, true);
   }

   public Equation parse(Equation eq) {
      this.environment(eq.getEnvironment(), eq.isStarred());
      this.useSubequations(eq.useSubequations);
      this.label(eq.getLabel());
      this.packages.addAll(eq.neededPackages());
      this.preambleExtras.addAll(eq.preambleExtras());
      this.input = eq.input;
      return this;
   }

   public Equation intertext(String text) {
      this.add("\\intertext{%s}".formatted(text));
      return this;
   }

   public Equation add(String... lines) {
      for(String line : lines) {
         this.add(line, true);
      }

      return this;
   }

   public Equation useSubequations(boolean useSubequations) {
      this.useSubequations = useSubequations;
      return this;
   }

   public Equation useSubequations() {
      return this.useSubequations(true);
   }

   public Equation usePackages(LatexPackage... packages) {
      this.packages.addAll(List.of(packages));
      return this;
   }

   public Equation usePackageWithOptions(String packageName, Map<String, String> options) {
      this.packages.add(new LatexPackage(packageName, options));
      return this;
   }

   @Override
   public List<LatexPackage> neededPackages() {
      return List.copyOf(this.packages);
   }

   @Override
   public List<LatexPreambleEntry> preambleExtras() {
      return this.preambleExtras;
   }

   @Override
   public List<String> latexCode() {
      this.environment(this.env, this.isStarred);
      if (this.isStarred) {
         this.label(null);
      }

      if (this.equationColumns > 0 || this.env != Equation.EquationEnvironment.ALIGNAT && this.env != Equation.EquationEnvironment.ALIGNEDAT) {
         List<String> ret = new ArrayList<>();
         int n = 1;
         if (this.useSubequations && this.outermost) {
            ret.add(Latex.indent(n) + "\\begin{subequations}" + (this.label != null ? "\\label{eq:" + this.label + "}" : ""));
            ++n;
         }

         if (this.env.mathModeOnly() && !this.outermost || this.outermost) {
            ret.add(
               Latex.indent(n)
                  + "\\begin{"
                  + this.env.toString()
                  + (this.isStarred ? "*" : "")
                  + "}"
                  + (this.env.hasEquationColumns() ? "{" + this.equationColumns + "}" : "")
                  + "%"
            );
         }

         List<Integer> spaces = new ArrayList<>();

         for(Object obj : this.input) {
            if (obj instanceof Equation) {
               spaces.add(0);
            } else if (obj instanceof String s) {
               spaces.add((Latex.indent(n + 1) + s).length());
            }
         }

         int correctLength = 0;
         correctLength = spaces.stream().mapToInt(Integer::intValue).max().getAsInt() + 1;
         List<String> spaceCorrection = new ArrayList<>();

         for(int i = 0; i < this.input.size(); ++i) {
            Object obj = this.input.get(i);
            if (obj instanceof Equation) {
               spaceCorrection.add("");
            } else if (obj instanceof String s) {
               spaceCorrection.add(" ".repeat(correctLength - spaces.get(i)));
            }
         }

         int labelIndex = 0;

         for(int i = 0; i < this.input.size(); ++i) {
            boolean useLabel = (this.endLines.get(i) && i != this.input.size() - 1 || i == this.input.size() - 1)
               && this.label != null
               && !this.env.mathModeOnly();
            Object obj = this.input.get(i);
            String currLabel = "\\label{%s%s-%d}".formatted("eq:", this.label, labelIndex);
            if (obj instanceof Equation eq) {
               eq.useSubequations(false).outermost = false;
               this.packages.addAll(eq.neededPackages());
               this.preambleExtras.addAll(eq.preambleExtras());

               for(String line : eq.latexCode()) {
                  ret.add(Latex.indent(n) + line);
               }

               if (useLabel) {
                  ret.add(Latex.indent(n + 1) + currLabel);
                  ++labelIndex;
               }
            } else if (obj instanceof String s) {
               String str = s.replace("\t", "").trim();
               if (str.startsWith("\\intertext") && str.endsWith("}")) {
                  useLabel = false;
                  this.endLines.set(i, false);
               }

               ret.add(
                  Latex.indent(n + 1)
                     + s
                     + (String)spaceCorrection.get(i)
                     + (useLabel ? currLabel : "")
                     + (Boolean.TRUE.equals(this.endLines.get(i)) && i != this.input.size() - 1 ? "\\\\%" : "")
               );
               if (useLabel) {
                  ++labelIndex;
               }
            }
         }

         if (this.env.mathModeOnly() && !this.outermost || this.outermost) {
            ret.add(Latex.indent(n) + "\\end{" + this.env.toString() + (this.isStarred ? "*" : "") + "}%");
         }

         if (this.useSubequations && this.outermost) {
            ret.add(Latex.indent(n - 1) + "\\end{subequations}");
         }

         return ret;
      } else {
         throw new IllegalArgumentException(
            "You did not specifiy a valid number of columns (specified: " + this.equationColumns + ") for " + this.env.toString()
         );
      }
   }

   public static enum EquationEnvironment {
      EQUATION(true, false, false),
      ALIGN(true, false, false),
      ALIGNED(false, true, false),
      GATHER(true, false, false),
      GATHERED(false, true, false),
      ALIGNAT(true, false, true),
      ALIGNEDAT(false, true, true),
      CASES(false, true, false),
      FLALIGN(true, false, false),
      MULTLINE(true, false, false),
      SPLIT(false, true, false);

      private boolean canBeStarred;
      private boolean mathModeOnly;
      private boolean hasEquationColumns;

      private EquationEnvironment(boolean canBeStarred, boolean mathModeOnly, boolean hasEquationColumns) {
         this.canBeStarred = canBeStarred;
         this.mathModeOnly = mathModeOnly;
         this.hasEquationColumns = hasEquationColumns;
      }

      @Override
      public String toString() {
         return this.name().toLowerCase(Locale.ENGLISH);
      }

      public boolean canBeStarred() {
         return this.canBeStarred;
      }

      public boolean mathModeOnly() {
         return this.mathModeOnly;
      }

      public boolean hasEquationColumns() {
         return this.hasEquationColumns;
      }
   }
}
