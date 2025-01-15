package arb.utensils.text.latex;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;

import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Article implements
                     Typesettable
{

  public static void main(String[] args) throws IOException
  {
    Article article = new Article("Vector Spaces and Linear Maps",
                                  "Dr. Linear Algebra",
                                  "This text develops linear algebra from its axiomatic foundations.");

    article.addSection("Vector Spaces");

    Items      axioms   =
                      article.enumerate()
                             .add("$(\\mathbf{u} + \\mathbf{v}) + \\mathbf{w} = \\mathbf{u} + (\\mathbf{v} + \\mathbf{w})$")
                             .add("$\\mathbf{v} + \\mathbf{0} = \\mathbf{v}$")
                             .add("$\\mathbf{v} + (-\\mathbf{v}) = \\mathbf{0}$")
                             .add("$\\mathbf{v} + \\mathbf{w} = \\mathbf{w} + \\mathbf{v}$");

    Definition vecSpace = article.definition("vectorspace",
                                             () -> "A vector space consists of a set $V$ with operations satisfying:\n"
                                                   + axioms.typeset());
    article.add(vecSpace);

    article.addSection("Linear Maps");
    Theorem dim = article.define("kernelimage", () -> "$\\dim V = \\dim \\ker T + \\dim \\operatorname{im} T$");
    article.add(dim);
    article.add(dim.proof(() -> "For a basis $\\{v_1,\\ldots,v_k\\}$ of $\\ker T$, extend to a basis of $V$..."));

    Files.writeString(Path.of("linear_algebra.tex"), article.typeset());
  }

  public static class Items implements
                            Typesettable
  {
    final String            type;
    final ArrayList<String> items = new ArrayList<>();

    Items(String type)
    {
      this.type = type;
    }

    public Items add(String item)
    {
      items.add(item);
      return this;
    }

    @Override
    public String typeset()
    {
      var tex = "\\begin{" + type + "}\n";
      for (var item : items)
        tex += "\\item " + item + "\n";
      return tex + "\\end{" + type + "}";
    }
  }

  public static class Theorem implements
                              Typesettable
  {
    final String       label;
    final Typesettable content;

    Theorem(String label, Typesettable content)
    {
      this.label   = label;
      this.content = content;
    }

    @Override
    public String typeset()
    {
      return "\\begin{theorem}\\label{thm:" + label + "}\n" + content.typeset() + "\n\\end{theorem}";
    }

    public Proof proof(Typesettable content)
    {
      return new Proof(content);
    }
  }

  public static class Lemma implements
                            Typesettable
  {
    final String       label;
    final Typesettable content;

    Lemma(String label, Typesettable content)
    {
      this.label   = label;
      this.content = content;
    }

    @Override
    public String typeset()
    {
      return "\\begin{lemma}\\label{lem:" + label + "}\n" + content.typeset() + "\n\\end{lemma}";
    }

    public Proof proof(Typesettable content)
    {
      return new Proof(content);
    }
  }

  public static class Definition implements
                                 Typesettable
  {
    final String       label;
    final Typesettable content;

    Definition(String label, Typesettable content)
    {
      this.label   = label;
      this.content = content;
    }

    @Override
    public String typeset()
    {
      return "\\begin{definition}\\label{def:" + label + "}\n" + content.typeset() + "\n\\end{definition}";
    }
  }

  public static class Proof implements
                            Typesettable
  {
    final Typesettable content;

    Proof(Typesettable content)
    {
      this.content = content;
    }

    @Override
    public String typeset()
    {
      return "\\begin{proof}\n" + content.typeset() + "\n\\end{proof}";
    }
  }

  final ArrayList<String>       packages = new ArrayList<>();
  final ArrayList<Typesettable> content  = new ArrayList<>();
  final String                  title;
  final String                  author;
  String                        abstractText;

  public Article(String title, String author, String abstractText)
  {
    this.title        = title;
    this.author       = author;
    this.abstractText = abstractText;
    initPackages();
  }

  void initPackages()
  {
    packages.add("\\usepackage{amsmath,amsthm,amsfonts,amssymb}");
    packages.add("\\usepackage[utf8]{inputenc}");
  }

  public Items enumerate()
  {
    return new Items("enumerate");
  }

  public Items itemize()
  {
    return new Items("itemize");
  }

  public Theorem define(String label, Typesettable content)
  {
    return new Theorem(label,
                       content);
  }

  public Definition definition(String label, Typesettable content)
  {
    return new Definition(label,
                          content);
  }

  public Lemma lemma(String label, Typesettable content)
  {
    return new Lemma(label,
                     content);
  }

  public void add(Typesettable element)
  {
    content.add(element);
  }

  public void addSection(String title)
  {
    content.add(() -> "\\section{" + title + "}");
  }

  public void addSubsection(String title)
  {
    content.add(() -> "\\subsection{" + title + "}");
  }

  @Override
  public String typeset()
  {
    var tex = "\\documentclass{article}\n\n"
              + String.join("\n", packages)
              + "\n\n"
              + defineTheoremEnvironments()
              + "\n"
              + "\\begin{document}\n\n"
              + "\\title{"
              + escape(title)
              + "}\n"
              + "\\author{"
              + escape(author)
              + "}\n"
              + "\\maketitle\n\n";

    if (abstractText != null && !abstractText.isEmpty())
    {
      tex += "\\begin{abstract}\n" + abstractText + "\n\\end{abstract}\n\n";
    }

    tex += content.stream().map(Typesettable::typeset).reduce("", (a, b) -> a + "\n\n" + b);

    return tex + "\n\\end{document}";
  }

  String defineTheoremEnvironments()
  {
    return "\\theoremstyle{plain}\n"
           + "\\newtheorem{theorem}{Theorem}[section]\n"
           + "\\newtheorem{lemma}[theorem]{Lemma}\n"
           + "\\newtheorem{proposition}[theorem]{Proposition}\n"
           + "\\newtheorem{corollary}[theorem]{Corollary}\n\n"
           + "\\theoremstyle{definition}\n"
           + "\\newtheorem{definition}[theorem]{Definition}\n"
           + "\\newtheorem{example}[theorem]{Example}\n\n"
           + "\\theoremstyle{remark}\n"
           + "\\newtheorem{remark}[theorem]{Remark}\n"
           + "\\newtheorem{note}[theorem]{Note}";
  }

  String escape(String text)
  {
    return text.replace("&", "\\&")
               .replace("%", "\\%")
               .replace("$", "\\$")
               .replace("#", "\\#")
               .replace("_", "\\_")
               .replace("{", "\\{")
               .replace("}", "\\}")
               .replace("~", "\\textasciitilde")
               .replace("^", "\\textasciicircum")
               .replace("\\", "\\textbackslash");
  }

}