package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.*;

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
public class AnonymousFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                  UnaryOperationNode<D, C, F>
{

  private Node<D, C, F> functionNode; // Node that evaluates to a Function

  public AnonymousFunctionNode(Expression<D, C, F> expression, Node<D, C, F> functionNode, Node<D, C, F> argumentNode)
  {
    super(argumentNode,
          expression);
    this.functionNode = functionNode;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> currentType)
  {
    // Generate code to evaluate the function expression
   // functionNode.generate(mv, functionNode.type());

    // Generate code to evaluate the argument
    arg.generate(mv, arg.type());

    // Generate order and bits parameters
    loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);

    // Load result onto stack
    loadOutputVariableOntoStack(mv, currentType);

    // Determine if we're calling an interface or a class
    boolean isInterface = Function.class.isInterface() && Function.class.isAssignableFrom(functionNode.type());

    // Use the standardized evaluation method descriptor
    mv.visitMethodInsn(isInterface ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(functionNode.type()),
                       "evaluate",
                       Expression.evaluationMethodDescriptor,
                       isInterface);

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
    return List.of(functionNode, arg);
  }

  @Override
  public String toString()
  {
    return functionNode.toString() + "(" + arg.toString() + ")";
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
    return new AnonymousFunctionNode<>(newExpression,
                                       functionNode.spliceInto(newExpression),
                                       arg.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable,
                                                                                       Node<E, S, G> transformation)
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
