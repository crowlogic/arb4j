package arb.stochastic.processes;

import java.util.Iterator;

import arb.Real;
import arb.RealOrderedPair;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * <pre>
 * {@link EvaluationSequenceIterator} is an iterator for traversing the
 * evaluation sequence of a stochastic process. The iterator returns
 * {@link RealOrderedPair} objects representing the time and the associated
 * state vector at that time. This iterator is specifically designed to 
 * work with {@link EvaluationSequence}s
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class EvaluationSequenceIterator extends
                                        RealOrderedPair implements
                                        Iterator<RealOrderedPair>

{
  int                      i;
  final EvaluationSequence evalseq;
  final int                dim;

  /**
   * 
   * Constructs an EvaluationSequenceIterator for a given EvaluationSequence and
   * dimension.
   * 
   * @param evalseq The EvaluationSequence object to iterate through.
   * @param dim     The dimension of the state vector in the evaluation sequence.
   */
  public EvaluationSequenceIterator(EvaluationSequence evalseq,
                                    int dim)
  {
    super(
          new Real(),
          Real.newVector(dim));
    this.evalseq     = evalseq;
    a.printPrecision = b.printPrecision = true;
    this.dim         = dim;
  }

  /**
   * Returns the next {@link RealOrderedPair} in the evaluation sequence,
   * representing the time and the associated state vector at that time.
   */
  @Override
  public RealOrderedPair next()
  {
    a.set(evalseq.partition.get(i));
    for (int j = 0; j < dim; j++)
    {
      Real dimension = evalseq.dimensions[j];
      Real val       = dimension.get(i);
      b.get(j).set(val);
    }
    i++;
    return this;
  }

  /**
   * 
   * Checks if there are more elements in the evaluation sequence to iterate
   * through.
   * 
   * @return true if there are more elements, false otherwise.
   */
  @Override
  public boolean hasNext()
  {
    return i < evalseq.partition.count();
  }

}
