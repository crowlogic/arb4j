package arb;

import java.util.Iterator;

public class EvaluationSequenceIterator extends
                                        OrderedPair<Real, Real> implements
                                        Iterator<OrderedPair<Real, Real>>

{
  int                        i;
  private EvaluationSequence evalseq;
  private int                dim;

  public EvaluationSequenceIterator(EvaluationSequence evalseq, int dim)
  {
    super(new Real(),
          Real.newVector(dim));
    this.evalseq     = evalseq;
    a.printPrecision = b.printPrecision = true;
    this.dim         = dim;
  }

  @Override
  public OrderedPair<Real, Real> next()
  {
    a.set(evalseq.partition.get(i));
    for (int j = 0; j < dim; j++)
    {
      b.get(j).set(evalseq.values[j].get(i));
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
