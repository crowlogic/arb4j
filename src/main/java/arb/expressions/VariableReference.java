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

  @Override
  public String toString()
  {
    return index != null ? String.format("%s[%s]", name, index) : name;

  }

  public Class<?> type;

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
    // assert !type.equals(Object.class) : "type shan't be Object for variable named
    // " + name;
  }

  public String        name;

  public Node<D, R, F> index;

  public int           position;

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
    return new VariableReference<E, S, G>(name,
                                          index == null ? null : index.spliceInto(newExpression),
                                          type);
  }

  public void set(VariableReference<D, R, F> ref)
  {
    this.index = ref.index;
    this.name  = ref.name;
    this.type  = ref.type;
  }

  public boolean isLiteralConstant()
  {
    return LiteralConstantNode.constantSymbols.contains(name);
  }

}