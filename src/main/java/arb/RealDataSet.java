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
public class RealDataSet extends
                         AbstractDataSet<RealDataSet> implements
                         DataSet2D,
                         AutoCloseable,
                         Closeable
{
  private static final long serialVersionUID = 1L;

  public RealDataSet(String name, int length)
  {
    super(name,
          2);
    data = RealMatrix.newMatrix(2, length);
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
    assert dimIndex <= 1 && dimIndex >= 0 : "wtf, dimIndex=" + dimIndex + " index=" + index;
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
  }

  @SuppressWarnings("resource")
  public RealDataSet structure(int n)
  {
    var         x    = getRealXValues();
    var         y    = getRealYValues();
    RealDataSet rds  = new RealDataSet("structure[" + y.name + "]",
                                       n);
    var         outy = rds.getRealYValues();
    rds.getRealXValues().set(x.slice(0, n));
    IntStream.range(0, n).parallel().forEach(i -> y.gammaVariance(i, 128, outy.get(i)));
    return rds;
  }
}