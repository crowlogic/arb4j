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
                             .title("Understanding E=$mc^2$")
                             .authors("Author Name")
                             .maketitle(false);

    latex.section("Introduction");
    latex.add("This document contains some statements and whatnot.");
    latex.add("This is the first paragraph of the paper.");
    latex.add("This is the second paragraph of the paper.");

    int errorCode = latex.exec();
    System.out.println("LaTeX compilation finished with error code: " + errorCode);
  }
}