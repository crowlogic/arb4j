package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.expressions.Compiler.prepareStackForReusingLeftSide;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class UnaryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                        Node<D, R, F>
{
  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    if (arg.isReusable())
    {
      return prepareStackForReusingLeftSide(mv);
    }
    else
    {
      throw new RuntimeException("The node is not reusable");
    }
  }

  public Node<D, R, F> arg;
  public String        intermediateVariableFieldName;

  public UnaryOperationNode(Node<D, R, F> arg)
  {
    super(arg.expression);
    this.arg = arg;
  }
  
  public UnaryOperationNode(Node<D, R, F> arg, Expression<D, R, F> expression)
  {
    super(expression);
    this.arg = arg;
  }

  @Override
  public String toString()
  {
    return String.format("[name=%s,arg=%s]", getClass().getSimpleName(), arg);
  }

  @Override
  public boolean isReusable()
  {
    return arg != null && (arg.isReusable() || arg.isResult);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    return arg.generate(mv, resultType);
  }

  public void loadOutputVariableOntoStack(MethodVisitor methodVisitor, Class<?> resultType)
  {
    if (isResult)
    {
      checkClassCast(loadResultParameter(methodVisitor), resultType);
      intermediateVariableFieldName = "result";
    }
    else
    {
      if (arg != null && arg.isReusable())
      {
        assert false : "Wtf";
        arg.prepareStackForReuse(methodVisitor);
        intermediateVariableFieldName = "arg";
      }
      else
      {
        intermediateVariableFieldName = expression.allocateIntermediateVariable(methodVisitor, resultType);
      }
    }

  }

  @Override
  public String getIntermediateValueFieldName()
  {
    return intermediateVariableFieldName;
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return arg.dependsOn(variable);
  }
}