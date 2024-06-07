package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.dataset.DataSet;
import io.fair_acc.dataset.spi.AbstractDataSet;

/**
 * Used by {@link EvaluationSequence} for plotting things with {@link XYChart}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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