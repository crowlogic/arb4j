package arb.expressions;

import arb.algebra.Ring;

/**
 * A multivariate function can be described as a function of a tuple. In
 * mathematics, a tuple can be thought of as an ordered list of elements. For a
 * multivariate function, the tuple would consist of the variables upon which
 * the function depends.
 * 
 * For example, a bivariate function ff that depends on two variables xx and yy
 * can be written as f(x,y). This function is essentially a function of the
 * tuple (x,y). In a more general sense, a multivariate function ff that depends
 * on nn variables x1,x2,…,xn​ can be viewed as a function of the n-tuple
 * f:R^n→R,f(x1,x2,…,xn)
 * 
 * 
 * In this notation, f maps tuples of real numbers (points in R^n) to real
 * numbers. The concept of a function of a tuple is particularly useful in
 * higher dimensions where functions depend on more than two or three variables,
 * and it helps to formalize the notion of functions that take multiple inputs
 * simultaneously.
 * 
 * TODO: https://github.com/crowlogic/arb4j/issues/284: expression compiler:
 * multivariate function support via Tuple class
 */
public class Tuple
{

  public final Ring<?>[] values;

  public Tuple(int dim)
  {
    this.values = new Ring<?>[dim];
  }

  public Tuple(Ring<?>... values)
  {
    this.values = values;
  }

  @SuppressWarnings("unchecked")
  public <O extends Ring<?>> O set(int index, O value)
  {
    return (O) (values[index] = value);
  }

  @SuppressWarnings("unchecked")
  public <O extends Ring<?>> O get(int index)
  {
    return (O) values[index];
  }

}
