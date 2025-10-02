package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.Quaternion;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MultiplicationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert !"0".equals(left.toString());
    assert !"0".equals(right.toString()) : this;
    return super.generate(mv, resultType);
  }

  public MultiplicationNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "mul",
          right,
          "*");
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    var a   = left.differentiate(variable).mul(right).simplify();
    var b   = right.differentiate(variable).mul(left).simplify();
    var sum = a.add(b).simplify();
    return sum;
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return left.integrate(variable).mul(right.integrate(variable)).simplify();
  }

  /**
   * @return true if {@link Expression#coDomainType} is not a {@link Quaternion}
   */
  @Override
  public boolean isCommutative()
  {
    return !expression.coDomainType.equals(Quaternion.class);
  }

  @Override
  public Node<D, R, F> simplify()
  {

    if (left.isZero() || right.isZero())
    {
      return zero();
    }
    if (left.isOne())
    {
      return right.simplify();
    }
    if (right.isOne())
    {
      return left.simplify();
    }

    if (left instanceof LiteralConstantNode<D, R, F> leftConstant
                  && right instanceof LiteralConstantNode<D, R, F> rightConstant)
    {

      if (leftConstant.isInt && rightConstant.isInt)
      {
        try ( var lint = new Integer(leftConstant.value);
              var rint = new Integer(rightConstant.value);)
        {
          var product = lint.mul(rint, 0, rint);
          return expression.newLiteralConstant(product.toString());
        }
      }
    }

    if (left instanceof ExponentiationNode<D, R, F> leftExp
                  && right instanceof ExponentiationNode<D, R, F> rightExp)
    {
      var leftBase  = leftExp.left;
      var rightBase = rightExp.left;
      if (leftBase.equals(rightBase))
      {
        var rightPower = rightExp.right;
        var leftPower  = leftExp.right;
        var power      = leftPower.add(rightPower).simplify();
        return leftBase.pow(power).simplify();
      }

    }

    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      var leftIsExponentialFunction  = leftFunction.functionName.equals("exp");
      var rightIsExponentialFunction = rightFunction.functionName.equals("exp");

      if (leftIsExponentialFunction && rightIsExponentialFunction)
      {
        var exponentSum = leftFunction.arg.add(rightFunction.arg).simplify();
        return exponentSum.exp().simplify();
      }

    }

    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      var leftIsSquareRootFunction = leftFunction.functionName.equals("sqrt");
      var functionsAreEqual        = leftFunction.equals(rightFunction);

      if (leftIsSquareRootFunction && functionsAreEqual)
      {
        return leftFunction.arg.simplify();
      }

    }

    return super.simplify();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert left != null : this + ".left is null";
    assert right != null : this + ".right is null";
    return left.spliceInto(newExpression).mul(right.spliceInto(newExpression));
  }

  @Override
  public String typeset()
  {
    return format("\\left(%s \\cdot %s\\right)", left.typeset(), right.typeset());
  }

}