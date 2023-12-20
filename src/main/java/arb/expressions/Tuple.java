package arb.expressions;

import arb.Real;
import arb.algebra.Ring;
import arb.functions.Function;

/**
 * A multivariate {@link Function} can be described as a function of a tuple. In
 * mathematics, a tuple can be thought of as an ordered list of elements. For a
 * multivariate function, the tuple would consist of the variables upon which
 * the function depends.
 * 
 * For example, a bivariate function f that depends on two variables x and y can
 * be written as f(x,y). This function is essentially a function of the tuple
 * (x,y). In a more general sense, a multivariate function f that depends on n
 * variables x[1],x[2],…,x[n]​ can be viewed as a function of the n-tuple
 * f:R^n→R,f(x[1],x[2],…,x[n])
 * 
 * In this notation, f maps tuples of {@link Real} numbers (points in R^n) to
 * {@link Real} numbers(points in R^1).
 * 
 * TODO: https://github.com/crowlogic/arb4j/issues/284: expression compiler:
 * multivariate function support via Tuple class
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class Tuple
{

  public final Ring<?>[]                  values;

  public final Class<? extends Ring<?>>[] types;

  @SafeVarargs
  public Tuple(Class<? extends Ring<?>>... types)
  {
    this.types  = types;
    this.values = new Ring<?>[types.length];
  }

  @SuppressWarnings("unchecked")
  public Tuple(Ring<?>... values)
  {
    this.values = values;
    this.types  = new Class[values.length];
    for (int i = 0; i < values.length; i++)
    {
      types[i] = (Class<? extends Ring<?>>) values[i].getClass();
    }
  }

  @SuppressWarnings("unchecked")
  public <O extends Ring<?>> O set(int index, O value)
  {
    if (value == null)
    {
      return (O) (values[index] = null);
    }
    else
    {
      assert value.getClass() == types[index] : String.format("incompatible value %s of type %s specified for index=%d whose type is %s",
                                                              value,
                                                              value.getClass(),
                                                              index,
                                                              values[index].getClass());
      O val = (O) (values[index] = value);
      return val;
    }
  }

  @SuppressWarnings("unchecked")
  public <O extends Ring<?>> O get(int index)
  {
    O o = (O) values[index];
    assert o == null || o.getClass() == types[index] : String.format("wrong type %s at index %s, it should be %s",
                                                                     o.getClass(),
                                                                     index,
                                                                     types[index]);
    return o;
  }

}
