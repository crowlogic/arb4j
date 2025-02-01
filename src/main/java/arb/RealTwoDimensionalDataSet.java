package arb;

import java.io.Closeable;
import java.util.stream.IntStream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import io.fair_acc.dataset.DataSet;
import io.fair_acc.dataset.DataSet2D;
import io.fair_acc.dataset.spi.AbstractDataSet;

/**
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealTwoDimensionalDataSet extends
                                       AbstractDataSet<RealTwoDimensionalDataSet> implements
                                       DataSet2D,
                                       AutoCloseable,
                                       Closeable
{
  @Override
  public String toString()
  {
    return String.format("RealTwoDimensionalDataSet[%s]", getName());
  }

  private static final long serialVersionUID = 1L;

  FloatInterval             domain;

  Float                     resolution       = new Float();

  public Float getResolution(Float result)
  {
    return result.set(resolution);
  }

  public RealTwoDimensionalDataSet(String name, int length, FloatInterval domain)
  {
    super(name,
          2);
    data        = RealMatrix.newMatrix(2, length);
    this.domain = domain;
    domain.length(128, resolution).div(length, 128);
  }

  public final RealMatrix data;

  public Real getRealXValues()
  {
    return data.getRow(0);
  }

  public Real getRealYValues()
  {
    return data.getRow(1);
  }

  @Override
  public double get(int dimIndex, int index)
  {
    assert dimIndex <= 1 && dimIndex >= 0 : "dimIndex=" + dimIndex + " must be 0 or 1";
    assert index < data.getNumCols();
    Real got = data.get(dimIndex, index);
    return got.getMid().doubleValue();
  }

  @Override
  public int getDataCount()
  {
    return data.getNumCols();
  }

  @Override
  public DataSet set(DataSet other, boolean copy)
  {
    assert false : "no can do, just modify the memory the Reals point to since they are mutable";
    return null;
  }

  @Override
  public void close()
  {
    if (data == null)
    {
      return;
    }
    data.close();
    resolution.close();
  }

  @SuppressWarnings("resource")
  public RealTwoDimensionalDataSet structure(int n)
  {
    var                       x    = getRealXValues();
    var                       y    = getRealYValues();
    RealTwoDimensionalDataSet rds  = new RealTwoDimensionalDataSet(String.format("varianceStructure(%s,n=%s)", toString(),n),
                                                                   n,
                                                                   domain);
    var                       outy = rds.getRealYValues();
    rds.resolution = resolution;
    try ( var length = domain.length(128, new Float()); var scale = new Real(); Real blip = new Real())
    {
      scale.set(length).div(n);
      scale.set(resolution);
      Real xval = rds.getRealXValues();
      for (int i = 0; i < xval.size(); i++)
      {
        xval.get(i).set(scale.mul(i, 128, blip));
      }

    }
    IntStream.range(0, n).parallel().forEach(i -> y.gammaVariance(i, 128, outy.get(i)));
    return rds;
  }
}