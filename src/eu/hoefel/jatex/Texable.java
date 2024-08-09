package eu.hoefel.jatex;

import java.util.List;

public interface Texable {
   List<LatexPackage> neededPackages();

   List<LatexPreambleEntry> preambleExtras();

   List<String> latexCode();
}
