package arb;

import java.lang.ref.Cleaner.Cleanable;

public class EvaluationSequence implements
                                Cleanable
{
  public EvaluationSequence(Partition partition, Real values)
  {
    this.partition = partition;
    this.values    = values;
  }

  public Partition partition;
  public Real      values;

  @Override
  public void clean()
  {
    values.close();
  }

}
