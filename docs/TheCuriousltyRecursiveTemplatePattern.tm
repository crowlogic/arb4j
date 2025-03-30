<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|The Curiously Recurring Template Pattern: History and
  Application in Orthogonal Expansions>|<doc-author|<author-data|<author-name|Stephen
  Crowley & Perplexity AI>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Historical
    Context> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Technical
    Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Application
    to Orthogonal Expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Theoretical
    Significance> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Historical
    Impact> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Modern
    Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Historical Context>

  The Curiously Recurring Template Pattern (CRTP) emerged from multiple
  sources in the mid-1990s. While its theoretical foundations were
  established in 1989 under the academic term \PF-bound polymorphism\Q, the
  pattern received its memorable name from Jim Coplien in 1995 through his
  \PColumn Without a Name\Q in C++ Report \V an amusing irony given the
  pattern's previous nameless state.

  In a parallel development, Microsoft developers working on the Active
  Template Library (ATL) independently discovered the pattern in 1995. Jan
  Falkin's accidental derivation of a base class from a derived class led to
  what would become a cornerstone of both ATL and the Windows Template
  Library (WTL).

  <section|Technical Structure>

  The pattern's fundamental form involves a class inheriting from a templated
  base class using itself as the template parameter:

  <\equation>
    <text|class Derived extends Base>\<less\><text|Derived>\<gtr\>
  </equation>

  <section|Application to Orthogonal Expansions>

  In the context of orthogonal function expansions, CRTP manifests in a
  particularly elegant way. Consider the implementation:

  <verbatim|public class LegendrePolynomialExpansion extends
  OrthogonalExpansion\<less\>Real, Real, LegendrePolynomialExpansion,
  LegendrePolynomialSequence\<gtr\>>

  This structure enables the expansion class to serve as both:

  <\itemize>
    <item>The concrete implementation of the expansion

    <item>The function type parameter in its own definition
  </itemize>

  <section|Theoretical Significance>

  The pattern's importance extends beyond mere implementation details:

  <\enumerate>
    <item>It enables static polymorphism without virtual function overhead

    <item>Provides compile-time type safety

    <item>Allows base classes to access derived class members during
    compilation

    <item>Facilitates template metaprogramming techniques
  </enumerate>

  <section|Historical Impact>

  The pattern's discovery challenged conventional wisdom about inheritance
  and template instantiation. Many developers initially doubted such
  recursive template instantiation would compile \V a skepticism so
  widespread it contributed to the pattern's \PCurious\Q designation in its
  name.

  This skepticism reflects a deeper truth about software patterns: sometimes
  the most powerful idioms are those that seem to defy our intuitive
  understanding of programming language mechanics.

  <section|Modern Applications>

  CRTP has become fundamental in modern C++ libraries, particularly in:

  <\itemize>
    <item>Windows Template Library (WTL)

    <item>Active Template Library (ATL)

    <item>Various numerical computing frameworks
  </itemize>

  Its adoption in Java through generics demonstrates its
  language-transcending utility, particularly in mathematical and scientific
  computing applications like orthogonal function expansions.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-6|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_55.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Historical
      Context> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Technical
      Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Application
      to Orthogonal Expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Theoretical
      Significance> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Historical
      Impact> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Modern
      Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>