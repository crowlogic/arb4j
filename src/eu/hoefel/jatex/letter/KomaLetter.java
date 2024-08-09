package eu.hoefel.jatex.letter;

import eu.hoefel.jatex.Latex;
import eu.hoefel.jatex.LatexPackage;
import eu.hoefel.jatex.TexCompiler;
import eu.hoefel.jatex.Texable;
import java.io.File;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Map;
import java.util.Objects;

public final class KomaLetter {
   private Texable user;
   private boolean showbank = true;
   private boolean smaller = true;
   private boolean clean = true;
   private String[] cleanupFileExtensions = new String[0];
   private String foldmarks = "TBMPL";
   private String toName;
   private String toStreet;
   private String toCity;
   private String toExtra;
   private String language;
   private String title;
   private String subject;
   private String yourRef;
   private String myRef;
   private String yourMail;
   private String customer;
   private String invoice;
   private LocalDate date;
   private String opening;
   private String closing;
   private String ps;
   private String[] encl;
   private String[] cc;
   private String[] body;
   private Path file;

   private KomaLetter() {
   }

   private Latex setup() {
      return new Latex()
         .compiler(TexCompiler.LUALATEX)
         .documentclassWithOptions("scrlttr2", Map.of("version", "last"))
         .usePackages("babel")
         .usePackageWithOptions("microtype", Map.of("activate", "{true,nocompatibility}", "final", "", "tracking", "true"))
         .usePackageWithOptions("siunitx", Map.of("locale", "DE", "separate-uncertainty", "", "per-mode", "fraction"))
         .usePackageWithOptions("csquotes", Map.of("strict", "true", "autostyle", "true", "german", "guillemets"))
         .usePackages("xcolor", "datetime2", "selnolig", "phonenumbers", "marvosym", "ifthen")
         .usePackageWithOption("hyperref", "hidelinks")
         .addToPreamble(Latex.MINOR_SEPARATOR)
         .addToPreamble("% layout definitions")
         .addToPreamble(Latex.MINOR_SEPARATOR)
         .addToPreamble("\\KOMAoptions{fromphone=on,fromrule=aftername,fromemail=on,foldmarks=" + (this.foldmarks != null ? this.foldmarks : "off") + "}")
         .addToPreamble("\\SetTracking{encoding={*},shape=sc}{40}")
         .addToPreamble(Latex.EMPTY_LINE)
         .addToPreamble("\\newboolean{showbank}")
         .addToPreamble("\\setboolean{showbank}{false}")
         .addToPreamble("\\newboolean{smaller}")
         .addToPreamble("\\setboolean{smaller}{false}")
         .addToPreamble("\\setkomafont{fromname}{\\scshape \\LARGE} ")
         .addToPreamble("\\setkomafont{backaddress}{\\mdseries}")
         .addToPreamble(Latex.EMPTY_LINE)
         .addToPreamble("\\makeatletter")
         .addToPreamble("\\newcommand{\\layout}{\\ifthenelse{\\boolean{smaller}}{")
         .addToPreamble(Latex.indent(1) + "\\@setplength{firstheadvpos}{17mm}%")
         .addToPreamble(Latex.indent(1) + "\\@setplength{firstfootvpos}{275mm}% Abstand des Footers von oben")
         .addToPreamble(Latex.indent(1) + "\\@setplength{locwidth}{70mm}% Breite des Locationfeldes")
         .addToPreamble(Latex.indent(1) + "\\@setplength{locvpos}{55mm}% Abstand des Locationfeldes von oben")
         .addToPreamble(Latex.indent(1) + "\\@setplength{foldmarkhpos}{6.5mm}%")
         .addToPreamble(Latex.indent(1) + "}{}}")
         .addToPreamble("\\makeatother%")
         .addToPreamble(Latex.EMPTY_LINE)
         .addToPreamble("\\setkomavar{firsthead}{%")
         .addToPreamble(Latex.indent(1) + "\\usekomavar{fromlogo}\\hfill\\scshape\\LARGE\\usekomavar{fromname}\\\\")
         .addToPreamble(Latex.indent(1) + "\\rule[3pt]{\\textwidth}{.4pt}%")
         .addToPreamble("}")
         .addToPreamble(Latex.EMPTY_LINE)
         .addToPreamble("\\setkomavar{firstfoot}{\\footnotesize%")
         .addToPreamble(Latex.indent(1) + "\\rule[3pt]{\\textwidth}{.4pt}\\\\")
         .addToPreamble(Latex.indent(1) + "\\begin{tabular}[t]{l@{}}%")
         .addToPreamble(Latex.indent(2) + "\\usekomavar{fromname}\\\\")
         .addToPreamble(Latex.indent(2) + "\\usekomavar{fromaddress}\\\\")
         .addToPreamble(Latex.indent(1) + "\\end{tabular}%")
         .addToPreamble(Latex.indent(1) + "\\hfill")
         .addToPreamble(Latex.indent(1) + "\\begin{tabular}[t]{l@{}}%")
         .addToPreamble(Latex.indent(2) + "\\usekomavar{fromphone}\\\\")
         .addToPreamble(Latex.indent(2) + "\\usekomavar{fromemail}\\\\")
         .addToPreamble(Latex.indent(1) + "\\end{tabular}%")
         .addToPreamble(Latex.indent(1) + "\\ifthenelse{\\boolean{showbank}}{\\ifkomavarempty{frombank}{}{%")
         .addToPreamble(Latex.indent(2) + "\\hfill")
         .addToPreamble(Latex.indent(2) + "\\begin{tabular}[t]{r@{}}%")
         .addToPreamble(Latex.indent(3) + "\\usekomavar{frombank}")
         .addToPreamble(Latex.indent(2) + "\\end{tabular}%")
         .addToPreamble(Latex.indent(2) + "}}{}%")
         .addToPreamble("}")
         .addToPreamble(Latex.EMPTY_LINE)
         .addToPreamble("\\renewcommand*{\\raggedsignature}{\\raggedright}")
         .addToPreamble(Latex.MINOR_SEPARATOR)
         .addToPreamble(Latex.EMPTY_LINE);
   }

