package arb.stochastic.processes;

import de.gsi.chart.XYChart;
import de.gsi.dataset.DataSet;
import de.gsi.dataset.spi.AbstractDataSet;

/**
 * Used by {@link EvaluationSequence} for plotting things with {@link XYChart}
 */
public class EvaluationSequenceDataSet extends
                                       AbstractDataSet<EvaluationSequenceDataSet>
{
  private static final long        serialVersionUID = 1L;
  
  private final EvaluationSequence evaluationSequence;
  
  private final int                datasetDim;

  EvaluationSequenceDataSet(EvaluationSequence evaluationSequence, String name, int datasetDim)
  {
    super(name,
          2);
    this.evaluationSequence = evaluationSequence;
    this.datasetDim         = datasetDim;
  }

  @Override
  public double get(int dimension, int index)
  {
    if (dimension == 0)
    {
      return this.evaluationSequence.partition.get(index).getMid().doubleValue();
    }
    else
    {
      return this.evaluationSequence.dimensions[datasetDim].get(index).getMid().doubleValue();
    }
  }

  @Override
  public int getDataCount()
  {
    return this.evaluationSequence.length;
  }

  @Override
  public DataSet set(DataSet other, boolean copy)
  {
    assert false : "read-only";
    return null;
  }
}