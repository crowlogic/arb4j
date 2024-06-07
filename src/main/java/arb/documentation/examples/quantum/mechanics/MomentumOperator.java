package arb.documentation.examples.quantum.mechanics;

import arb.Field;
import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Example;
import arb.documentation.TheArb4jLibrary;
import arb.operators.SelfAdjointOperator;
import arb.space.topological.VectorSpace;
/**
 * 
 * @param <F>
 * @param <V>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MomentumOperator<F extends Field<? extends F>, V extends VectorSpace<? extends F>>
                             extends
                             Example implements
                             SelfAdjointOperator<F, V>
{

  public MomentumOperator()
  {
    super(Bibliography.functionalAnalysisYosida,
          "the momentum operation in quantum mechanics",
          "3",
          "p.198");
  }

  @Override
  public F norm(F result)
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public SelfAdjointOperator<F, V> adjointOperator()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public V apply(V x, int bits, V result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
