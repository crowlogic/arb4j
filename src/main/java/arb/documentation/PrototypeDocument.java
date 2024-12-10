package arb.documentation;

import arb.utensils.text.latex.Latex;
import arb.utensils.text.latex.TexCompiler;

public final class PrototypeDocument
{

  public static void main(String[] args)
  {
    Latex latex = new Latex().compiler(TexCompiler.PDFLATEX)
                             .documentclass("article")
                             .folder(".")
                             .filename("output.tex")
                             .title("Prototype")
                             .authors("Stephen Andrew Crowley")
                             .maketitle(true);

    latex.section("Introduction");
    latex.subsection("Dammit Dammit");
    latex.subsubsection("WooHoo");
    latex.add("This document contains some statements and whatnot.");
    latex.add("This is the first paragraph of the paper.");
    latex.add("This is the second paragraph of the paper.");
    latex.equation("a*x=b");
    latex.show();
    int errorCode = latex.exec();
    System.out.println("LaTeX compilation finished with error code: " + errorCode);
  }
}