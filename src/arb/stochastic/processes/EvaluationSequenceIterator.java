package arb.stochastic.processes;

import java.util.Iterator;

import arb.Real;
import arb.RealOrderedPair;

public class EvaluationSequenceIterator extends
                                        RealOrderedPair implements
                                        Iterator<RealOrderedPair>

{
  int                      i;
  final EvaluationSequence evalseq;
  final int                dim;

  public EvaluationSequenceIterator(EvaluationSequence evalseq, int dim)
  {
    super(new Real(),
          Real.newVector(dim));
    this.evalseq     = evalseq;
    a.printPrecision = b.printPrecision = true;
    this.dim         = dim;
  }

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

  @Override
  public boolean hasNext()
  {
    return i < evalseq.partition.count();
  }

}
