package arb.expressions.nodes;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.expressions.Expression;
import arb.expressions.VariableReference;
import arb.functions.Function;

/**
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class LimitNode<D, C, F extends Function<? extends D, ? extends C>> extends
                      Node<D, C, F>
{
  public static final Logger logger = LoggerFactory.getLogger(LimitNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  private Node<D, C, F>              operand;
  private VariableReference<D, C, F> limitingVariableReference;
  private VariableNode<D, C, F>      limitingVariableNode;
  private Node<D, C, F>              point;

  private Node<D, C, F>              limitEvaluationNode;

  public LimitNode(Expression<D, C, F> expression)
  {
    super(expression);
    operand                   = Objects.requireNonNull(expression.resolve(), "operand");
    limitingVariableReference = Objects.requireNonNull(
                                                       expression.require(',')
                                                                 .parseVariableReference(),
                                                       "limitingVariableReference");
    limitingVariableNode      = new VariableNode<>(expression,
                                                   limitingVariableReference,
                                                   expression.position,
                                                   true);
    expression.require('=');
    point = Objects.requireNonNull(expression.resolve(), "point");
    expression.require(')');
  }

  private LimitNode(Expression<D, C, F> expression,
                    Node<D, C, F> operand,
                    VariableReference<D, C, F> limitingVariableReference,
                    VariableNode<D, C, F> limitingVariableNode,
                    Node<D, C, F> point)
  {
    super(expression);
    this.operand                   = Objects.requireNonNull(operand, "operand");
    this.limitingVariableReference = Objects.requireNonNull(limitingVariableReference,
                                                            "limitingVariableReference");
    this.limitingVariableNode      =
                              Objects.requireNonNull(limitingVariableNode, "limitingVariableNode");
    this.point                     = Objects.requireNonNull(point, "point");
  }

  private String limitingVariableName()
  {
    return Objects.requireNonNull(limitingVariableReference, "limitingVariableReference").name;
  }

  private Node<D, C, F> getLimitEvaluationNode()
  {
    if (limitEvaluationNode != null)
    {
      return limitEvaluationNode;
    }

    final String  varName     =
                          Objects.requireNonNull(limitingVariableName(), "limitingVariableName");

    Node<D, C, F> substituted = operand.spliceInto(expression)
                                       .substitute(varName, point.spliceInto(expression))
                                       .simplify();

    limitEvaluationNode = Objects.requireNonNull(substituted, "limitEvaluationNode");
    return limitEvaluationNode;
  }

  @Override
  public Node<D, C, F> simplify()
  {
    operand = Objects.requireNonNull(operand.simplify(), "operand.simplify()");
    point   = Objects.requireNonNull(point.simplify(), "point.simplify()");

    // If the operand does not depend on the bound variable, the limit is just the
    // operand.
    if (!operand.dependsOn(limitingVariableNode))
    {
      limitEvaluationNode = null;
      return operand;
    }

    // Compute and cache the evaluation node (substitute bound var -> point) and
    // return it.
    return getLimitEvaluationNode();
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    Objects.requireNonNull(t, "t");
    limitingVariableNode.accept(t);
    operand.accept(t);
    point.accept(t);
    t.accept(this);
  }

  @Override
  public boolean dependsOn(VariableNode<D, C, F> variable)
  {
    Objects.requireNonNull(variable, "variable");

    String bound = limitingVariableName();
    if (bound.equals(variable.getName()))
    {
      return false;
    }

    return operand.dependsOn(variable) || point.dependsOn(variable);
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    Objects.requireNonNull(variable, "variable");

    String bound = limitingVariableName();
    if (bound.equals(variable.getName()))
    {
      return zero();
    }

    return getLimitEvaluationNode().differentiate(variable);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    Objects.requireNonNull(mv, "mv");
    Objects.requireNonNull(resultType, "resultType");

    generatedType = resultType;

    Node<D, C, F> evaluationNode = getLimitEvaluationNode();
    evaluationNode.isRootNode = isRootNode;
    evaluationNode.generate(mv, resultType);

    if (!isRootNode)
    {
      fieldName = evaluationNode.fieldName;
    }

    generatedType = evaluationNode.generatedType;
    return mv;
  }

  @Override
  public List<? extends Node<D, C, F>> getBranches()
  {
    return List.of(operand, limitingVariableNode, point);
  }

  @Override
  public Node<D, C, F> integral(VariableNode<D, C, F> variable)
  {
    Objects.requireNonNull(variable, "variable");
    return getLimitEvaluationNode().integral(variable);
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return operand.isScalar();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    Objects.requireNonNull(newExpression, "newExpression");

    Node<E, S, G>              newOperand = operand.spliceInto(newExpression);
    Node<E, S, G>              newPoint   = point.spliceInto(newExpression);

    String                     newVarName = limitingVariableName();

    VariableReference<E, S, G> newRef     = new VariableReference<>(newVarName);
    VariableNode<E, S, G>      newVarNode = new VariableNode<>(newExpression,
                                                               newRef,
                                                               position,
                                                               true);

    return new LimitNode<>(newExpression,
                           newOperand,
                           newRef,
                           newVarNode,
                           newPoint);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    Objects.requireNonNull(variable, "variable");
    Objects.requireNonNull(arg, "arg");

    point = Objects.requireNonNull(point.substitute(variable, arg), "point.substitute(...)");

    String bound = limitingVariableName();
    if (!bound.equals(variable))
    {
      operand =
              Objects.requireNonNull(operand.substitute(variable, arg), "operand.substitute(...)");
    }

    limitEvaluationNode = null;
    return this;
  }

  @Override
  public char symbol()
  {
    return 'ℓ';
  }

  @SuppressWarnings("unchecked")
  @Override
  public <E> Class<? extends E> type()
  {
    return operand.type();
  }

  @Override
  public String typeset()
  {
    StringBuilder sb = new StringBuilder(64);
    sb.append("\\\\lim_{");
    sb.append(limitingVariableNode.typeset());
    sb.append(" \\\\to ");
    sb.append(point.typeset());
    sb.append("} ");
    sb.append(operand.typeset());
    return sb.toString();
  }

  @Override
  public String toString()
  {
    StringBuilder sb = new StringBuilder(64);
    sb.append("lim(");
    sb.append(operand);
    sb.append(", ");
    sb.append(limitingVariableName());
    sb.append("=");
    sb.append(point);
    sb.append(")");
    return sb.toString();
  }
}
