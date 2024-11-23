<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Critical Points of a
  Function>|<doc-author|<author-data|<author-name|S.A.C.>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Defining
    Critical Points> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Types
    of Critical Points> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Local Maxima and Minima
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Saddle Points
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|2.3<space|2spc>Inflection Points
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.4<space|2spc>Cusps
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|2.5<space|2spc>Vertical Tangents
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|2.6<space|2spc>Discontinuities
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|2.7<space|2spc>Endpoints
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Inflection
    Points and Concavity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Stationary
    vs Singular Points> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  Critical points in mathematics are key locations on a function's graph
  where the derivative equals zero or is undefined, potentially indicating
  local extrema, inflection points, or other significant features of the
  function.

  <section|Defining Critical Points>

  Critical points are fundamental concepts in calculus, defined as the
  x-values where a function's derivative is either zero or undefined. These
  points are crucial for understanding a function's behavior and identifying
  its key features.

  To formally define critical points, let's consider a function
  <math|f<around|(|x|)>> that is differentiable on an open interval
  containing <math|x=a>, except possibly at <math|x=a> itself. The point
  <math|x=a> is a critical point of f if either:

  <\itemize>
    <item><math|f<rprime|'><around|(|a|)>=0> (the derivative equals zero)

    <item><math|f<rprime|'><around|(|a|)>> does not exist (the derivative is
    undefined)
  </itemize>

  This definition encompasses both stationary points and singular points,
  providing a comprehensive view of a function's significant locations.

  Critical points are essential for several reasons:

  <\itemize>
    <item>They indicate potential extrema (local maxima or minima) of the
    function

    <item>They can represent inflection points where the function's concavity
    changes

    <item>They help identify points where the function's rate of change
    alters significantly
  </itemize>

  To find critical points, one typically follows these steps:

  <\enumerate>
    <item>Calculate the function's derivative,
    <math|f<rprime|'><around|(|x|)>>

    <item>Set the derivative equal to zero and solve for x

    <item>Identify any x-values where the derivative is undefined
  </enumerate>

  It's important to note that while all stationary points are critical
  points, not all critical points are stationary points. This distinction is
  crucial for a thorough analysis of a function's behavior.

  Understanding critical points is fundamental to many calculus applications,
  including optimization problems, curve sketching, and analyzing function
  behavior. Identifying these key locations provides valuable insights into
  the functions under study. By examining these critical areas, one can
  better understand how functions behave and change over their domain.

  <section|Types of Critical Points>

  Critical points can be classified into several types based on their
  behavior and the characteristics of the function at those points.
  Understanding these distinctions is crucial for a comprehensive analysis of
  functions in calculus, as they help identify where significant changes in
  the function's behavior occur.

  <subsection|Local Maxima and Minima>

  These are the most common types of critical points. A local maximum occurs
  when the function's value is greater than that of its immediate
  surroundings, indicating a peak, while a local minimum is where the
  function's value is less than that of its neighbors, indicating a trough.
  At these points, the first derivative equals zero, indicating a horizontal
  tangent line. The second derivative test can be applied: if the second
  derivative is positive at a critical point, it's a local minimum; if
  negative, it's a local maximum. If the second derivative is zero, further
  analysis or higher-order derivatives may be needed to determine the nature
  of the point.

  <subsection|Saddle Points>

  Saddle points are critical points where the function changes from
  increasing to decreasing (or vice versa) in different directions. At a
  saddle point, the first derivative is zero, but it does not correspond to a
  local maximum or minimum. The second derivative test yields an inconclusive
  result for saddle points because the second derivative is zero or changes
  sign across the point.

  <subsection|Inflection Points>

  Inflection points are locations on a graph where the concavity of the
  function changes from concave up to concave down, or vice versa. This
  change in concavity means that the second derivative changes sign at these
  points. While not all inflection points qualify as critical points, some do
  meet this criterion if they occur at locations where the first derivative
  equals zero.

  <subsection|Cusps>

  A cusp occurs where two smooth curves meet to form a sharp point on the
  graph. At such points, the derivative is typically undefined due to the
  abrupt change in direction, classifying them as critical points.

  <subsection|Vertical Tangents>

  Vertical tangents occur when the slope of the tangent line becomes
  infinite, such as when approaching vertical asymptotes or certain power
  functions. At these points, the derivative is undefined, classifying them
  as critical points.

  <subsection|Discontinuities>

  Points of discontinuity occur where there is an abrupt "jump" or break in
  the graph of a function. These can also be considered critical points if
  the derivative is undefined at these locations.

  <subsection|Endpoints>

  For functions defined on closed intervals, endpoints are considered
  critical points even if the derivative does not equal zero at these
  locations.

  <section|Inflection Points and Concavity>

  Inflection points are crucial features of a function's graph where the
  concavity changes. Concavity refers to the way a curve bends. A function is
  concave up if its graph lies above its tangent lines, and concave down if
  its graph lies below its tangent lines. Mathematically, this is determined
  by the second derivative:

  <\itemize>
    <item>If <math|f<rprime|''><around|(|x|)>\<gtr\>0>, the function is
    concave up

    <item>If <math|f<rprime|''><around|(|x|)>\<less\>0>, the function is
    concave down
  </itemize>

  An inflection point occurs at <math|x=c> if the concavity changes from
  concave up to concave down at <math|x=c>, or vice versa.

  To determine whether an inflection point is also a critical point, we need
  to examine the first derivative:

  <\enumerate>
    <item>If <math|f<rprime|'><around|(|c|)>=0>, the inflection point is also
    a critical point (stationary point of inflection)

    <item>If <math|f<rprime|'><around|(|c|)>\<neq\>0>, the inflection point
    is not a critical point (non-stationary point of inflection)
  </enumerate>

  To find inflection points:

  <\enumerate>
    <item>Calculate <math|f<rprime|''><around|(|x|)>>

    <item>Find where <math|f<rprime|''><around|(|x|)>=0> or where
    <math|f<rprime|''><around|(|x|)>> is undefined

    <item>Check if the sign of <math|f<rprime|''><around|(|x|)>> changes at
    these points
  </enumerate>

  For example, consider <math|f<around|(|x|)>=x<rsup|3>-x>. The second
  derivative is <math|f<rprime|''><around|(|x|)>=6*x>. Setting this to zero,
  we find a potential inflection point at <math|x=0>. Checking the sign of
  <math|f<rprime|''><around|(|x|)>> on either side of <math|x=0>, we confirm
  that it changes from negative to positive, so <math|x=0> is indeed an
  inflection point.

  <section|Stationary vs Singular Points>

  When discussing critical points, it's essential to distinguish between two
  main categories: stationary points and singular points.

  Stationary points are critical points where the derivative of the function
  equals zero (<math|f<rprime|'><around|(|x|)>=0>). These points represent
  locations where the function's rate of change momentarily becomes zero,
  indicating a potential local extremum or a point of inflection. Stationary
  points include:

  <\itemize>
    <item>Local maxima: Where the function reaches a peak

    <item>Local minima: Where the function reaches a trough

    <item>Saddle points: Where the function changes from increasing to
    decreasing in different directions
  </itemize>

  Singular points are critical points where the derivative of the function is
  undefined. These points often represent discontinuities or abrupt changes
  in the function's behavior. Examples include:

  <\itemize>
    <item>Cusps: Where two smooth curves meet at a sharp point

    <item>Vertical tangents: Where the slope becomes infinite

    <item>Points of discontinuity: Where the function has a break or jump
  </itemize>

  To illustrate, consider the function <math|f<around|(|x|)>=<sqrt|x>>. The
  derivative of this function is <math|f<rprime|'><around|(|x|)>=<frac|1|2*<sqrt|x>>>.
  At <math|x=0>, the derivative is undefined, making it a singular point and
  thus a critical point. However, there are no x-values where
  <math|f<rprime|'><around|(|x|)>=0>, so this function has no stationary
  points.

  In practice, identifying whether a critical point is stationary or singular
  helps in determining the appropriate analytical approach. For stationary
  points, techniques like the first and second derivative tests can be
  applied to classify the nature of the extremum. For singular points, a
  closer examination of the function's behavior around that point is often
  necessary to understand its significance.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|3|3>>
    <associate|auto-11|<tuple|4|4>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|2.3|3>>
    <associate|auto-6|<tuple|2.4|3>>
    <associate|auto-7|<tuple|2.5|3>>
    <associate|auto-8|<tuple|2.6|3>>
    <associate|auto-9|<tuple|2.7|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Defining
      Critical Points> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Types
      of Critical Points> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Local Maxima and Minima
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Saddle Points
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Inflection Points
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Cusps
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.5<space|2spc>Vertical Tangents
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.6<space|2spc>Discontinuities
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|2.7<space|2spc>Endpoints
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Inflection
      Points and Concavity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Stationary
      vs Singular Points> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>