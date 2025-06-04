package arb.expressions.nodes;

import static arb.expressions.Compiler.cast;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.unary.FunctionEvaluationNode;
import arb.functions.Function;

/**
 * Specialized node for integrating polynomial function applications. This
 * prevents infinite recursion in the integration process.
 */
public class PolynomialIntegralNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                   Node<D, C, F>
{
  @Override
  public String toString()
  {
    return String.format("PolynomialIntegralNode[polynomialNode=%s, argumentNode=%s]", polynomialNode, argumentNode);
  }

  Node<D, C, F> polynomialNode;

  Node<D, C, F> argumentNode;

  public PolynomialIntegralNode(Expression<D, C, F> expression,
                                Node<D, C, F> polynomialNode,
                                Node<D, C, F> argumentNode)
  {
    super(expression);
    this.polynomialNode = polynomialNode;
    this.argumentNode   = argumentNode;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    // Generate code to get the polynomial
    var polynomialType = polynomialNode.type();
    polynomialNode.generate(mv, polynomialType);

    // Call integrate() on the polynomial
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(polynomialType),
                       "integral",
                       Compiler.getMethodDescriptor(polynomialType),
                       false);

    // Now evaluate the integrated polynomial at the argument
    var argType = argumentNode.type();
    argumentNode.generate(mv, argType);

    Compiler.loadOrderParameter(mv);
    Compiler.loadBitsParameterOntoStack(mv);
    Compiler.loadResultParameter(mv);
    
    // Call evaluate on the integrated polynomial
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(polynomialType),
                       "evaluate",
                       Expression.evaluationMethodDescriptor,
                       false);

    if (!resultType.equals(Object.class))
    {
      cast(mv, resultType);
    }

    return mv;
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(polynomialNode, argumentNode);
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isConstant()
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
    return '∫';
  }

  @Override
  public Class<?> type()
  {
    return expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    return "\\int " + polynomialNode.typeset() + "(" + argumentNode.typeset() + ") d" + argumentNode.typeset();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new PolynomialIntegralNode<>(newExpression,
                                        polynomialNode.spliceInto(newExpression),
                                        argumentNode.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String var,
                                                                                       Node<E, S, G> replacement)
  {
    return new PolynomialIntegralNode<>(expression,
                                        polynomialNode.substitute(var, replacement),
                                        argumentNode.substitute(var, replacement));
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> var)
  {
    throw new UnsupportedOperationException("Double integration not implemented");
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> var)
  {
    // The derivative of the integral is the original function
    if (var.equals(argumentNode))
    {
      return new FunctionEvaluationNode<D, C, F>(expression,
                                                 polynomialNode,
                                                 argumentNode);
    }
    throw new UnsupportedOperationException("Differentiation not implemented for this case");
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> visitor)
  {
    polynomialNode.accept(visitor);
    argumentNode.accept(visitor);
    visitor.accept(this);
  }
}
