package arb.algebraic.expressions;

import arb.Set;

/**
 * A variable (from Latin variabilis, "changeable") is a symbol and placeholder
 * for (historically) a quantity that may change, or more generally any
 * mathematical {@link Object}. In particular, a {@link Variable} may represent
 * a number, a vector, a matrix, a function, the argument of a function, a
 * {@link Set}, or an element of a set.
 * 
 * Algebraic computations with variables as if they were explicit numbers solve
 * a range of problems in a single computation. For example, the quadratic
 * formula solves every quadratic equation by substituting the numeric values of
 * the coefficients of the given equation for the variables that represent them
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Variable_(mathematics)">Variable</a>
 */
public class Variable implements
                      Expression
{
  private float value;

  public Variable(float value)
  {
    this.set(value);
  }

  public void set(float value)
  {
    this.value = value;
  }

  public Float evaluate()
  {
    return this.value;
  }

  public String toString()
  {
    return "{" + this.value + "}";
  }
}