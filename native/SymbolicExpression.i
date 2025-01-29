%typemap(javainterfaces) fexpr_struct "AutoCloseable"
%typemap(javafinalize) fexpr_struct ""

%typemap(javaimports) fexpr_struct %{

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * SymbolicExpression is the C->Java (via SWIG) mapping of
 * <h1><strong>fexpr.h</strong> – flat-packed symbolic expressions</h1> which
 * support working with {@link SymbolicExpression}s.
 * </p>
 * <p>
 * A symbolic expression is either:
 * </p>
 * <ul class="simple">
 * <li>
 * <p>
 * An atom, being one of the following:
 * </p>
 * <ul>
 * <li>
 * <p>
 * An integer, for example 0 or -34.
 * </p>
 * </li>
 * <li>
 * <p>
 * A symbol, for example
 * <code class="docutils literal notranslate"><span class="pre">x</span></code>,
 * <code class="docutils literal notranslate"><span class=
 * "pre">Mul</span></code>,
 * <code class="docutils literal notranslate"><span class=
 * "pre">SomeUserNamedSymbol</span></code>. <br>
 * Symbols should be valid C identifiers (containing only the characters
 * <code class="docutils literal notranslate"><span class=
 * "pre">A-Z</span></code>,
 * <code class="docutils literal notranslate"><span class=
 * "pre">a-z</span></code>,
 * <code class="docutils literal notranslate"><span class=
 * "pre">0-9</span></code>,
 * <code class="docutils literal notranslate"><span class="pre">_</span></code>,
 * and not starting with a digit).
 * </p>
 * </li>
 * <li>
 * <p>
 * A string, for example <code class="docutils literal notranslate"><span class=
 * "pre">&quot;Hello,</span> <span class="pre">world!&quot;</span></code>. <br>
 * For the moment, we only consider ASCII strings, but there is no obstacle in
 * principle to supporting UTF-8.
 * </p>
 * </li>
 * </ul>
 * </li>
 * <li>
 * <p>
 * A non-atomic expression, representing a function call
 * <span class="math notranslate nohighlight">\(e_0(e_1, \ldots, e_n)\)</span>
 * where <span class="math notranslate nohighlight">\(e_0, \ldots, e_n\)</span>
 * are symbolic expressions.
 * </p>
 * </li>
 * </ul>
 * <p>
 * The meaning of an expression depends on the interpretation of symbols in a
 * given context. For example, with a standard interpretation (used within
 * Calcium) of the symbols
 * <code class="docutils literal notranslate"><span class=
 * "pre">Mul</span></code>,
 * <code class="docutils literal notranslate"><span class=
 * "pre">Add</span></code> and
 * <code class="docutils literal notranslate"><span class=
 * "pre">Neg</span></code>, the expression
 * <code class="docutils literal notranslate"><span class=
 * "pre">Mul(3,</span> <span class="pre">Add(Neg(x),</span> <span class=
 * "pre">y))</span></code> encodes the formula
 * <span class="math notranslate nohighlight">\(3 \cdot ((-x)+y)\)</span> where
 * <code class="docutils literal notranslate"><span class="pre">x</span></code>
 * and
 * <code class="docutils literal notranslate"><span class="pre">y</span></code>
 * are symbolic variables. See
 * <a class="reference internal" href="fexpr_builtin.html#fexpr-builtin"><span
 * class="std std-ref">fexpr_builtin.h – builtin symbols</span></a> for
 * documentation of builtin symbols.
 * </p>
 * <section id="computing-and-embedding-data">
 * <h3>Computing and embedding
 * data<a class="headerlink" href="#computing-and-embedding-data" title=
 * "Permalink to this headline">¶</a></h3>
 * <p>
 * Symbolic expressions are usually not the best data structure to use directly
 * for heavy-duty computations. Functions acting on symbolic expressions will
 * typically convert to a dedicated data structure (e.g. polynomials) internally
 * and (optionally) convert the final result back to a symbolic expression.
 * </p>
 * <p>
 * Symbolic expressions do not allow embedding arbitrary binary objects such as
 * Flint/Arb/Antic/Calcium types as atoms. This is done on purpose to make
 * symbolic expressions easy to use as a data exchange format. To embed an
 * object in an expression, one has the following options:
 * </p>
 * <ul class="simple">
 * <li>
 * <p>
 * Represent the object structurally using atoms supported natively by symbolic
 * expressions (for example, an integer polynomial can be represented as a list
 * of coefficients or as an arithmetic expression tree).
 * </p>
 * </li>
 * <li>
 * <p>
 * Introduce a dummy symbol to represent the object, maintaining an external
 * translation table mapping this symbol to the intended value.
 * </p>
 * </li>
 * <li>
 * <p>
 * Encode the object using a string or symbol name. This is generally not
 * recommended, as it requires parsing; properly used, symbolic expressions have
 * the benefit of being able to represent the parsed structure.
 * </p>
 * </li>
 * </ul>
 * </section> <section id="flat-packed-representation">
 * <h3>Flat-packed
 * representation<a class="headerlink" href="#flat-packed-representation" title=
 * "Permalink to this headline">¶</a></h3>
 * <p>
 * Symbolic expressions are often implemented using trees of pointers (often
 * together with hash tables for uniqueness), requiring some form of memory
 * management. The
 * <a class="reference internal" href="#c.fexpr_t" title="fexpr_t"><code class=
 * "xref c c-type docutils literal notranslate"><span class=
 * "pre">fexpr_t</span></code></a> type, by contrast, stores a symbolic
 * expression using a “flat-packed” representation without internal pointers.
 * The expression data is just an array of words
 * (<code class="docutils literal notranslate"><span class=
 * "pre">ulong</span></code>). The first word is a header encoding type
 * information (whether the expression is a function call or an atom, and the
 * type of the atom) and the total number of words in the expression. For atoms,
 * the data is stored either in the header word itself (small integers and short
 * symbols/strings) or in the following words. For function calls, the header is
 * followed by the expressions
 * <span class="math notranslate nohighlight">\(e_0\)</span>, …,
 * <span class="math notranslate nohighlight">\(e_n\)</span> packed contiguously
 * in memory.
 * </p>
 * <p>
 * Pros:
 * </p>
 * <ul class="simple">
 * <li>
 * <p>
 * Memory management is trivial.
 * </p>
 * </li>
 * <li>
 * <p>
 * Copying an expression is just copying an array of words.
 * </p>
 * </li>
 * <li>
 * <p>
 * Comparing expressions for equality is just comparing arrays of words.
 * </p>
 * </li>
 * <li>
 * <p>
 * Merging expressions is basically just concatenating arrays of words.
 * </p>
 * </li>
 * <li>
 * <p>
 * Expression data can be shared freely in binary form between threads and even
 * between machines (as long as all machines have the same word size and
 * endianness).
 * </p>
 * </li>
 * </ul>
 * <p>
 * Cons:
 * </p>
 * <ul class="simple">
 * <li>
 * <p>
 * Repeated instances of the same subexpression cannot share memory (a
 * workaround is to introduce local dummy symbols for repeated subexpressions).
 * </p>
 * </li>
 * <li>
 * <p>
 * Extracting a subexpression for modification generally requires making a
 * complete copy of that subxepression (however, for read-only access to
 * subexpressions, one can use “view” expressions which have zero overhead).
 * </p>
 * </li>
 * <li>
 * <p>
 * Manipulating a part of an expression generally requires rebuilding the whole
 * expression.
 * </p>
 * </li>
 * <li>
 * <p>
 * Building an expression incrementally is typically
 * <span class="math notranslate nohighlight">\(O(n^2)\)</span>. As a
 * workaround, it is a good idea to work with balanced (low-depth) expressions
 * and try to construct an expression in one go (for example, to create a sum,
 * create a single <code class="docutils literal notranslate"><span class=
 * "pre">Add</span></code> expression with many arguments instead of chaining
 * binary <code class="docutils literal notranslate"><span class=
 * "pre">Add</span></code> operations).
 * </p>
 * </li>
 * </ul>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 */%}

%typemap(javaconstruct) fexpr_struct %{
  {
    this($imcall, true);
    init();
  }
%}



%typemap(javacode) fexpr_struct %{

  @Override
  public String toString()
  {
    return arblib.fexpr_get_str(this);
  }

  public SymbolicExpression init()
  {
    arblib.fexpr_init(this);
    return this;
  }

  @Override
  public void close()
  {
    delete();
  }
    
  static
  {
    System.loadLibrary("arblib");
  }
 
 
%};
