package arb;

import java.io.Closeable;

import de.gsi.dataset.DataSet;
import de.gsi.dataset.DataSet2D;
import de.gsi.dataset.spi.AbstractDataSet;

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
}