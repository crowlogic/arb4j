package arb.expressions.nodes;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.binary.ExponentiationNode;
import arb.functions.Function;

/**
 *
 * ∂f(x)/∂x
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DerivativeNode<D, R, F extends Function<? extends D, ? extends R>> extends
                           Node<D, R, F>
{
  public static final Logger logger = LoggerFactory.getLogger(DerivativeNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(operand, variable);
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
    DerivativeNode<?, ?, ?> other = (DerivativeNode<?, ?, ?>) obj;
    return Objects.equals(operand, other.operand) && Objects.equals(variable, other.variable);
  }

  @Override
  public Node<D, R, F> simplify()
  {
    derivative.isResult = isResult;
    return derivative;
  }

  @Override
  public String toString()
  {
    return derivative.toString();
  }

  public Node<D, R, F>         operand;

  public VariableNode<D, R, F> variable;

  private Node<D, R, F>        derivative;

  private Node<D, R, F>        order;

  private Context              context;

  public DerivativeNode(Expression<D, R, F> expression)
  {
    this(expression,
         false);
  }

  public DerivativeNode(Expression<D, R, F> expression, boolean functionForm)
  {
    super(expression);
    operand      = expression.resolve();
    this.context = new Context(Integer.named("n"));

    if (functionForm)
    {
      expression.require(',');
    }
    else
    {
      expression.require("/∂");
    }

    parseVariableAndOrderOfDifferentation(expression.resolve(), functionForm);

    derivative = operand.differentiate(variable).simplify();
  }

  protected void parseVariableAndOrderOfDifferentation(Node<D, R, F> baseVariableNode,
                                                       boolean functionForm)
  {
    if (baseVariableNode.isVariable())
    {
      variable = baseVariableNode.asVariable();
      if (functionForm)
      {
        expression.require(')');
      }
    }
    else if (baseVariableNode instanceof ExponentiationNode<D, R, F> expNode)
    {
      assert expNode.left.isVariable() : "the format for the nth derivative is diff(f(t),t^n) where n is an integer that is the order of differentiation and t is the variable being differentiated with respect to but instead of t^n this is "
                                         + this;
      variable = expNode.left.asVariable();
      order    = expNode.right;
      assert order.type()
                    == arb.Integer.class : "the order of differentiation node must generate an Integer but got order="
                                           + order
                                           + " of type "
                                           + order.type();

    }
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    derivative.accept(t);
  }

  @Override
  public boolean isScalar()
  {
    return derivative.isScalar();
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return derivative.integrate(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return derivative.differentiate(variable);
  }

  @Override
  public List<? extends Node<D, R, F>> getBranches()
  {
    return derivative.getBranches();
  }

  @Override
  public boolean isLeaf()
  {
    return derivative.isLeaf();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert !resultType.equals(Object.class) : "Objects shan't be generated";
    derivative.isResult = isResult;
    return derivative.generate(mv, resultType);
  }

  @Override
  public String typeset()
  {
    return derivative.typeset();
  }

  @Override
  public <C> Class<? extends C> type()
  {
    return derivative.type();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    derivative = derivative.substitute(variable, arg);
    return this;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return derivative.spliceInto(newExpression);
  }

  @Override
  public char symbol()
  {
    return '∂';
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return false;
  }

}
