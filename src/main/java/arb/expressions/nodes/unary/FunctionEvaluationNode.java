package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.loadOrderParameter;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Represents application of arguments to an expression that evaluates to a
 * Function. Used for cases like P(3)(0.75) where P(3) returns a callable
 * object.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FunctionEvaluationNode<D, C, F extends Function<? extends D, ? extends C>> extends
                               UnaryOperationNode<D, C, F>
{

  @Override
  public String toString()
  {
    return String.format("InlineFunctionNode[functionNode=%s, arg=%s]", functionNode, arg);
  }

  private Node<D, C, F> functionNode;

  public FunctionEvaluationNode(Expression<D, C, F> expression, Node<D, C, F> functionNode)
  {
    super(expression.resolve(),
          expression.require(')'));
    this.functionNode = functionNode;
  }

  public FunctionEvaluationNode(Expression<D, C, F> expression, Node<D, C, F> functionNode, Node<D, C, F> arg)
  {
    super(arg,
          expression);
    this.functionNode = functionNode;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> currentType)
  {
    Class<?> functionType = functionNode.type();
    functionNode.generate(mv, functionType);
    // Generate code to evaluate the argument
    arg.generate(mv, currentType);

    // Generate order and bits parameters
    loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);

    // Load result onto stack
    loadOutputVariableOntoStack(mv, currentType);

    // Use the standardized evaluation method descriptor
    mv.visitMethodInsn(functionType.isInterface() ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(functionType),
                       "evaluate",
                       Expression.evaluationMethodDescriptor,
                       functionType.isInterface());

    // Cast the result if needed
    if (!currentType.equals(Object.class))
    {
      cast(mv, currentType);
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
    return List.of(arg);
  }

  @Override
  public String typeset()
  {
    return "\\left(" + arg.typeset() + "\\right)";
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new FunctionEvaluationNode<>(newExpression,
                                    arg.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable,
                                                                                       Node<E, S, G> transformation)
  {
    arg = arg.substitute(variable, transformation);
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
    throw new UnsupportedOperationException("Integration not implemented for AnonymousFunctionNode");
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isLiteralConstant()
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
    arg.accept(t);
  }
}
