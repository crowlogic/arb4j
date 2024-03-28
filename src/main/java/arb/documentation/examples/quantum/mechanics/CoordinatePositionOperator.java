package arb.documentation.examples.quantum.mechanics;

import arb.Field;
import arb.documentation.Bibliography;
import arb.documentation.Example;
import arb.operators.SelfAdjointOperator;
import arb.space.topological.VectorSpace;

public class CoordinatePositionOperator<F extends Field<? extends F>, V extends VectorSpace<? extends F>> extends
                                       Example implements
                                       SelfAdjointOperator<F, V>
{

  public CoordinatePositionOperator()
  {
    super(Bibliography.functionalAnalysisYosida,
          "the coordinate operation in quantum mechanics",
          "2",
          "p.198");
  }

  @Override
  public F norm()
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
  public VectorSpace<? extends F>
         apply(VectorSpace<? extends F> x, int bits, VectorSpace<? extends F> result)
  {
    // TODO Auto-generated method stub
    return null;
  }

}
