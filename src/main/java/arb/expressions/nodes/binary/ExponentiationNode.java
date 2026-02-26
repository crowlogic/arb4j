package arb.expressions.nodes.binary;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * Represents the binary exponentiation operation: left^right<br>
 * 
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ExponentiationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
  @Override
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    if (result == null)
    {
      result = Utensils.newInstance(resultType);
    }
    T l = left.evaluate(resultType, bits, Utensils.newInstance(resultType));
    T r = right.evaluate(resultType, bits, Utensils.newInstance(resultType));
    return l.pow(r, bits, Utensils.newInstance(resultType));
  }

  /**
   * Đ^(α)(t^k) = Γ(k+1)/Γ(k+1-α)*t^(k-α)
   */
  @Override
  public Node<D, R, F> fractionalDerivative(VariableNode<D, R, F> variable, Node<D, R, F> α)
  {
    if (left instanceof VariableNode<D, R, F> varNode && !right.dependsOn(varNode))
    {
      var t               = left;
      var k               = right;
      var numer           = k.add(one()).Γ();
      var denom           = k.add(one()).sub(α).Γ();
      var Γratio          = numer.div(denom);
      var fractionalPower = t.pow(right.sub(α));
      return Γratio.mul(fractionalPower);
    }
    else
    {
      return super.fractionalDerivative(variable, α);
    }
  }

  @Override
  public boolean isZero()
  {
    // base^exponent is zero when base is zero and exponent is not zero
    // 0^0 is undefined/indeterminate, not zero
    // 0^n = 0 for n ≠ 0
    // a^n ≠ 0 for a ≠ 0 (any non-zero base to any power is non-zero)
    return left.isZero() && !right.isZero();
  }

  public static final Logger logger = LoggerFactory.getLogger(ExponentiationNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  /**
   * Returns true when this exponentiation node has a closed-form antiderivative
   * via the power rule: ∫x^p dx = x^(p+1)/(p+1). This holds whenever the exponent
   * is independent of the integration variable, which is enforced by
   * {@link #integral(VariableNode)}.
   */
  @Override
  public boolean isEasilyIntegrable()
  {
    return true;
  }

  @Override
  public boolean isPolynomialLike(VariableNode<D, R, F> variable)
  {
    if (left.equals(variable) && right.isNonNegativeIntegerConstant())
    {
      return true;
    }
    // Also handle (polynomial)^n
    if (left.isPolynomialLike(variable) && right.isNonNegativeIntegerConstant())
    {
      return true;
    }
    return false;
  }

  public ExponentiationNode(Expression<D, R, F> expression,
                            Node<D, R, F> base,
                            Node<D, R, F> exponent)
  {
    super(expression,
          base,
          "pow",
          exponent,
          "^");
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    if (!right.dependsOn(variable))
    {
      // Power rule: d/dx[f(x)^n] = n * f(x)^(n-1) * f'(x)
      var newExponent = right.sub(one());
      return right.mul(left.pow(newExponent)).mul(left.differentiate(variable));
    }

    if (!left.dependsOn(variable))
    {
      // Exponential rule: d/dx[a^g(x)] = a^g(x) * g'(x) * ln(a)
      return mul(right.differentiate(variable).mul(left.log()));
    }

    // General case: d/dx[f(x)^g(x)] = f^g * (g*f'/f + g'*ln(f))
    var term1 = right.mul(left.differentiate(variable)).div(left);
    var term2 = right.differentiate(variable).mul(left.log());
    return mul(term1.add(term2));
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    return true;
  }

  public String format(Node<D, R, F> side)
  {
    return side.isLeaf() ? "%s" : "(%s)";
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert !"0".equals(left.toString()) : this + " should have been simplified to 0 or 1";

    return super.generate(mv, resultType);
  }

  @Override
  public Node<D, R, F> getSquareRootArg()
  {
    assert isSquareRoot() : this + " is not a square root";
    return left;
  }

  @Override
  public int hashCode()
  {
    return super.hashCode();
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    if (right.dependsOn(variable))
    {
      throw new UnsupportedOperationException("TODO: support the special cases where the exponent in "
                                              + this
                                              + " depends on "
                                              + variable);
    }

    Node<D, R, F> exponent = right.add(one());
    return left.pow(exponent).div(exponent);
  }

  @Override
  public boolean isCommutative()
  {
    return false;
  }

  @Override
  public boolean isSquareRoot()
  {
    return right.isHalf();
  }

  @Override
  public boolean isVariableSquared(VariableNode<D, R, F> variable)
  {
    return left.equals(variable) && right.isLiteralConstant() && "2".equals(right.toString());
  }

  @Override
  public Node<D, R, F> simplify()
  {
    if (left.isOne())
    {
      return one();
    }
    if (right.isOne())
    {
      return left.simplify();

    }
    if (right.isZero())
    {
      return one();
    }
    if (left.isZero())
    {
      return right.isZero() ? one() : zero();
    }
    if (left.isLiteralConstant() && right.isLiteralConstant())
    {
      var lconst = left.asLiteralConstant();
      var rconst = right.asLiteralConstant();
      if (lconst.isInt && rconst.isInt)
      {
        try ( var lint = new Integer(lconst.stringValue); var rint = new Integer(rconst.stringValue);)
        {
          var power = lint.pow(rint, 0, rint);
          return expression.newLiteralConstant(power.toString());
        }
      }
    }
    return super.simplify();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return left.spliceInto(newExpression).pow(right.spliceInto(newExpression));
  }

  @Override
  public Class<?> type()
  {
    if (type != null)
    {
      return type;
    }

    // If the expression is Complex-valued, exponentiation must stay Complex
    // internally
    // (do not fall back to AlgebraicNumber/Fraction/etc).
    if (expression != null && Complex.class.equals(expression.coDomainType))
    {
      return type = Complex.class;
    }

    // Check if base is integer and exponent is a (fraction or integer to handle
    // possibility of negative values)
    if ((Integer.class.equals(left.type())
                  && (Fraction.class.equals(right.type()) || Integer.class.equals(right.type())))
                  || (left.type().equals(Fraction.class) && right.type().equals(Fraction.class)))
    {
      return type = AlgebraicNumber.class;
    }

    var     superType                    = super.type();
    boolean rhsIsPossiblyNegativeInteger = right.isPossiblyNegative()
                  && Integer.class.equals(superType);
    return type = rhsIsPossiblyNegativeInteger ? Fraction.class : superType;
  }

  @Override
  public String typeset()
  {
    return String.format(String.format("{%s}^{%s}", format(left), format(right)),
                         left.typeset(),
                         right.typeset());
  }
}
