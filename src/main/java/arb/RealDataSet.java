package arb;

import java.io.Closeable;
import java.util.stream.IntStream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import io.fair_acc.dataset.DataSet;
import io.fair_acc.dataset.DataSet2D;
import io.fair_acc.dataset.DataSetError;
import io.fair_acc.dataset.spi.AbstractDataSet;

/**
 * Plain-old data-set with arb-precision storage.
 *
 * <p>Two error modes:
 * <ul>
 *   <li><b>Symmetric (default).</b> y row is a {@link Real} vector. Each
 *       cell's value is the midpoint; the cell's radius is the
 *       (single) error magnitude reported on both sides through
 *       {@link DataSetError}.</li>
 *   <li><b>Asymmetric.</b> y row is a {@link Complex} vector. Each cell:
 *       {@code re().getMid()} = value, {@code re().getRad()} = +error,
 *       {@code im().getRad()} = −error. {@code im().getMid()} is unused.</li>
 * </ul>
 *
 * <p>The error mode is fixed at construction. {@link #getErrorType(int)}
 * reports {@link ErrorType#SYMMETRIC} or {@link ErrorType#ASYMMETRIC}
 * accordingly so the default {@code ErrorDataSetRenderer} picks the
 * right glyph.
 *
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealDataSet extends
                         AbstractDataSet<RealDataSet> implements
                         DataSet2D,
                         DataSetError,
                         AutoCloseable,
                         Closeable
{
  @Override
  public String toString()
  {
    return String.format("RealDataSet[%s]", getName());
  }

  private static final long serialVersionUID = 1L;

  FloatInterval             domain;

  Float                     resolution       = new Float();

  public Float getResolution(Float result)
  {
    return result.set(resolution);
  }

  /** x row, length N. */
  Real                      x;

  /**
   * y row, length N. Either a {@link Real} (symmetric) or a {@link Complex}
   * (asymmetric); see {@link #asymmetric}. Held as {@link Object} and
   * narrowed at the access points.
   */
  Object                    y;

  /** Error mode chosen at construction. */
  final boolean             asymmetric;

  /** Symmetric constructor. */
  public RealDataSet(String name, int length, FloatInterval domain)
  {
    this(name, length, domain, false);
  }

  /** Explicit-mode constructor. */
  public RealDataSet(String name, int length, FloatInterval domain, boolean asymmetric)
  {
    super(name,
          2);
    this.asymmetric = asymmetric;
    this.x          = Real.newVector(length);
    this.y          = asymmetric ? Complex.newVector(length) : Real.newVector(length);
    this.domain     = domain;
    domain.length(128, resolution).div(length, 128);
  }

  public boolean isAsymmetric()
  {
    return asymmetric;
  }

  /** x row. */
  public Real getRealXValues()
  {
    return x;
  }

  /**
   * Real-valued y row. In symmetric mode this is the y storage itself; in
   * asymmetric mode it is the {@link Real} view aliased onto the real
   * parts of the complex y row. Either way the view holds the cell values
   * in its midpoints.
   */
  public Real getRealYValues()
  {
    return asymmetric ? ((Complex) y).re() : (Real) y;
  }

  /**
   * The complex y row in asymmetric mode. Throws in symmetric mode — the
   * symmetric storage is a {@link Real} vector with no imaginary part.
   */
  public Complex getComplexYValues()
  {
    if (!asymmetric)
    {
      throw new IllegalStateException("getComplexYValues() requires asymmetric mode");
    }
    return (Complex) y;
  }

  /**
   * Strided {@link Magnitude} view over the +error of every cell. Symmetric:
   * {@code y.rad()}. Asymmetric: {@code y.re().rad()}.
   */
  public Magnitude getPositiveErrorValues()
  {
    return asymmetric ? ((Complex) y).re().rad() : ((Real) y).rad();
  }

  /**
   * Strided {@link Magnitude} view over the −error of every cell. Symmetric:
   * same view as {@link #getPositiveErrorValues()} (the cell radius). Asymmetric:
   * {@code y.im().rad()}.
   */
  public Magnitude getNegativeErrorValues()
  {
    return asymmetric ? ((Complex) y).im().rad() : ((Real) y).rad();
  }

  @Override
  public double get(int dimIndex, int index)
  {
    assert dimIndex <= 1 && dimIndex >= 0 : "dimIndex=" + dimIndex + " must be 0 or 1";
    if (dimIndex == DIM_X)
    {
      return x.get(index).getMid().doubleValue();
    }
    return getRealYValues().get(index).getMid().doubleValue();
  }

  @Override
  public int getDataCount()
  {
    return x.size();
  }

  @Override
  public ErrorType getErrorType(int dimIndex)
  {
    if (dimIndex != DIM_Y)
    {
      return ErrorType.NO_ERROR;
    }
    return asymmetric ? ErrorType.ASYMMETRIC : ErrorType.SYMMETRIC;
  }

  @Override
  public double getErrorPositive(int dimIndex, int index)
  {
    if (dimIndex != DIM_Y)
    {
      return 0.0;
    }
    Real cell = asymmetric ? ((Complex) y).get(index).re() : ((Real) y).get(index);
    return cell.getRad().doubleValue();
  }

  @Override
  public double getErrorNegative(int dimIndex, int index)
  {
    if (dimIndex != DIM_Y)
    {
      return 0.0;
    }
    Real cell = asymmetric ? ((Complex) y).get(index).im() : ((Real) y).get(index);
    return cell.getRad().doubleValue();
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
    if (x == null)
    {
      return;
    }
    x.close();
    if (y instanceof Real)    ((Real) y).close();
    if (y instanceof Complex) ((Complex) y).close();
    x = null;
    y = null;
    resolution.close();
  }

  @SuppressWarnings("resource")
  public RealDataSet structure(int n)
  {
    var         yvals = getRealYValues();
    RealDataSet rds   = new RealDataSet(String.format("varianceStructure(%s,n=%s)", toString(), n),
                                        n,
                                        domain);
    var         outy  = rds.getRealYValues();
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
    IntStream.range(0, n).parallel().forEach(i -> yvals.gammaVariance(i, 128, outy.get(i)));
    return rds;
  }

  public Real getTimes()
  {
    return x;
  }

  public Real getValues()
  {
    return getRealYValues();
  }

}
