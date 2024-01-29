package arb.documentation.examples.quantum.mechanics;

import arb.Field;
import arb.documentation.Bibliography;
import arb.documentation.Example;
import arb.operators.SelfAdjointOperator;
import arb.space.topological.VectorSpace;

public class CoordinatePositionOperator<F extends Field<F>, VE, V extends VectorSpace<F, VE>> extends
                                       Example implements
                                       SelfAdjointOperator<F, VE, V>
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
  public VectorSpace<F, VE> apply(VectorSpace<F, VE> x, int bits, VectorSpace<F, VE> result)
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
    return result;
  }

}
