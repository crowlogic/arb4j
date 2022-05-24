package arblib;

import org.lwjgl.system.MemoryUtil;
import org.lwjgl.system.MemoryUtil.MemoryAllocator;
import org.lwjgl.system.jemalloc.JEmallocAllocator;
import org.lwjgl.system.rpmalloc.RPmallocAllocator;

/**
 * TODO: proxy these calls on thru {@link JEmallocAllocator} or
 * {@link RPmallocAllocator} , and using
 * {@link MemoryUtil#memReport(org.lwjgl.system.MemoryUtil.MemoryAllocationReport, org.lwjgl.system.MemoryUtil.MemoryAllocationReport.Aggregate, boolean)}
 * 
 * 
 * @author crow
 *
 */
public class Heap implements
                  MemoryAllocator
{

  @Override
  public long getMalloc()
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public long getCalloc()
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public long getRealloc()
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public long getFree()
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public long getAlignedAlloc()
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public long getAlignedFree()
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public long malloc(long size)
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public long calloc(long num, long size)
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public long realloc(long ptr, long size)
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public void free(long ptr)
  {
    // TODO Auto-generated method stub

  }

  @Override
  public long aligned_alloc(long alignment, long size)
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public void aligned_free(long ptr)
  {
    // TODO Auto-generated method stub

  }

}
