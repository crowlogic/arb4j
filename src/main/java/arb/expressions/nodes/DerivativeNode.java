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
import arb.exceptions.CompilerException;
import arb.exceptions.UnderConstructionException;
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
  @Override
  public boolean isZero()
  {
    return operand.isConstant() || operand.isIndependentOf(expression.getIndependentVariable());
  }

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
    if (differentiatedNode != null)
    {
      return differentiatedNode.simplify();
    }
    return this;
  }

  @Override
  public String toString()
  {
    if (differentiatedNode != null)
    {

      return differentiatedNode.toString();
    }
    else
    {
      assert variable != null : "variable is null";
      if (order != null)
      {
        return String.format("diff(%s,%s^(%s))", operand, variable, order);
      }
      else
      {
        return String.format("diff(%s,%s)", operand, variable);
      }
    }
  }

  public Node<D, R, F>               operand;

  public final VariableNode<D, R, F> variable;

  private Node<D, R, F>              differentiatedNode;

  private Node<D, R, F>              order;

  private Context                    context;

  public DerivativeNode(Expression<D, R, F> expression)
  {
    this(expression,
         false);
  }

  public DerivativeNode(Expression<D, R, F> expression, Node<D, R, F> operand)
  {
    super(expression);
    assert operand != null : "variable is null";
    this.operand = operand;
    this.context = expression.context;
    variable     = expression.getIndependentVariable();

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

    var baseVariableNode = expression.resolve();
    if (baseVariableNode.isVariable())
    {
      variable = baseVariableNode.asVariable();

    }
    else if (baseVariableNode instanceof ExponentiationNode<D, R, F> expNode)
    {
      if (!expNode.left.isVariable())
      {
        throwSyntaxError("the base of " + this + " must be a variable");
      }
      variable = expNode.left.asVariable();
      order    = expNode.right;
      if (order.type() != arb.Integer.class)
      {
        throwSyntaxError("the order of differentiation node must generate an Integer but got order="
                         + order
                         + " of type "
                         + order.type());
      }

    }
    else
    {
      throwSyntaxError("the variable must be specified like variable^power");
      variable = null;
    }
    if (functionForm)
    {
      expression.require(')');
    }
    if (order == null)
    {
      differentiatedNode = operand.differentiate(variable).simplify();
    }
    else
    {
      if (order.isConstant())
      {
        Integer orderValue = order.evaluate(Integer.class);
        int     n          = orderValue.getSignedValue();
        if (n < 0)
        {
          throw new IllegalArgumentException("derivative order must be non-negative, got: " + n);
        }

        differentiatedNode = operand;
        for (int i = 0; i < n; i++)
        {
          differentiatedNode = differentiatedNode.differentiate(variable).simplify();
        }
      }
      else
      {
        throw new UnderConstructionException("derivative with non-constant order "
                                             + order
                                             + " of type "
                                             + order.getClass().getSimpleName()
                                             + " is not yet supported for "
                                             + this
                                             + " in "
                                             + expression);
      }
    }
  }

  protected void throwSyntaxError(String string)
  {
    throw new CompilerException("the format for the nth derivative is diff(f(t),t^n) where n is an integer that is the order of differentiation and t is the variable being differentiated with respect to but instead of t^n this is "
                                + this
                                + ":"
                                + string);

  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    differentiatedNode.accept(t);
  }

  @Override
  public boolean isScalar()
  {
    return differentiatedNode.isScalar();
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return differentiatedNode.integral(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return differentiatedNode.differentiate(variable);
  }

  @Override
  public List<? extends Node<D, R, F>> getBranches()
  {
    return differentiatedNode.getBranches();
  }

  @Override
  public boolean isLeaf()
  {
    return differentiatedNode == null || differentiatedNode.isLeaf();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert !resultType.equals(Object.class) : "Objects shan't be generated";
    differentiatedNode.isResult = isResult;
    return differentiatedNode.generate(mv, resultType);
  }

  @Override
  public String typeset()
  {
    return differentiatedNode.typeset();
  }

  @Override
  public <C> Class<? extends C> type()
  {
    return differentiatedNode.type();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    differentiatedNode = differentiatedNode.substitute(variable, arg);
    return this;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert false : "nthDerivativeNode is null for " + this + " context=" + expression.context + "functions=" + expression.context.functions;
    return differentiatedNode.spliceInto(newExpression);
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