   @Deprecated(
      forRemoval = true,
      since = "1.3.2"
   )
   public static KomaLetter as(File file) {
      return new KomaLetter().file(file);
   }

   public static KomaLetter as(Path file) {
      return new KomaLetter().file(file);
   }

   public static KomaLetter as(String file) {
      return as(new File(file));
   }

   @Deprecated(
      forRemoval = true,
      since = "1.3.2"
   )
   public KomaLetter file(File file) {
      this.file = file == null ? null : file.toPath();
      return this;
   }

   public KomaLetter file(Path file) {
      this.file = file;
      return this;
   }

   public KomaLetter clean(boolean clean, String... exts) {
      this.clean = clean;
      this.cleanupFileExtensions = Objects.requireNonNullElse(exts, new String[0]);
      return this;
   }

   public KomaLetter title(String title) {
      this.title = title;
      return this;
   }

   public KomaLetter subject(String subject) {
      this.subject = subject;
      return this;
   }

   public KomaLetter user(Texable user) {
      this.user = user;
      return this;
   }

   @Deprecated(
      forRemoval = true,
      since = "1.3.4"
   )
   public KomaLetter showbank(boolean showbank) {
      return this.showBank(showbank);
   }

   public KomaLetter showBank(boolean showBank) {
      this.showbank = showBank;
      return this;
   }

   public KomaLetter foldmarks(String foldmarks) {
      this.foldmarks = foldmarks;
      return this;
   }

   public KomaLetter language(String language) {
      this.language = language;
      return this;
   }

   public KomaLetter write(String... body) {
      this.body = body;
      return this;
   }

   public KomaLetter toName(String toName) {
      this.toName = toName;
      return this;
   }

   public KomaLetter toStreet(String toStreet) {
      this.toStreet = toStreet;
      return this;
   }

   public KomaLetter toCity(String toCity) {
      this.toCity = toCity;
      return this;
   }

   public KomaLetter toExtra(String toExtra) {
      this.toExtra = toExtra;
      return this;
   }

   public KomaLetter yourRef(String yourRef) {
      this.yourRef = yourRef;
      return this;
   }

   public KomaLetter myRef(String myRef) {
      this.myRef = myRef;
      return this;
   }

   public KomaLetter yourMail(String date) {
      this.yourMail = date;
      return this;
   }

   public KomaLetter customer(String customer) {
      this.customer = customer;
      return this;
   }

   public KomaLetter invoice(String invoice) {
      this.invoice = invoice;
      return this;
   }

   @Deprecated(
      forRemoval = true,
      since = "1.3.2"
   )
   public KomaLetter date(Calendar date) {
      this.date = date == null ? null : LocalDate.ofInstant(date.toInstant(), ZoneId.systemDefault());
      return this;
   }

