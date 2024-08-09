package eu.hoefel.jatex;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class Figure implements Texable {
   public static final String LABEL_NAMESPACE = "fig:";
   private String caption = "";
   private String captionShort = "";
   private boolean centering = true;
   private Tikz tikz;
   private String width = "";
   private String height = "";
   private String scale = "";
   private String position = "";
   private String breadth = "";
   private String path = "";
   private String label = null;
   private Figure.FigureEnvironment mode = Figure.FigureEnvironment.FIGURE;
   private Figure.FigureContent content = Figure.FigureContent.INCLUDEGRAPHICS;
   private Integer indentation = null;
   private Figure[] figs;
   private boolean isSubfigure;
   private List<String> postSubFigureCode = new ArrayList<>();
   private String[] subfigureWidths;
   private List<LatexPackage> packages = new ArrayList<>();
   private List<LatexPreambleEntry> preambleExtras = new ArrayList<>();

   public Figure() {
      this.packages.add(new LatexPackage("caption"));
      this.centering(true);
      this.mode(Figure.FigureEnvironment.FIGURE);
      this.content = Figure.FigureContent.INCLUDEGRAPHICS;
   }

   public String getCaption() {
      return this.caption;
   }

   public Figure caption(String caption) {
      this.caption = caption;
      return this;
   }

   public String getCaptionShort() {
      return this.captionShort;
   }

   public Figure captionShort(String captionShort) {
      this.captionShort = captionShort;
      return this;
   }

   public String getLabel() {
      return this.label;
   }

   public Figure label(String label) {
      this.label = label;
      return this;
   }

   public boolean isCentering() {
      return this.centering;
   }

   public Figure centering(boolean centering) {
      this.centering = centering;
      return this;
   }

   public Tikz getTikz() {
      return this.tikz;
   }

   public Figure tikz(Tikz tikz) {
      this.content = Figure.FigureContent.TIKZPICTURE;
      this.packages.addAll(tikz.neededPackages());
      this.preambleExtras.addAll(tikz.preambleExtras());
      this.tikz = tikz;
      return this;
   }

   public String getWidth() {
      return this.width;
   }

   public Figure width(String width) {
      this.width = width;
      this.scale = "";
      return this;
   }

   public String getHeight() {
      return this.height;
   }

   public Figure height(String height) {
      this.height = height;
      this.scale = "";
      return this;
   }

   public String getScale() {
      return this.scale;
   }

   public Figure scale(String scale) {
      this.scale = scale;
      this.width = "";
      this.height = "";
      return this;
   }

   public String getPosition() {
      return this.position;
   }

   public Figure position(String position) {
      if (this.mode == Figure.FigureEnvironment.FIGURE
         && !"!".equals(position)
         && !"h".equals(position)
         && !"t".equals(position)
         && !"b".equals(position)
         && !"p".equals(position)) {
         throw new IllegalArgumentException("Unknown position argument for figure");
      } else if (this.mode == Figure.FigureEnvironment.WRAPFIGURE
         && !"r".equalsIgnoreCase(position)
         && !"l".equalsIgnoreCase(position)
         && !"i".equalsIgnoreCase(position)
         && !"o".equalsIgnoreCase(position)) {
         throw new IllegalArgumentException("Unknown position argument for wrapfigure");
      } else {
         this.position = position;
         return this;
      }
   }

   public String getBreadth() {
      return this.breadth;
   }

   public Figure breadth(String breadth) {
      this.breadth = breadth;
      return this;
   }

   public String getPath() {
      return this.path;
   }

   public Figure path(String path) {
      this.path = path;
      return this;
   }

   public Figure.FigureEnvironment getMode() {
      return this.mode;
   }

   public Figure mode(Figure.FigureEnvironment mode) {
      this.mode = mode;
      return this;
   }

   public String getSize() {
      String ret = "[";
      if (!"".equals(this.width)) {
         ret = ret + "width=" + this.width;
      }

      if (!"".equals(this.height)) {
         ret = ret + "height=" + this.height;
      }

      if (!"".equals(this.scale)) {
         ret = ret + "scale=" + this.scale;
      }

      ret = ret + "]";
      if ("[]".equals(ret)) {
         ret = "";
      }

      return ret;
   }

   public Figure subfigures(Figure... figs) {
      for(Figure fig : figs) {
         fig.isSubfigure = true;
      }

      this.figs = figs;
      return this;
   }

   public Figure[] getSubfigures() {
      return this.figs;
   }

   public boolean isSubfigure() {
      return this.isSubfigure;
   }

   public Figure indentationLevel(Integer indentation) {
      this.indentation = indentation;
      return this;
   }

   public Integer getIndentation() {
      return this.indentation;
   }

   public Figure postSubFigureCode(String... code) {
      this.postSubFigureCode.clear();
      Collections.addAll(this.postSubFigureCode, code);
      return this;
   }

   private List<String> getPostSubFigureCodes() {
      if (this.postSubFigureCode.isEmpty()) {
         return this.postSubFigureCode;
      } else if (this.postSubFigureCode.size() != this.figs.length - 1) {
         throw new IllegalStateException(
            "# subfigures != # (post subfigures codes) - 1, with " + (this.figs.length - 1) + "!= " + this.postSubFigureCode.size()
         );
      } else {
         return this.postSubFigureCode;
      }
   }

   public Figure subfigureWidths(String... widths) {
      this.subfigureWidths = widths;
      return this;
   }

   public String[] getSubfigureWidths() {
      return this.subfigureWidths;
   }

   public static Figure in(Figure.FigureEnvironment env) {
      return new Figure().mode(env);
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
      List<String> ret = new ArrayList<>();
      int n = 1;
      if (this.getIndentation() != null) {
         n = this.getIndentation();
      }

      switch(this.mode) {
         case FIGURE:
            String pos = "";
            if (!this.getPosition().equals("")) {
               pos = pos + "[" + this.getPosition() + "]";
            }

            if (this.isSubfigure()) {
               ret.add(Latex.indent(n) + "\\begin{subfigure}" + pos + "{" + this.getBreadth() + "}%");
            } else {
               ret.add(Latex.indent(n) + "\\begin{figure}" + pos + "%");
            }
            break;
         case WRAPFIGURE:
            this.packages.add(new LatexPackage("wrapfig"));
            ret.add(Latex.indent(n) + "\\begin{wrapfigure}{" + this.getPosition() + "}{" + this.getBreadth() + "}%");
      }

      if (this.isCentering()) {
         ret.add(Latex.indent(n + 1) + "\\centering%");
      }

      Figure[] subFigs = this.getSubfigures();
      if (subFigs != null && subFigs.length > 0) {
         this.packages.add(new LatexPackage("subcaption", Map.of("hypcap", "true"), Map.of("subfig", Set.of(Figure.class))));
         this.packages.add(new LatexPackage("caption", Map.of("hypcap", "true")));
         List<String> postSubfigCodes = this.getPostSubFigureCodes();

         for(int i = 0; i < subFigs.length; ++i) {
            this.packages.addAll(subFigs[i].neededPackages());
            this.preambleExtras.addAll(subFigs[i].preambleExtras());
            subFigs[i].mode(Figure.FigureEnvironment.FIGURE);
            subFigs[i].indentationLevel(n + 1);
            if (this.getLabel() != null) {
               subFigs[i].label(this.getLabel() + "-" + i);
            }

            ret.addAll(subFigs[i].latexCode());
            if (i != subFigs.length - 1 && i < postSubfigCodes.size()) {
               ret.add(Latex.indent(n + 1) + (String)postSubfigCodes.get(i) + "%");
            }
         }
      } else {
         switch(this.content) {
            case INCLUDEGRAPHICS:
               ret.add(Latex.indent(n + 1) + "\\includegraphics" + this.getSize() + "{" + this.getPath() + "}%");
               break;
            case TIKZPICTURE:
               this.packages.addAll(this.getTikz().neededPackages());
               this.preambleExtras.addAll(this.getTikz().preambleExtras());
               List<String> code = this.getTikz().latexCode();
               if (code != null) {
                  for(int i = 0; i < code.size(); ++i) {
                     if (i != 0 && i != code.size() - 1) {
                        ret.add(Latex.indent(n + 2) + (String)code.get(i) + "%");
                     } else {
                        ret.add(Latex.indent(n + 1) + (String)code.get(i) + "%");
                     }
                  }
               }
         }
      }

      String fullCaption = Latex.indent(n + 1) + "\\caption";
      if (!this.getCaptionShort().equals("")) {
         fullCaption = fullCaption + "[" + this.getCaptionShort() + "]";
      }

      if (!this.getCaption().equals("")) {
         fullCaption = fullCaption + "{" + this.getCaption() + "}";
         ret.add(fullCaption + "%");
      }

      if (this.getLabel() != null) {
         ret.add(Latex.indent(n + 1) + "\\label{fig:" + this.getLabel() + "}%");
      }

      switch(this.mode) {
         case FIGURE:
            ret.add(Latex.indent(n) + "\\end{" + (this.isSubfigure() ? "sub" : "") + "figure}%");
            break;
         case WRAPFIGURE:
            ret.add(Latex.indent(n) + "\\end{wrapfigure}%");
      }

      return ret;
   }

   private static enum FigureContent {
      INCLUDEGRAPHICS,
      TIKZPICTURE;
   }

   public static enum FigureEnvironment {
      FIGURE,
      WRAPFIGURE;
   }
}
