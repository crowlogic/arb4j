package eu.hoefel.jatex;

import eu.hoefel.utils.IOs;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UncheckedIOException;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Objects;
import java.util.Set;
import java.util.TreeMap;
import java.util.Map.Entry;
import java.util.concurrent.TimeUnit;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class Latex {
   public static final String LABEL_NAMESPACE = "sec:";
   private static final String LINE_BREAK = "\n";
   public static final LatexPreambleEntry EMPTY_LINE = new LatexPreambleEntry("", true);
   public static final LatexPreambleEntry MINOR_SEPARATOR = new LatexPreambleEntry("% ----------------", true);
   public static final LatexPreambleEntry MAJOR_SEPARATOR = new LatexPreambleEntry("% ================", true);
   static final Predicate<String> STRING_IS_NOT_BLANK = s -> s != null && !s.isBlank();
   private static final Logger logger = System.getLogger(Latex.class.getName());
   private TexCompiler compiler = TexCompiler.LUALATEX;
   private List<LatexPackage> requiredPackages = new ArrayList<>();
   private String documentclass;
   private NavigableMap<String, String> documentclassOptions = new TreeMap<>();
   private List<LatexPackage> packages = new ArrayList<>();
   private List<LatexPreambleEntry> preambleEntries = new ArrayList<>();
   private List<String> body = new ArrayList<>();
   private boolean clean;
   private static final Set<String> DEFAULT_EXTS_FOR_CLEANING = Set.of("aux", "bbl", "log", "out");
   private final Set<String> exts = new HashSet<>();
   private String folder = "";
   private String name = null;
   private int numRepeat = 3;
   private StringBuilder str = new StringBuilder();
   private boolean bibliography;
   private String bibfile = null;
   private List<String> envs = new ArrayList<>();
   private boolean compilerSet = false;
   private boolean folderSet = false;
   private boolean nameSet = false;
   private boolean repeatSet = false;
   private boolean documentclassSet = false;
   private boolean cleanSet = false;
   private boolean colorSet = false;
   private boolean headerSet;
   private boolean footerSet;
   private boolean maketitleSet;
   private boolean titleheadSet;
   private boolean subjectSet;
   private boolean titleSet;
   private boolean subtitleSet;
   private boolean authorSet;
   private boolean dateSet;
   private boolean publisherSet;
   private boolean extratitleSet;
   private boolean uppertitlebackSet;
   private boolean lowertitlebackSet;
   private boolean dedicationSet;
   private boolean bibliographySet;
   private boolean bibfileSet;
   private boolean maketitle;
   private String titlehead;
   private String subject;
   private String title;
   private String subtitle;
   private String author;
   private String date;
   private String publisher;
   private String extratitle;
   private String uppertitleback;
   private String lowertitleback;
   private String dedication;
   private String[] colorScheme = new String[]{"black", "black"};
   private final String[] header = new String[6];
   private final String[] footer = new String[6];

   public Latex() {
   }

   public Latex(Latex tex) {
      this.add(tex);
   }

   public static final String indent(int n) {
      return " ".repeat(4 * n);
   }

   public static final String cite(String cite) {
      return "\\cite{" + cite + "}";
   }

   public static final String ref(String ref) {
      return "\\cref{" + ref + "}";
   }

   public static final String quote(String quote) {
      return "\\enquote{" + quote + "}";
   }

   static final String toOptions(Map<String, String> options) {
      return "["
         + (String)new TreeMap<>(options)
            .entrySet()
            .stream()
            .map(o -> (String)o.getKey() + (STRING_IS_NOT_BLANK.test(o.getValue()) ? "=" + (String)o.getValue() : ""))
            .collect(Collectors.joining(","))
         + "]";
   }

   public static final Latex standard() {
      Latex tex = new Latex();
      tex.compiler(TexCompiler.LUALATEX);
      tex.folder(System.getProperty("user.dir") + "/LaTeX/");
      tex.repeat(3);
      tex.colorScheme("red!31.372549019!black", "green!31.372549019!black");
      tex.leftFooter(null, "\\pagemark");
      tex.rightFooter("\\pagemark", null);
      tex.leftHeader(null, "\\leftmark");
      tex.rightHeader("\\rightmark", null);
      tex.documentclassWithOptions(
         "scrartcl",
         Map.ofEntries(
            Map.entry("a4paper", ""),
            Map.entry("DIV", "calc"),
            Map.entry("BCOR", "8mm"),
            Map.entry("headinclude", ""),
            Map.entry("bibliography", "totoc"),
            Map.entry("listof", "totoc"),
            Map.entry("index", "totoc"),
            Map.entry("english", ""),
            Map.entry("oneside", ""),
            Map.entry("12pt", ""),
            Map.entry("version", "last"),
            Map.entry("captions", "tableheading")
         )
      );
      tex.usePackages(
         "csquotes",
         "babel",
         "amsmath",
         "fontspec",
         "unicode-math",
         "microtype",
         "selnolig",
         "siunitx",
         "booktabs",
         "xcolor",
         "colortbl",
         "hyperref",
         "cleveref",
         "bookmark",
         "scrlayer-scrpage"
      );
      tex.usePackageWithOptions("unicode-math", Map.of("math-style", "ISO", "bold-style", "ISO", "nabla", "upright"));
      tex.usePackageWithOption("amsmath", "fleqn");
      tex.usePackageWithOptions("csquotes", Map.of("strict", "true", "autostyle", "true"));
      tex.usePackageWithOptions("babel", Map.of("main", "english"));
      tex.usePackageWithOption("xcolor", "table");
      tex.usePackageWithOption("cleveref", "noabbrev");
      tex.usePackageWithOptions(
         "caption",
         Map.of(
            "format",
            "plain",
            "indention",
            "1em",
            "labelfont",
            "{color=" + tex.getColor1() + ",small,sf,bf}",
            "textfont",
            "{color={black},small}",
            "width",
            "0.925\\textwidth"
         )
      );
      tex.usePackageWithOptions(
         "microtype", Map.of("activate", "{true,nocompatibility}", "final", "", "tracking", "true", "factor", "1100", "stretch", "10", "shrink", "")
      );
      tex.usePackageWithOptions("siunitx", Map.of("locale", "UK", "separate-uncertainty", "", "per-mode", "symbol-or-fraction"));
      tex.usePackageWithOptions("siunitx", Map.of("locale", "UK"));
      tex.usePackageWithOptions("hyperref", Map.of("pdfpagemode", "UseOutlines", "pdfencoding", "unicode", "bookmarksopenlevel", "0"));
      tex.usePackageWithOption("bookmark", "open");
      tex.usePackageWithOption("scrlayer-scrpage", "automark");
      tex.addToPreamble(new LatexPreambleEntry("\\setmainfont{Latin Modern Roman}"));
      tex.addToPreamble(new LatexPreambleEntry("\\setcounter{totalnumber}{4}"));
      tex.addToPreamble(new LatexPreambleEntry("\\setcounter{topnumber}{2}"));
      tex.addToPreamble(new LatexPreambleEntry("\\setcounter{bottomnumber}{2}"));
      tex.addToPreamble(new LatexPreambleEntry("\\setcounter{dbltopnumber}{2}"));
      tex.addToPreamble(new LatexPreambleEntry("\\renewcommand{\\topfraction}{0.9}"));
      tex.addToPreamble(new LatexPreambleEntry("\\renewcommand{\\bottomfraction}{0.5}"));
      tex.addToPreamble(new LatexPreambleEntry("\\renewcommand{\\floatpagefraction}{0.8}"));
      tex.addToPreamble(new LatexPreambleEntry("\\renewcommand{\\textfraction}{0.1}"));
      tex.addToPreamble(new LatexPreambleEntry("\\renewcommand{\\dbltopfraction}{0.9}"));
      tex.addToPreamble(new LatexPreambleEntry("\\renewcommand{\\dblfloatpagefraction}{0.8}"));
      tex.addToPreamble(new LatexPreambleEntry("\\AtBeginEnvironment{tabular}", "\\addfontfeatures{Numbers={Monospaced}}"));
      tex.addToPreamble(new LatexPreambleEntry("\\SetTracking{encoding={*}, shape=sc}{40}"));
      tex.addToPreamble(new LatexPreambleEntry("\\DisableLigatures[ff,ffi,fj,fi]", Map.of("encoding", "*", "family", "sc*")));
      tex.addToPreamble(new LatexPreambleEntry("\\bookmarksetup", Map.of("addtohook", "{\\ifnum\\bookmarkget{level}<1 \\bookmarksetup{bold}\\fi}")));
      tex.addToPreamble(
         new LatexPreambleEntry("\\def\\nobreakbefore{\\relax\\ifvmode\\else\\ifhmode\\ifdim\\lastskip > 0pt\\relax\\unskip\\nobreakspace\\fi\\fi\\fi}", true)
      );
      tex.addToPreamble(new LatexPreambleEntry("\\let\\oldcite\\cite", true));
      tex.addToPreamble(new LatexPreambleEntry("\\renewcommand\\cite{\\nobreakbefore\\oldcite}", true));
      return tex;
   }

   public static final Latex minimal() {
      Path folder;
      try {
         folder = Files.createTempDirectory("jatex");
      } catch (IOException var2) {
         throw new UncheckedIOException(var2);
      }

      Latex latex = new Latex();
      return latex.compiler(TexCompiler.PDFLATEX)
         .documentclass("article")
         .usePackages("amsmath", "preview")
         .usePackageWithOption("preview", "active")
         .usePackageWithOption("preview", "tightpage")
         .usePackageWithOption("preview", "pdftex")
         .usePackageWithOption("preview", "textmath")
         .repeat(1)
         .folder(folder.toAbsolutePath().toString());
   }

   public Latex copy() {
      return new Latex(this);
   }

   public String getColor1() {
      return this.colorScheme != null ? this.colorScheme[0] : null;
   }

   public String getColor2() {
      return this.colorScheme != null ? this.colorScheme[1] : null;
   }

   public Latex colorScheme(String color1, String color2) {
      if (color1 == null && color2 == null) {
         this.colorScheme = null;
         this.colorSet = false;
      } else {
         if (color1 == null) {
            color1 = "black";
         }

         if (color2 == null) {
            color2 = "black";
         }

         this.colorScheme = new String[]{color1, color2};
         this.colorSet = true;
      }

      return this;
   }

   public String save(Level showPathLevel) {
      Objects.requireNonNull(showPathLevel);
      this.build();
      String fileName = null;
      IOs.mkdir(this.folder);
      if (this.name != null && !this.name.isBlank()) {
         fileName = this.folder + this.name;
      } else {
         try {
            File f = File.createTempFile("tex", ".tex", Paths.get(this.folder).toFile());
            fileName = f.getAbsolutePath();
         } catch (IOException var4) {
            logger.log(Level.ERROR, "Failed to save file", var4);
         }
      }

      if (fileName == null) {
         throw new IllegalStateException("It appears no valid file name was being constructed.Most likely a temporary file could not be generated.");
      } else {
         IOs.writeToFile(new File(fileName), this.str.toString());
         logger.log(showPathLevel, "File saved to: {0}", fileName);
         return fileName;
      }
   }

   public String save() {
      return this.save(Level.ALL);
   }

   @Override
   public String toString() {
      this.build();
      return this.str.toString();
   }

   public void show() {
      logger.log(Level.ERROR, this::toString);
   }

   public boolean isExecutable() {
      return isExecutable(this.compiler);
   }

   public static boolean isExecutable(TexCompiler compiler) {
      ProcessBuilder texpb = new ProcessBuilder(compiler.executableName(), "--version");

      try {
         Process process = texpb.start();
         boolean timedOut = !process.waitFor(1L, TimeUnit.SECONDS);
         if (!timedOut) {
            return process.exitValue() == 0;
         } else {
            return false;
         }
      } catch (IOException var4) {
         return false;
      } catch (InterruptedException var5) {
         Thread.currentThread().interrupt();
         throw new IllegalStateException(var5);
      }
   }

   public Path run(String filename) {
      this.filename(filename);
      int errorcode = this.exec();
      if (errorcode != 0) {
         throw new IllegalStateException("Latex execution failed with error code " + errorcode);
      } else {
         int dot = this.name.lastIndexOf(46);
         Path pdf = Paths.get(this.folder, this.name.substring(0, dot) + ".pdf");
         if (Files.isRegularFile(pdf)) {
            return pdf;
         } else {
            throw new IllegalStateException("Unable to find pdf @ " + pdf.toAbsolutePath());
         }
      }
   }

   public int exec() {
      if (this.compiler == TexCompiler.LUALATEX) {
         if (!this.hasPackage("fontspec")) {
            logger.log(Level.DEBUG, "You are using lualatex without the fontspec package. Proceeding without it.");
         }

         if (!this.hasPackage("unicode-math")) {
            logger.log(Level.DEBUG, "You are using lualatex without the unicode-math package. Proceeding without it.");
         }
      }

      String fileName = this.save(Level.ALL);
      int errorCode = 0;

      for(int i = 0; i < this.numRepeat; ++i) {
         ProcessBuilder texpb = new ProcessBuilder(
            this.compiler.executableName(), "--output-directory=" + this.folder, "--enable-write18", "--interaction=nonstopmode", "-halt-on-error", fileName
         );
         if (logger.isLoggable(Level.TRACE)) {
            texpb.inheritIO();
         }

         try {
            Process texp = texpb.start();
            if (!logger.isLoggable(Level.TRACE)) {
               try (BufferedReader br = new BufferedReader(new InputStreamReader(texp.getInputStream()))) {
                  List<String> lines = br.lines().toList();

                  for(String line : lines) {
                     if (line != null && line.contains("Fatal error occurred")) {
                        logger.log(Level.ERROR, lines.stream().filter(Objects::nonNull).collect(Collectors.joining(System.lineSeparator())));
                        break;
                     }
                  }
               }
            }

            errorCode = Math.max(errorCode, texp.waitFor());
         } catch (IOException var15) {
            throw new IllegalStateException(var15);
         } catch (InterruptedException var16) {
            Thread.currentThread().interrupt();
            throw new IllegalStateException(var16);
         }

         if (this.bibliography && this.bibfile != null) {
            String file = this.name;
            if (this.name.endsWith(".tex")) {
               file = file.substring(0, this.name.length() - 4);
            }

            ProcessBuilder bibpb = new ProcessBuilder("biber", "--output-directory=" + this.folder, file);
            if (logger.isLoggable(Level.TRACE)) {
               bibpb.inheritIO();
            }

            try {
               Process bibp = bibpb.start();
               if (!logger.isLoggable(Level.TRACE)) {
                  bibp.getInputStream().close();
                  bibp.getErrorStream().close();
               }

               bibp.waitFor();
            } catch (IOException var12) {
               throw new IllegalStateException(var12);
            } catch (InterruptedException var13) {
               Thread.currentThread().interrupt();
               throw new IllegalStateException(var13);
            }
         }
      }

      if (this.clean) {
         String fileNameWithoutExt;
         if (fileName.endsWith(".tex")) {
            fileNameWithoutExt = fileName.substring(0, fileName.lastIndexOf(46));
         } else {
            fileNameWithoutExt = fileName;
         }

         for(String ext : this.exts) {
            File file = new File(fileNameWithoutExt + "." + ext);
            if (file.isFile()) {
               try {
                  Files.delete(file.toPath());
                  logger.log(Level.DEBUG, () -> "Successfully deleted %s".formatted(file.toPath()));
               } catch (IOException var11) {
                  logger.log(Level.ERROR, () -> "Unable to delete %s, %s".formatted(file.getAbsolutePath(), var11.getMessage()));
               }
            }
         }
      }

      return errorCode;
   }

   public Latex filename(String name) {
      Path path = Paths.get(name);
      Path folder = path.getParent();
      if (folder != null) {
         this.folder(Paths.get(this.folder).resolve(folder).toString());
      }

      this.name = path.getFileName().toString();
      this.nameSet = true;
      return this;
   }

   public Latex clean(boolean clean, String... exts) {
      this.clean = clean;
      this.exts.clear();
      if (exts != null && exts.length != 0) {
         Collections.addAll(this.exts, exts);
      } else {
         this.exts.addAll(DEFAULT_EXTS_FOR_CLEANING);
      }

      this.cleanSet = true;
      return this;
   }

   private void build() {
      this.sanityChecks();
      this.str = new StringBuilder();
      this.buildPreamble();
      this.buildBody();
      this.createDocumentEnd();
   }

   private void sanityChecks() {
      if (!this.envs.isEmpty()) {
         logger.log(
            Level.WARNING,
            "Seems like you opened environment(s) that at least were not closed via endEnv(). The environment in question is/are {0}. I'll try to continue, as you might have closed the environment directly via add().",
            this.envs.toString()
         );
      }

      if (!List.of("scrbook", "scrreprt", "scrartcl").contains(this.getDocumentclass())) {
         if (List.of("article", "book", "report", "letter").contains(this.getDocumentclass())) {
            this.usePackageWithOptions("scrextend", Map.of("extendedfeature", "title"));
         } else {
            this.maketitle(false);
         }
      }
   }

   public Latex compiler(TexCompiler compiler) {
      this.compiler = compiler;
      return this;
   }

   public Latex folder(String folder) {
      if (!folder.endsWith("/")) {
         folder = folder + "/";
      }

      this.folder = folder.replace("\\", "/");
      this.folderSet = true;
      return this;
   }

   public Latex usePackages(String... packages) {
      for(String pckg : packages) {
         this.packages.add(new LatexPackage(pckg));
      }

      return this;
   }

   public Latex removePackages(String... packages) {
      List<String> packageNamesToBeRemoved = List.of(packages);
      this.packages.removeIf(p -> packageNamesToBeRemoved.contains(p.name()));
      return this;
   }

   private boolean hasPackage(String name) {
      return this.packages.stream().anyMatch(p -> p.name().equals(name));
   }

   public Latex usePackages(LatexPackage... packages) {
      this.packages.addAll(List.of(packages));
      LatexPackage.cleanup(this.packages);
      return this;
   }

   public Latex repeat(int numRepeat) {
      this.numRepeat = numRepeat;
      this.repeatSet = true;
      return this;
   }

   public Latex usePackageWithOptions(String packageName, Map<String, String> options) {
      this.packages.add(new LatexPackage(packageName, options));
      return this;
   }

   public Latex usePackageWithOption(String packageName, String option) {
      this.packages.add(new LatexPackage(packageName, option));
      return this;
   }

   public Latex requirePackage(String packageName) {
      this.requiredPackages.add(new LatexPackage(packageName));
      return this;
   }

   public Latex requirePackageWithOption(String packageName, String optionKey) {
      this.requirePackageWithOptions(packageName, Map.of(optionKey, ""));
      return this;
   }

   public Latex requirePackageWithOptions(String packageName, Map<String, String> options) {
      this.requiredPackages.add(new LatexPackage(packageName, options));
      return this;
   }

   public Latex documentclass(String documentclass) {
      this.documentclass = documentclass;
      this.documentclassSet = true;
      return this;
   }

   public Latex documentclassWithOptions(String documentclass, Map<String, String> options) {
      this.documentclass(documentclass);
      this.documentclassOptions.putAll(options);
      return this;
   }

   public Latex addToPreamble(String line) {
      if (line != null) {
         this.preambleEntries.add(new LatexPreambleEntry(line, true));
      }

      return this;
   }

   public Latex addToPreamble(LatexPreambleEntry... entries) {
      this.preambleEntries.addAll(List.of(entries));
      return this;
   }

   public Latex removeFromPreamble(String line) {
      this.preambleEntries.removeIf(entry -> entry.cmd().equals(line));
      return this;
   }

   private boolean hasPreambleEntry(String line) {
      return line != null && this.preambleEntries.stream().map(LatexPreambleEntry::cmd).anyMatch(line::equals);
   }

   public Latex add(String code) {
      this.body.add(indent(1) + code);
      return this;
   }

   private void createDocumentEnd() {
      this.str.append("\\end{document}\n");
   }

   private static final StringBuilder append(StringBuilder sb, String... strs) {
      for(String string : strs) {
         sb.append(string);
      }

      return sb;
   }

   private void buildPreamble() {
      StringBuilder requirePackage = append(new StringBuilder(), MAJOR_SEPARATOR.cmd(), "\n");
      append(requirePackage, "% Required packages", "\n", MAJOR_SEPARATOR.cmd(), "\n");
      this.requiredPackages = LatexPackage.cleanup(this.requiredPackages);

      for(LatexPackage p : this.requiredPackages) {
         requirePackage.append("\\RequirePackage");
         if (!p.options().isEmpty()) {
            requirePackage.append(toOptions(p.options()));
         }

         append(requirePackage, "{", p.name(), "}", "\n");
      }

      append(requirePackage, MAJOR_SEPARATOR.cmd(), "\n".repeat(2));
      StringBuilder documentclassLine = new StringBuilder("\\documentclass");
      if (!this.documentclassOptions.isEmpty()) {
         documentclassLine.append(toOptions(this.documentclassOptions));
      }

      documentclassLine.append("{" + this.documentclass + "}" + "\n".repeat(2));
      StringBuilder packageImports = append(new StringBuilder(), MAJOR_SEPARATOR.cmd(), "\n");
      append(packageImports, "% packages", "\n", MAJOR_SEPARATOR.cmd(), "\n");
      this.packages = LatexPackage.cleanup(this.packages);

      for(LatexPackage p : this.packages) {
         packageImports.append("\\usepackage");
         if (!p.options().isEmpty()) {
            packageImports.append(toOptions(p.options()));
         }

         append(packageImports, "{", p.name(), "}", "\n");
      }

      append(packageImports, MAJOR_SEPARATOR.cmd(), "\n".repeat(2));
      append(this.str, "% !TEX program = ", this.compiler.toString().toLowerCase(), "\n");
      if (this.bibliography) {
         append(this.str, "% !BIB program = biber", "\n");
      }

      append(this.str, "% !TEX encoding = UTF-8 Unicode", "\n".repeat(2));
      if (!this.requiredPackages.isEmpty()) {
         this.str.append(requirePackage.toString());
      }

      this.str.append(documentclassLine.toString());
      if (!this.packages.isEmpty()) {
         this.str.append(packageImports.toString());
      }

      if (!this.preambleEntries.isEmpty()) {
         this.str.append(this.buildUserSettingsAndDefs());
      }

      if (this.maketitle) {
         append(this.str, MAJOR_SEPARATOR.cmd(), "% titlepage", "\n", MAJOR_SEPARATOR.cmd(), "\n");
         if (this.titlehead != null) {
            append(this.str, "\\titlehead{", this.titlehead, "}", "\n");
         }

         if (this.subject != null) {
            append(this.str, "\\subject{", this.subject, "}", "\n");
         }

         if (this.title != null) {
            append(this.str, "\\title{\\color{", this.getColor1(), "}", this.title, "}", "\n");
         }

         if (this.subtitle != null) {
            append(this.str, "\\subtitle{\\color{", this.getColor1(), "}", this.subtitle, "}", "\n");
         }

         if (this.author != null) {
            append(this.str, "\\author{", this.author, "}", "\n");
         }

         if (this.date != null) {
            append(this.str, "\\date{", this.date, "}", "\n");
         }

         if (this.publisher != null) {
            append(this.str, "\\publishers{", this.publisher, "}", "\n");
         }

         if (this.extratitle != null) {
            append(this.str, "\\extratitle{", this.extratitle, "}", "\n");
         }

         if (this.uppertitleback != null) {
            append(this.str, "\\uppertitleback{", this.uppertitleback, "}", "\n");
         }

         if (this.lowertitleback != null) {
            append(this.str, "\\lowertitleback{", this.lowertitleback, "}", "\n");
         }

         if (this.dedication != null) {
            append(this.str, "\\dedication{", this.dedication, "}", "\n");
         }

         append(this.str, MAJOR_SEPARATOR.cmd(), "\n".repeat(2));
      }

      append(this.str, "\\begin{document}", "\n");
   }

   private String buildUserSettingsAndDefs() {
      this.addDefaultPreambleEntries();
      LatexPreambleEntry.cleanup(this.preambleEntries);
      this.preambleEntries.add(MAJOR_SEPARATOR);
      this.preambleEntries.add(EMPTY_LINE);
      this.preambleEntries.add(EMPTY_LINE);
      return this.preambleEntries.stream().map(LatexPreambleEntry::preambleLine).collect(Collectors.joining("\n"));
   }

   private void addDefaultPreambleEntries() {
      List<LatexPreambleEntry> nspe = new ArrayList<>();
      nspe.add(MAJOR_SEPARATOR);
      nspe.add(new LatexPreambleEntry("% settings/user defs"));
      nspe.add(MAJOR_SEPARATOR);
      boolean addBibResource = this.packages.stream().anyMatch(p -> p.name().equals("biblatex")) && this.bibfile != null;
      if (addBibResource) {
         nspe.add(new LatexPreambleEntry("\\addbibresource", Map.of(this.bibfile + ".bib", ""), false));
         nspe.add(EMPTY_LINE);
      }

      boolean tikzLibraryLoaded = false;
      if (this.preambleEntries.stream().map(LatexPreambleEntry::cmd).anyMatch("usegdlibrary"::equals)) {
         tikzLibraryLoaded = nspe.add(new LatexPreambleEntry("usegdlibrary", false));
      }

      if (this.preambleEntries.stream().map(LatexPreambleEntry::cmd).anyMatch("usepgfplotslibrary"::equals)) {
         tikzLibraryLoaded = nspe.add(new LatexPreambleEntry("usepgfplotslibrary", false));
      }

      if (this.preambleEntries.stream().map(LatexPreambleEntry::cmd).anyMatch("usepgflibrary"::equals)) {
         tikzLibraryLoaded = nspe.add(new LatexPreambleEntry("usepgflibrary", false));
      }

      if (this.preambleEntries.stream().map(LatexPreambleEntry::cmd).anyMatch("usetikzlibrary"::equals)) {
         tikzLibraryLoaded = nspe.add(new LatexPreambleEntry("usetikzlibrary", false));
      }

      if (tikzLibraryLoaded) {
         nspe.add(EMPTY_LINE);
      }

      if (this.hasPackage("scrlayer-scrpage")) {
         boolean hasHeaderInfo = Stream.of(this.header).anyMatch(Objects::nonNull);
         if (hasHeaderInfo) {
            nspe.add(new LatexPreambleEntry("\\clearpairofpagestyles", true));
         }

         if (this.header[0] != null) {
            nspe.add(new LatexPreambleEntry("\\lehead", Map.of(this.header[0], ""), false));
         }

         if (this.header[1] != null) {
            nspe.add(new LatexPreambleEntry("\\lohead", Map.of(this.header[1], ""), false));
         }

         if (this.header[2] != null) {
            nspe.add(new LatexPreambleEntry("\\cehead", Map.of(this.header[2], ""), false));
         }

         if (this.header[3] != null) {
            nspe.add(new LatexPreambleEntry("\\cohead", Map.of(this.header[3], ""), false));
         }

         if (this.header[4] != null) {
            nspe.add(new LatexPreambleEntry("\\rehead", Map.of(this.header[4], ""), false));
         }

         if (this.header[5] != null) {
            nspe.add(new LatexPreambleEntry("\\rohead", Map.of(this.header[5], ""), false));
         }

         if (hasHeaderInfo) {
            nspe.add(EMPTY_LINE);
         }

         boolean hasFooterInfo = Stream.of(this.footer).anyMatch(Objects::nonNull);
         if (hasFooterInfo) {
            nspe.add(new LatexPreambleEntry("\\clearmainofpairofpagestyles"));
         }

         if (this.footer[0] != null) {
            nspe.add(new LatexPreambleEntry("\\lefoot", Map.of(this.footer[0], ""), false));
         }

         if (this.footer[1] != null) {
            nspe.add(new LatexPreambleEntry("\\lofoot", Map.of(this.footer[1], ""), false));
         }

         if (this.footer[2] != null) {
            nspe.add(new LatexPreambleEntry("\\cefoot", Map.of(this.footer[2], ""), false));
         }

         if (this.footer[3] != null) {
            nspe.add(new LatexPreambleEntry("\\cofoot", Map.of(this.footer[3], ""), false));
         }

         if (this.footer[4] != null) {
            nspe.add(new LatexPreambleEntry("\\refoot", Map.of(this.footer[4], ""), false));
         }

         if (this.footer[5] != null) {
            nspe.add(new LatexPreambleEntry("\\rofoot", Map.of(this.footer[5], ""), false));
         }

         if (hasFooterInfo) {
            nspe.add(EMPTY_LINE);
         }
      }

      if (this.colorScheme != null) {
         if (this.hasPackage("caption")) {
            nspe.add(new LatexPreambleEntry("\\captionsetup", Map.of("labelfont+", "{color={" + this.getColor1() + "}}"), false));
         }

         if (this.hasPackage("subcaption")) {
            nspe.add(new LatexPreambleEntry("\\captionsetup[sub]", Map.of("labelfont+", "{color={" + this.getColor1() + "}}"), false));
         }

         if (this.hasPackage("caption") || this.hasPackage("subcaption")) {
            nspe.add(EMPTY_LINE);
         }

         if ("scrartcl".equals(this.getDocumentclass()) || "scrreprt".equals(this.getDocumentclass()) || "scrbook".equals(this.getDocumentclass())) {
            nspe.add(new LatexPreambleEntry("\\addtokomafont{pagehead}", Map.of("\\color{" + this.getColor1() + "}", ""), false));
            nspe.add(new LatexPreambleEntry("\\addtokomafont{footnoterule}", Map.of("\\color{" + this.getColor2() + "}", ""), false));
            nspe.add(new LatexPreambleEntry("\\addtokomafont{pagenumber}", Map.of("\\color{" + this.getColor2() + "}", ""), false));
            if ("scrbook".equals(this.getDocumentclass())) {
               nspe.add(new LatexPreambleEntry("\\addtokomafont{part}", Map.of("\\color{" + this.getColor1() + "}", ""), false));
            }

            if ("scrbook".equals(this.getDocumentclass()) || "scrreprt".equals(this.getDocumentclass())) {
               nspe.add(new LatexPreambleEntry("\\addtokomafont{chapter}", Map.of("\\color{" + this.getColor1() + "}", ""), false));
            }

            nspe.add(new LatexPreambleEntry("\\addtokomafont{section}", Map.of("\\color{" + this.getColor1() + "}", ""), false));
            nspe.add(new LatexPreambleEntry("\\addtokomafont{subsection}", Map.of("\\color{" + this.getColor1() + "}", ""), false));
            nspe.add(new LatexPreambleEntry("\\addtokomafont{subsubsection}", Map.of("\\color{" + this.getColor1() + "}", ""), false));
            nspe.add(EMPTY_LINE);
         }
      }

      this.preambleEntries.addAll(0, nspe);
   }

   public Latex leftFooter(String odd, String even) {
      this.footer[0] = even;
      this.footer[1] = odd;
      this.footerSet = true;
      return this.usePackages("scrlayer-scrpage");
   }

   public Latex centerFooter(String odd, String even) {
      this.footer[2] = even;
      this.footer[3] = odd;
      this.footerSet = true;
      return this.usePackages("scrlayer-scrpage");
   }

   public Latex rightFooter(String odd, String even) {
      this.footer[4] = even;
      this.footer[5] = odd;
      this.footerSet = true;
      return this.usePackages("scrlayer-scrpage");
   }

   public Latex leftHeader(String odd, String even) {
      this.header[0] = even;
      this.header[1] = odd;
      this.headerSet = true;
      return this.usePackages("scrlayer-scrpage");
   }

   public Latex centerHeader(String odd, String even) {
      this.header[2] = even;
      this.header[3] = odd;
      this.headerSet = true;
      return this.usePackages("scrlayer-scrpage");
   }

   public Latex rightHeader(String odd, String even) {
      this.header[4] = even;
      this.header[5] = odd;
      this.headerSet = true;
      return this.usePackages("scrlayer-scrpage");
   }

   private String[] getHeader() {
      return (String[])this.header.clone();
   }

   private String[] getFooter() {
      return (String[])this.footer.clone();
   }

   public static final String escapeAllChars(String input) {
      return input.replace("\\", "\\textbackslash ")
         .replace("#", "\\#")
         .replace("$", "\\$")
         .replace("%", "\\%")
         .replace("_", "\\_")
         .replace("&", "\\&")
         .replace("{", "\\{")
         .replace("}", "\\}")
         .replace("~", "\\textasciitilde ")
         .replace("^", "\\textasciicircum ");
   }

   public static final String escapeChars(String input) {
      StringBuilder ret = new StringBuilder();
      boolean mathmodeActive = false;

      for(int i = 0; i < input.length(); ++i) {
         char str = input.charAt(i);
         if (mathmodeActive) {
            ret.append(str);
            if (str == '$') {
               mathmodeActive ^= true;
            }
         } else {
            if (str == '$') {
               mathmodeActive ^= true;
            }

            ret.append(mathmodeActive ? str : escapeAllChars(Character.toString(str)));
         }
      }

      return ret.toString();
   }

   private void buildBody() {
      if (this.hasPackage("scrlayer-scrpage") && this.maketitle) {
         append(this.str, indent(1), "\\pagestyle{empty}", "\n");
         append(this.str, indent(1), "\\maketitle[-1]", "\n");
         append(this.str, indent(1), "\\pagestyle{scrheadings}", "\n".repeat(2));
      }

      this.str.append(String.join("\n", this.body) + "\n");
   }

   public Latex add(Latex... texs) {
      for(Latex tex : texs) {
         if (tex.compilerSet) {
            this.compiler(tex.getCompiler());
         }

         if (tex.folderSet) {
            this.folder(tex.getFolder());
         }

         if (tex.nameSet) {
            this.filename(tex.getFilename());
         }

         if (tex.repeatSet) {
            this.repeat(tex.getRepeat());
         }

         if (tex.cleanSet) {
            this.clean(tex.clean, tex.exts.toArray(x$0 -> new String[x$0]));
         }

         if (tex.colorSet) {
            this.colorScheme(tex.getColor1(), tex.getColor2());
         }

         if (tex.headerSet) {
            this.leftHeader(tex.getHeader()[1], tex.getHeader()[0]);
            this.centerHeader(tex.getHeader()[3], tex.getHeader()[2]);
            this.rightHeader(tex.getHeader()[5], tex.getHeader()[4]);
         }

         if (tex.footerSet) {
            this.leftFooter(tex.getFooter()[1], tex.getFooter()[0]);
            this.centerFooter(tex.getFooter()[3], tex.getFooter()[2]);
            this.rightFooter(tex.getFooter()[5], tex.getFooter()[4]);
         }

         if (tex.maketitleSet) {
            this.maketitle(tex.maketitle);
         }

         if (tex.titleheadSet) {
            this.titlehead(tex.titlehead);
         }

         if (tex.subjectSet) {
            this.subject(tex.subject);
         }

         if (tex.titleSet) {
            this.title(tex.title);
         }

         if (tex.subtitleSet) {
            this.subtitle(tex.subtitle);
         }

         if (tex.authorSet) {
            this.authors(tex.author.split("\\and "));
         }

         if (tex.dateSet) {
            this.date(tex.date);
         }

         if (tex.publisherSet) {
            this.publisher(tex.publisher);
         }

         if (tex.extratitleSet) {
            this.extratitle(tex.extratitle);
         }

         if (tex.uppertitlebackSet) {
            this.uppertitleback(tex.uppertitleback);
         }

         if (tex.lowertitlebackSet) {
            this.lowertitleback(tex.lowertitleback);
         }

         if (tex.dedicationSet) {
            this.dedication(tex.dedication);
         }

         if (tex.bibliographySet) {
            this.bib(tex.bibliography);
         }

         if (tex.bibfileSet) {
            this.bibfile(tex.bibfile);
         }

         this.requiredPackages.addAll(tex.packages());
         if (tex.documentclassSet) {
            this.documentclass(tex.getDocumentclass());
         }

         this.documentclassOptions.putAll(tex.documentclassOptions());
         this.packages.addAll(tex.packages());
         this.preambleEntries.addAll(LatexPreambleEntry.cleanup(tex.preambleEntries));
         this.body.addAll(tex.body);
      }

      LatexPackage.cleanup(this.requiredPackages);
      LatexPackage.cleanup(this.packages);
      LatexPreambleEntry.cleanup(this.preambleEntries);
      return this;
   }

   private Map<String, String> documentclassOptions() {
      return this.documentclassOptions;
   }

   private List<LatexPackage> packages() {
      return List.copyOf(LatexPackage.cleanup(this.packages));
   }

   public String getFolder() {
      return this.folder;
   }

   public String getFilename() {
      return this.name;
   }

   public TexCompiler getCompiler() {
      return this.compiler;
   }

   public int getRepeat() {
      return this.numRepeat;
   }

   public String getDocumentclass() {
      return this.documentclass;
   }

   public Latex addFigure(String path, String width, String caption, String label) {
      return this.add(new Figure().mode(Figure.FigureEnvironment.FIGURE).centering(true).width(width).path(path).caption(caption).label(label));
   }

   public Latex addFigure(String path, String caption) {
      return this.addFigure(path, "", caption, "");
   }

   public Latex add(Texable... texable) {
      for(Texable tex : texable) {
         this.body.addAll(tex.latexCode());
         this.packages.addAll(tex.neededPackages());
         this.preambleEntries.addAll(tex.preambleExtras());
      }

      this.requiredPackages = LatexPackage.cleanup(this.requiredPackages, true);
      this.packages = LatexPackage.cleanup(this.packages, true);
      List<LatexPackage> allPackagesToLoad = new ArrayList<>(this.packages);
      allPackagesToLoad.addAll(this.requiredPackages);
      LatexPackage.checkForIncompatiblePackages(this.requiredPackages);
      this.preambleEntries = LatexPreambleEntry.cleanup(this.preambleEntries);
      return this;
   }

   public Latex tikzlibraries(String... libraries) {
      if (libraries != null && libraries.length > 0) {
         this.usePackages("tikz");

         for(String library : libraries) {
            this.addToPreamble(new LatexPreambleEntry("\\usetikzlibrary", library));
         }
      }

      return this;
   }

   public Latex pgflibraries(String... libraries) {
      if (libraries != null && libraries.length > 0) {
         this.usePackages("pgf");

         for(String library : libraries) {
            this.addToPreamble(new LatexPreambleEntry("\\usepgflibrary", library));
         }
      }

      return this;
   }

   public Latex pgfplotslibraries(String... libraries) {
      if (libraries != null && libraries.length > 0) {
         this.usePackages("pgfplots");

         for(String library : libraries) {
            this.addToPreamble(new LatexPreambleEntry("\\usepgfplotslibrary", library));
         }
      }

      return this;
   }

   public Latex gdlibraries(String... libraries) {
      if (libraries != null && libraries.length > 0) {
         this.usePackages("tikz");

         for(String library : libraries) {
            this.addToPreamble(new LatexPreambleEntry("\\usegdlibrary", library));
         }
      }

      return this;
   }

   public Latex externalize(String folder) {
      if (folder == null) {
         throw new IllegalArgumentException("null is not a valid tikzexternalization folder!");
      } else {
         this.usePackages("tikz", "shellesc");
         this.tikzlibraries("external");
         if (!folder.isEmpty()) {
            folder = folder.replace("\\", "/");
            if (!folder.endsWith("/")) {
               folder = folder + "/";
            }

            if (Paths.get(folder).isAbsolute()) {
               IOs.mkdir(folder);
            } else {
               IOs.mkdir(this.folder + folder);
            }
         }

         this.addToPreamble("\\tikzexternalize[" + (folder.isBlank() ? "" : "prefix=" + folder) + "]");
         this.addToPreamble(
            "\\tikzset{external/system call={"
               + this.compiler.name().toLowerCase(Locale.ENGLISH)
               + " --output-directory="
               + this.folder
               + " \\tikzexternalcheckshellescape --enable-write18 -halt-on-error -interaction=batchmode -jobname \"\\image\" \"\\texsource\"}}"
         );
         return this;
      }
   }

   public Latex externalize() {
      return this.externalize("tikz");
   }

   public <T> Latex plotData(String caption, T data, String legend, Map<String, String> options) {
      return this.plotData(PgfPlots.of(data, legend, options), caption);
   }

   public Latex plotData(PgfPlots plot, String caption) {
      return this.add(Figure.in(Figure.FigureEnvironment.FIGURE).centering(true).caption(caption).tikz(Tikz.of(plot)));
   }

   public Latex equation(String... eq) {
      return this.add(new Equation().add(eq));
   }

   public Latex labeledEquation(String label, String... eq) {
      return this.add(new Equation().add(eq).label(label));
   }

   public Latex equation(Equation.EquationEnvironment env, String label, String... eq) {
      return this.add(new Equation().environment(env).add(eq).label(label));
   }

   public Latex bib(boolean bibliography) {
      String biburllc = "\\setcounter{biburllcpenalty}{7000}";
      String biburluc = "\\setcounter{biburlucpenalty}{7000}";
      String biburlnum = "\\setcounter{biburlnumpenalty}{7000}";
      if (bibliography) {
         this.usePackages("biblatex");
         this.usePackageWithOptions(
            "biblatex", Map.of("backend", "biber", "hyperref", "true", "language", "english", "style", "numeric-comp", "maxbibnames", "5", "sortlocale", "en")
         );
         if (!this.hasPreambleEntry(biburllc)) {
            this.addToPreamble(biburllc);
         }

         if (!this.hasPreambleEntry(biburluc)) {
            this.addToPreamble(biburluc);
         }

         if (!this.hasPreambleEntry(biburlnum)) {
            this.addToPreamble(biburlnum);
         }
      } else {
         this.removePackages("biblatex");
         this.removeFromPreamble(biburllc);
         this.removeFromPreamble(biburluc);
         this.removeFromPreamble(biburlnum);
      }

      this.bibliography = bibliography;
      this.bibliographySet = true;
      return this;
   }

   public Latex bibfile(String bibfile) {
      this.bibfile = bibfile;
      this.bibfileSet = true;
      return this.bib(true);
   }

   public Latex bib() {
      this.add("\\printbibliography");
      return this;
   }

   public Latex toc() {
      return this.add(this.deactivateProtrusion("\\tableofcontents"));
   }

   public Latex lof() {
      return this.add(this.deactivateProtrusion("\\listoffigures"));
   }

   public Latex lot() {
      return this.add(this.deactivateProtrusion("\\listoftables"));
   }

   private String deactivateProtrusion(String code) {
      boolean microtype = this.hasPackage("microtype");
      return (microtype ? "{\\microtypesetup{protrusion=false}" : "") + code + (microtype ? "}" : "");
   }

   public Latex beginEnv(String env) {
      this.envs.add(0, env);
      return this.add("\\begin{" + env + "}%");
   }

   public Latex endEnv(String env) {
      boolean found = false;

      for(String openEnv : this.envs) {
         if (openEnv.equals(env)) {
            this.envs.remove(0);
            found = true;
            break;
         }
      }

      if (!found) {
         logger.log(
            Level.WARNING,
            "Seems like you closed an environment that at least was not opened via beginEnv(). The env in question is {0}. I'll try to continue, as you might have opened the environment directly via add().",
            env
         );
      }

      return this.add("\\end{" + env + "}%");
   }

   public Latex maketitle(boolean maketitle) {
      this.maketitle = maketitle;
      this.maketitleSet = true;
      return this;
   }

   public Latex maketitle() {
      return this.maketitle(true);
   }

   public Latex titlehead(String titlehead) {
      this.titlehead = titlehead;
      this.titleheadSet = true;
      return this.maketitle();
   }

   public Latex subject(String subject) {
      this.usePackageWithOptions("hyperref", Map.of("pdfsubject", "{" + subject + "}"));
      this.subject = subject;
      this.subjectSet = true;
      return this.maketitle();
   }

   public Latex title(String title) {
      this.usePackageWithOptions("hyperref", Map.of("pdftitle", "{" + title + "}"));
      this.title = title;
      this.titleSet = true;
      return this.maketitle();
   }

   public Latex subtitle(String subtitle) {
      this.subtitle = subtitle;
      this.subtitleSet = true;
      return this.maketitle();
   }

   public Latex authors(String... authors) {
      this.author = String.join("\\and ", authors);
      String pdfClean = this.author.replace("\\and ", ",").replace("\\and", ",");
      String thanks = "\\thanks{";

      while(pdfClean.contains(thanks)) {
         int i = pdfClean.indexOf(thanks);
         String tmp = pdfClean.substring(i + thanks.length());
         int openBrackets = 1;

         for(int j = 0; j < tmp.length(); ++j) {
            if (Character.toString(tmp.charAt(j)).equals("{")) {
               ++openBrackets;
            }

            if (Character.toString(tmp.charAt(j)).equals("}")) {
               --openBrackets;
            }

            if (openBrackets == 0) {
               pdfClean = pdfClean.replace(pdfClean.substring(i).substring(0, j + thanks.length() + 1), "");
               break;
            }
         }
      }

      this.usePackageWithOptions("hyperref", Map.of("pdfauthor", "{" + pdfClean + "}"));
      this.authorSet = true;
      return this.maketitle();
   }

   public Latex date(String date) {
      this.date = date;
      this.dateSet = true;
      return this.maketitle();
   }

   public Latex publisher(String publisher) {
      this.publisher = publisher;
      this.publisherSet = true;
      return this.maketitle();
   }

   public Latex extratitle(String extratitle) {
      this.extratitle = extratitle;
      this.extratitleSet = true;
      return this.maketitle();
   }

   public Latex uppertitleback(String uppertitleback) {
      this.uppertitleback = uppertitleback;
      this.uppertitlebackSet = true;
      return this.maketitle();
   }

   public Latex lowertitleback(String lowertitleback) {
      this.lowertitleback = lowertitleback;
      this.lowertitlebackSet = true;
      return this.maketitle();
   }

   public Latex dedication(String dedication) {
      this.dedication = dedication;
      this.dedicationSet = true;
      return this.maketitle();
   }

   public Latex chapter(String chapter, String label) {
      return this.add("\\chapter{" + chapter + "}" + (STRING_IS_NOT_BLANK.test(label) ? "\\label{sec:" + label + "}" : ""));
   }

   public Latex chapter(String chapter) {
      return this.chapter(chapter, null);
   }

   public Latex section(String section, String label) {
      return this.add("\\section{" + section + "}" + (STRING_IS_NOT_BLANK.test(label) ? "\\label{sec:" + label + "}" : ""));
   }

   public Latex section(String section) {
      return this.section(section, null);
   }

   public Latex subsection(String subsection, String label) {
      return this.add("\\subsection{" + subsection + "}" + (STRING_IS_NOT_BLANK.test(label) ? "\\label{sec:" + label + "}" : ""));
   }

   public Latex subsection(String subsection) {
      return this.subsection(subsection, null);
   }

   public Latex subsubsection(String subsubsection, String label) {
      return this.add("\\subsubsection{" + subsubsection + "}" + (STRING_IS_NOT_BLANK.test(label) ? "\\label{sec:" + label + "}" : ""));
   }

   public Latex subsubsection(String subsubsection) {
      return this.subsubsection(subsubsection, null);
   }
}
