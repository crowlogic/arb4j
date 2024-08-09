package arb.documentation;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import arb.theorems.RegularTheorem;
import eu.hoefel.jatex.Latex;
import eu.hoefel.jatex.LatexPackage;
import eu.hoefel.jatex.LatexPreambleEntry;
import eu.hoefel.jatex.TexCompiler;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class PrototypeDocument implements Document
{
  private String       title;
  private String       author;
  private List<String> body = new ArrayList<>();
  private String       filename;

  private PrototypeDocument()
  {
  }

  public static PrototypeDocument as(String filename)
  {
    PrototypeDocument paper = new PrototypeDocument();
    paper.filename = filename;
    return paper;
  }

  public PrototypeDocument title(String title)
  {
    this.title = title;
    return this;
  }

  public PrototypeDocument author(String author)
  {
    this.author = author;
    return this;
  }

  public PrototypeDocument write(String... paragraphs)
  {
    this.body.addAll(Arrays.asList(paragraphs));
    return this;
  }

  public int exec()
  {
    Latex latex = new Latex().compiler(TexCompiler.PDFLATEX)
                             .documentclassWithOptions("article", Map.of("12pt", ""))
                             .folder(".") // Add this line to set the current directory
                             .filename(filename)
                             .add(this);
    return latex.exec();
  }

  @Override
  public List<LatexPackage> neededPackages()
  {
    return List.of(new LatexPackage("amsmath"), new LatexPackage("amsthm"));
  }

  @Override
  public List<LatexPreambleEntry> preambleExtras()
  {
    List<LatexPreambleEntry> entries = new ArrayList<>();
    entries.add(new LatexPreambleEntry("\\newtheorem{theorem}{Theorem}"));
    if (title != null)
    {
      entries.add(new LatexPreambleEntry("\\title{" + title + "}"));
    }
    if (author != null)
    {
      entries.add(new LatexPreambleEntry("\\author{" + author + "}"));
    }
    return entries;
  }

  @Override
  public List<String> latexCode()
  {
    List<String> code = new ArrayList<>();
    code.add("\\maketitle");
    code.add("\\section{Introduction}");
    code.add("This document contains some statements and whatnot.");

    for (String paragraph : body)
    {
      code.add(paragraph);
      code.add("");
    }

    ExampleTheorem theorem = new ExampleTheorem();
    code.addAll(theorem.latexCode());

    return code;
  }

  public static class ExampleTheorem implements RegularTheorem
  {
    @Override
    public String state()
    {
      return "Let $E = mc^2$. This equation illustrates the equivalence of energy and mass.";
    }

    @Override
    public List<String> latexCode()
    {
      return List.of("\\begin{theorem}", state(), "\\end{theorem}");
    }
  }

  public static void main(String[] args)
  {
    int errorCode = PrototypeDocument.as("output.tex")
                                    .title("Understanding E=mc^2")
                                    .author("Author Name")
                                    .write("This is the first paragraph of the paper.",
                                           "This is the second paragraph of the paper.")
                                    .exec();
    System.out.println("LaTeX compilation finished with error code: " + errorCode);
  }
}