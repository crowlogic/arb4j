package arb;

import java.lang.foreign.MemorySegment;
import java.lang.foreign.SegmentScope;

public class Integer implements
                     AutoCloseable
{
  @Override
  public String toString()
  {
    return arblib.fmpz_get_str(null, 10, swigCPtr );
  }

  static
  {
    System.loadLibrary("arblib");
  }

  public int dim;

  public Integer()
  {
    this(1);
  }

  static SegmentScope scope = SegmentScope.auto();

  public Integer(int dim)
  {
    init(dim);
  }

  public long           swigCPtr;
  public boolean        swigCMemOwn = true;
  private MemorySegment nativeSegment;

  public Integer set( String value )
  {
    arblib.fmpz_set_str(swigCPtr, value, 10);
    return this;
  }
  
  public Integer init()
  {
    return init(1);
  }

  public Integer init(int n)
  {
    nativeSegment = MemorySegment.allocateNative(Long.BYTES * dim, scope);
    swigCPtr      = nativeSegment.address();
    arblib.fmpz_init2(swigCPtr, n);
    return this;
  }

  public Integer(long cPtr, boolean cMemoryOwn)
  {
    swigCMemOwn = cMemoryOwn;
    swigCPtr    = cPtr;
  }

  public static long getCPtr(Real obj)
  {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public void delete()
  {
    if (swigCPtr != 0 && swigCMemOwn)
    {
      arblib.fmpz_clear(swigCPtr);
      swigCPtr = 0;
    }
  }

  @Override
  public void close()
  {
    delete();
  }

}
