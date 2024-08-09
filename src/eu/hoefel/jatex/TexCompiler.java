package eu.hoefel.jatex;

import java.util.Locale;

public enum TexCompiler {
   LATEX,
   PDFLATEX,
   XETEX,
   LUALATEX;

   public String executableName() {
      return this.name().toLowerCase(Locale.ENGLISH);
   }
}
