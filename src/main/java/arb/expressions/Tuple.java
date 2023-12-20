package arb.expressions;

import arb.algebra.Ring;

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
