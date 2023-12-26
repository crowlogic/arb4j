package arb;

import java.util.Arrays;
import java.util.stream.Collectors;

import arb.domains.Domain;
import arb.expressions.UndefinedReferenceException;
import arb.functions.MultivariateFunction;

/**
 * A {@link MultivariateFunction} can be described as a function of a
 * {@link Tuple}. A tuple is an ordered list of elements. For a multivariate
 * function, the tuple would consist of the independent variables upon which the
 * function operates.
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
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class Tuple implements AutoCloseable
{

  @Override
  public String toString()
  {
    return "(" + Arrays.asList(names).stream().collect(Collectors.joining(",")) + ")";
  }

  public final Object[]   values;

  public final Class<?>[] types;

  public final String[]   names;

  @SafeVarargs
  public Tuple(Class<?>... types)
  {
    this.types  = types;
    this.values = new Object[types.length];
    this.names  = new String[types.length];
  }

  /**
   * A tuple should be constructed by the expression compiler by passing
   * references to the ordered set of variables that should be used as the input
   * to a {@link MultivariateFunction} whose {@link Domain} is a {@link Tuple}.
   * 
   * {@link Tuple#types} takes the types from the values via
   * {@link Object#getClass()}
   * 
   * @param values
   */
  public Tuple(Object... values)
  {
    this.values = values;
    this.types  = new Class[values.length];
    this.names  = new String[types.length];
    for (int i = 0; i < values.length; i++)
    {
      types[i] = values[i].getClass();
    }
  }

  public String setName(int index, String name)
  {
    names[index] = name;
    return name;
  }

  public int getIndex(String name)
  {
    for (int i = 0; i < names.length; i++)
    {
      if (name.equals(names[i]))
      {
        return i;
      }
    }
    throw new UndefinedReferenceException(String.format("No variable named %s exists in tuple %s",
                                                        name,
                                                        toString()));
  }

  public String getName(int index)
  {
    return names[index];
  }

  @SuppressWarnings("unchecked")
  public <O> O set(int index, O value)
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
  public <O> O get(int index)
  {
    O o = (O) values[index];
    assert o == null || o.getClass() == types[index] : String.format("wrong type %s at index %s, it should be %s",
                                                                     o.getClass(),
                                                                     index,
                                                                     types[index]);
    return o;
  }

  @Override
  public void close() throws Exception
  {
    // TODO Auto-generated method stub
    
  }

}
