package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.*;

import arb.RealPolynomial;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.functions.Function;

/**
 * Represents application of arguments to an expression that evaluates to a
 * {@link Function}. Used for cases like P(3)(0.75) where P(3) returns a type
 * that implements the {@link Function} interface such as {@link RealPolynomial}
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class FunctionalEvaluationNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                     UnaryOperationNode<D, C, F>
{

  @Override
  public String toString()
  {
    return String.format("%s(%s)", functionNode, arg);
  }

  private Node<D, C, F> functionNode;

  public FunctionalEvaluationNode(Expression<D, C, F> expression, Node<D, C, F> functionNode)
  {
    super(expression,
          expression.resolve());
    expression.require(')');
    this.functionNode = functionNode;
  }

  public FunctionalEvaluationNode(Expression<D, C, F> expression,
                                  Node<D, C, F> functionNode,
                                  Node<D, C, F> argNode)
  {
    super(expression,
          argNode);
    this.functionNode = functionNode;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    Class<?> functionType = functionNode.type();

    if (Expression.trace)
    {
      logger.debug("generate(resultType={}) functionNode={} arg={} functionType={}",
                   resultType,
                   functionNode,
                   arg,
                   functionType);
    }
    functionNode.generate(mv, functionType);
    arg.generate(mv, resultType);

    loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);

    loadOutputVariableOntoStack(mv, resultType);

    mv.visitMethodInsn(functionType.isInterface() ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(functionType),
                       "evaluate",
                       Expression.evaluationMethodDescriptor,
                       functionType.isInterface());

    if (!resultType.equals(Object.class))
    {
      cast(mv, resultType);
    }

    return mv;
  }

  @Override
  public Class<?> type()
  {
    return expression.coDomainType;
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(functionNode, arg);
  }

  @Override
  public String typeset()
  {
    return functionNode.typeset() + "\\left(" + arg.typeset() + "\\right)";
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new FunctionalEvaluationNode<E, S, G>(newExpression,
                                                 functionNode.spliceInto(newExpression),
                                                 arg.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> transformation)
  {
    functionNode = functionNode.substitute(variable, transformation);
    arg          = arg.substitute(variable, transformation);
    return this;
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    throw new UnsupportedOperationException("Differentiation not implemented for AnonymousFunctionNode");
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    // If we have a polynomial function application being integrated
    // with respect to its argument
    if (functionNode.type().equals(arb.RealPolynomial.class) && arg.equals(variable))
    {
      // Create a concrete PolynomialIntegralNode to handle the integration
      PolynomialIntegralNode<D,
                    C,
                    F> polynomialIntegralNode = new PolynomialIntegralNode<>(expression,
                                                                             functionNode,
                                                                             arg);
      polynomialIntegralNode.isResult = isResult;
      return polynomialIntegralNode;
    }

    // For other cases, use regular IntegralNode
    IntegralNode<D, C, F> integralNode = new IntegralNode<>(expression,
                                                            this,
                                                            variable);
    integralNode.isResult = isResult;
    return integralNode;
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return !expression.coDomainType.isArray();
  }

  @Override
  public char symbol()
  {
    return '@'; // Using @ to represent function application
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    functionNode.accept(t);
    arg.accept(t);
  }
}
