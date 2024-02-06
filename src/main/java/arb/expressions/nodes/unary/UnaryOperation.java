package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.expressions.Compiler.prepareStackForReusingLeftSide;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class UnaryOperation<D, R, F extends Function<D, R>> extends
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

  protected Node<D, R, F> arg;

  public UnaryOperation(Node<D, R, F> node, Expression<D, R, F> expression)
  {
    super(expression);
    this.arg = node;
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
  public MethodVisitor generate(ClassVisitor classVisitor, MethodVisitor mv, Class<?> resultType)
  {
    return arg.generate(classVisitor, mv, resultType);
  }

  protected void loadOutputVariableOntoStack(MethodVisitor methodVisitor,
                                             Expression<D, R, F> expression,
                                             Class<?> resultType)
  {
    if (isResult)
    {
      checkClassCast(loadResultParameter(methodVisitor), resultType);
    }
    else
    {
      if (arg != null && arg.isReusable())
      {
        arg.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.reserveIntermediateVariable(methodVisitor, resultType);
      }
    }
  }
}