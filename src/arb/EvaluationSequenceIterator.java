package arb;

import java.util.Iterator;

public class EvaluationSequenceIterator extends
                                        RealOrderedPair implements
                                        Iterator<RealOrderedPair>

{
  int                        i;
  private EvaluationSequence evalseq;

  public EvaluationSequenceIterator(EvaluationSequence evalseq)
  {
    this.evalseq = evalseq;
    a.printPrecision = b.printPrecision = true;
  }

  @Override
  public RealOrderedPair next()
  {
    a.set(evalseq.partition.T.get(i));
    b.set(evalseq.values.get(i));
    i++;
    return this;
  }

  @Override
  public boolean hasNext()
  {
    return i < evalseq.partition.T.dim;
  }

}