   public KomaLetter date(LocalDate date) {
      this.date = date;
      return this;
   }

   public KomaLetter opening(String opening) {
      this.opening = opening;
      return this;
   }

   public KomaLetter closing(String closing) {
      this.closing = closing;
      return this;
   }

   public KomaLetter ps(String ps) {
      this.ps = ps;
      return this;
   }

   public KomaLetter encl(String... encl) {
      this.encl = encl;
      return this;
   }

   public KomaLetter cc(String... cc) {
      this.cc = cc;
      return this;
   }

   public int exec() {
      if (this.date == null) {
         this.date = LocalDate.now();
      }

      String address = (this.toStreet == null ? "" : this.toStreet + "\\\\")
         + (this.toCity == null ? "" : this.toCity + "\\\\")
         + (this.toExtra == null ? "" : this.toExtra);
      String locale = this.user
         .neededPackages()
         .stream()
         .filter(p -> p.name().equals("babel"))
         .findFirst()
         .orElse(new LatexPackage("babel"))
         .options()
         .getOrDefault("main", "english");
      if (this.language != null) {
         locale = this.language;
      }

      Latex tex = this.setup().folder(this.file.getParent().toString()).filename(this.file.getFileName().toString());
      if (this.user != null) {
         tex.add(this.user);
      }

      tex.usePackageWithOptions("babel", Map.of("main", locale))
         .addToPreamble(Latex.MINOR_SEPARATOR)
         .addToPreamble("% mail specific settings")
         .addToPreamble(Latex.MINOR_SEPARATOR)
         .addToPreamble("\\setboolean{showbank}{" + this.showbank + "}")
         .addToPreamble("\\setboolean{smaller}{" + this.smaller + "}")
         .addToPreamble(Latex.EMPTY_LINE)
         .addToPreamble("\\setkomavar{toname}{" + (this.toName == null ? "" : this.toName) + "}")
         .addToPreamble("\\setkomavar{toaddress}{" + address + "}")
         .addToPreamble(Latex.EMPTY_LINE)
         .addToPreamble("\\setkomavar{title}{" + (this.title == null ? "" : this.title) + "}")
         .addToPreamble("\\setkomavar{subject}{" + (this.subject == null ? "" : this.subject) + "}")
         .addToPreamble("\\setkomavar{yourref}{" + (this.yourRef == null ? "" : this.yourRef) + "}")
         .addToPreamble("\\setkomavar{yourmail}{" + (this.yourMail == null ? "" : this.yourMail) + "}")
         .addToPreamble("\\setkomavar{myref}{" + (this.myRef == null ? "" : this.myRef) + "}")
         .addToPreamble("\\setkomavar{customer}{" + (this.customer == null ? "" : this.customer) + "}")
         .addToPreamble("\\setkomavar{invoice}{" + (this.invoice == null ? "" : this.invoice) + "}")
         .addToPreamble(
            "\\setkomavar{date}{\\DTMdisplaydate{" + this.date.getYear() + "}{" + this.date.getMonthValue() + "}{" + this.date.getDayOfMonth() + "}{-1}}"
         )
         .addToPreamble(Latex.MINOR_SEPARATOR)
         .addToPreamble(Latex.EMPTY_LINE)
         .addToPreamble("\\layout")
         .add("\\begin{letter}{}");
      if (this.opening != null) {
         tex.add(Latex.indent(1) + "\\opening{" + this.opening + "}");
      }

      if (this.body != null) {
         for(String line : this.body) {
            tex.add(Latex.indent(1) + line);
            tex.add("");
         }
      }

      if (this.closing != null) {
         tex.add(Latex.indent(1) + "\\closing{" + this.closing + "}");
      }

      if (this.ps != null) {
         tex.add(Latex.indent(1) + "\\ps " + this.ps);
      }

      if (this.encl != null) {
         tex.add(Latex.indent(1) + "\\encl{");

         for(String line : this.encl) {
            tex.add(Latex.indent(2) + line + "\\\\");
         }

         tex.add(Latex.indent(1) + "}");
      }

      if (this.cc != null) {
         tex.add(Latex.indent(1) + "\\cc{");

         for(String line : this.cc) {
            tex.add(Latex.indent(2) + line + "\\\\");
         }

         tex.add(Latex.indent(1) + "}");
      }

      tex.add("\\end{letter}");
      tex.add("");
      tex.clean(this.clean, this.cleanupFileExtensions);
      return tex.exec();
   }
}
