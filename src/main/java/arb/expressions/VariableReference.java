package arb.expressions;

import java.util.Objects;

import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class VariableReference<D, R, F extends Function<? extends D, ? extends R>>
{

  /**
   * Compile-time bounds on a variable, used to resolve quantities like n = ⌈α⌉ in
   * the Caputo fractional derivative without requiring a backing {@link arb.Real}
   * object in the {@link Context}.
   */
  public static class Bounds
  {
    public final double  lower;
    public final boolean lowerInclusive;
    public final double  upper;
    public final boolean upperInclusive;

    public Bounds(double lower, boolean lowerInclusive, double upper, boolean upperInclusive)
    {
      this.lower          = lower;
      this.lowerInclusive = lowerInclusive;
      this.upper          = upper;
      this.upperInclusive = upperInclusive;
    }

    /**
     * @return ⌈upper⌉
     */
    public int ceilOfUpperBound()
    {
      return (int) Math.ceil(upper);
    }

    @Override
    public String toString()
    {
      return String.format("%s%s, %s%s",
                           lowerInclusive ? "[" : "(",
                           lower,
                           upper,
                           upperInclusive ? "]" : ")");
    }
  }

  int level;

  @Override
  public String toString()
  {
    return index != null ? String.format("%s[%s]", name, index) : name;
  }

  public Class<?> type;

  public Bounds   bounds;

  @Override
  public int hashCode()
  {
    return Objects.hash(index, name);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    VariableReference<?, ?, ?> other = (VariableReference<?, ?, ?>) obj;
    return Objects.equals(index, other.index) && Objects.equals(name, other.name);
  }

  public VariableReference(String name)
  {
    assert !name.isEmpty() : "name is empty";
    this.name  = name == null ? null : name.trim();
    this.index = null;
  }

  public VariableReference(String name, Node<D, R, F> index)
  {
    this.name  = name == null ? null : Parser.subscriptAndSuperscriptsToRegular(name.trim());
    this.index = index;
  }

  public VariableReference(String name, Node<D, R, F> index, Class<?> type)
  {
    this(name,
         index);
    this.type = type;
  }

  public String        name;

  public Node<D, R, F> index;

  public int           position;

  /**
   * Sets compile-time bounds on this variable reference.
   *
   * @param lower          lower bound value
   * @param lowerInclusive true if lower bound is inclusive
   * @param upper          upper bound value
   * @param upperInclusive true if upper bound is inclusive
   * @return this
   */
  public VariableReference<D, R, F>
         setBounds(double lower, boolean lowerInclusive, double upper, boolean upperInclusive)
  {
    this.bounds = new Bounds(lower,
                             lowerInclusive,
                             upper,
                             upperInclusive);
    return this;
  }

  /**
   * @return true if compile-time bounds have been set on this reference
   */
  public boolean isBounded()
  {
    return bounds != null;
  }

  public String typeset()
  {
    if (index != null)
    {
      return String.format("%s_{%s}", name, index.typeset());
    }
    else
    {
      return name;
    }
  }

  public Class<?> type()
  {

    return type;
  }

  public boolean isElse()
  {
    return "else".equals(name) && index == null;
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         VariableReference<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    var ref = new VariableReference<E, S, G>(name,
                                             index == null ? null : index.spliceInto(newExpression),
                                             type);
    ref.bounds = this.bounds;
    return ref;
  }

  public void set(VariableReference<D, R, F> ref)
  {
    this.index  = ref.index;
    this.name   = ref.name;
    this.type   = ref.type;
    this.bounds = ref.bounds;
  }

  public boolean isLiteralConstant()
  {
    return LiteralConstantNode.constantSymbols.contains(name);
  }

}
