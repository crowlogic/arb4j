package arb.operators;

import java.util.stream.Stream;

import arb.Field;
import arb.OrthogonalBasis;
import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;
import arb.documentation.references.Reference;
import arb.space.topological.HilbertSpace;
import arb.space.topological.Space;

/**
 * A density operator is a positive trace-class ({@link HilbertSpace}) operator
 * of trace 1. See: {@link Bibliography#stochasticQuantumMechanicalMethods}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface DensityOperator<F extends Field<? extends F>, VE extends Space<?>, O extends OrthogonalBasis<? extends F, ?>, H extends HilbertSpace<? extends F, O>>
                                extends
                                TraceClassOperator<F, VE, O, H>,
                                PositiveOperator<H, H>,
                                Concept

{

  @Override
  default Stream<? extends Reference> getReferences()
  {
    return Stream.of(Bibliography.stochasticQuantumMechanicalMethods.referToChapters("4.3 p.85"));
  }

}
