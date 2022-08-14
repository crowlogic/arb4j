package arb;

import java.util.Iterator;

public class EvaluationSequenceIterator extends
                                        RealOrderedPair implements
                                        Iterator<RealOrderedPair>

{
  int                        i;
  private EvaluationSequence evalseq;
  private int dim;

  public EvaluationSequenceIterator(EvaluationSequence evalseq, int dim)
  {
    this.evalseq     = evalseq;
    a.printPrecision = b.printPrecision = true;
    this.dim         = dim;
  }

  @Override
  public RealOrderedPair next()
  {
    a.set(evalseq.partition.get(i));
    b.set(evalseq.values[dim].get(i));
    i++;
    return this;
  }

  @Override
  public boolean hasNext()
  {
    return i < evalseq.partition.count();
  }

}
