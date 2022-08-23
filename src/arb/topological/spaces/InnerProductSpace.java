package arb.topological.spaces;

import arb.Field;

public interface InnerProductSpace<X> extends
                                  VectorSpace<X>
{
  public <P extends Field> P innerProduct(X left, X right);

}
