package arb.viz;

import java.io.*;
import java.nio.*;
import java.nio.channels.FileChannel.*;
import java.nio.file.*;

import arb.*;
import arb.geometry.surfaces.*;
import jdk.incubator.foreign.*;

/**
 * If the precision of the number is 128 bits or less then the only space
 * required to allocate the pair of Real(arb_t) structures to constitute the
 * Complex(acb_t) structure is the structures themselves ( {@link Complex#BYTES}
 * ) without any internal-to-arb allocations necessary and thus simplifies
 * things.. so we go with the rule-of-thumb that 128 bits is enough for
 * calculating RGB intensities anyway..
 * 
 */
public class PointValueCache implements
                             AutoCloseable
{
  static
  {
    System.loadLibrary("arblib");
  }

  /**
   * TODO: this could represent a set of patches of {@link RiemannSurface} sheets
   */
  Complex     points[][][];

  private int width;

  private int height;

  public Complex pointAt(int n, int x, int y)
  {
    return points[n][x][y];
  }

  public boolean       complete = false;

  public MemorySegment segment;

  public MemorySegment segment1;

  public Path          path;

  public Path          path1;

  private long         pointer0;

  private long         pointer1;

  ResourceScope        scope    = ResourceScope.newSharedScope();

  /**
   * TODO: replace 3d this{@link #points} with 2 {@link ComplexMatrix}s
   * 
   * @param id
   * @param numXpoints
   * @param numYpoints
   */
  public PointValueCache(String id, int numXpoints, int numYpoints)
  {
    System.out.println("Opening " + id + ".arb" + " and .arb1");
    this.width  = numXpoints;
    this.height = numYpoints;
    int bytes = Complex.BYTES * numXpoints * numYpoints;

    try
    {
      path     = Path.of(id + ".arb");
      pointer0 = openOrCreateMemoryMappedFile(path, bytes);
      assert pointer0 != 0 : "openOrCreateMemoryMappedFile('" + path + "') failed";
      path1    = Path.of(id + ".arb1");
      pointer1 = openOrCreateMemoryMappedFile(path1, bytes);
      assert pointer1 != 0 : "openOrCreateMemoryMappedFile('" + path1 + "') failed";

      segment  = MemorySegment.ofAddress(MemoryAddress.ofLong(pointer0), bytes, scope);
      segment1 = MemorySegment.ofAddress(MemoryAddress.ofLong(pointer1), bytes, scope);

      points   = new Complex[2][numXpoints][numYpoints];
      long bufferPointer  = pointer0;
      long buffer1Pointer = pointer1;

      for (int x = 0; x < numXpoints; x++)
      {
        for (int y = 0; y < numYpoints; y++)
        {
          Complex point0 = points[0][x][y] = new Complex(bufferPointer += Complex.BYTES,
                                                         false);
          Complex point1 = points[1][x][y] = new Complex(buffer1Pointer += Complex.BYTES,
                                                         false);
          point0.dim      = 2;
          point0.elements = new Complex[]
          { point0, point1 };
        }
      }
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }

  }

  protected long openOrCreateMemoryMappedFile(Path path, int bytes) throws FileNotFoundException, IOException
  {
    return openOrCreateMemoryMappedFile(path.toAbsolutePath().toString(), bytes);
  }

  private long openOrCreateMemoryMappedFile(String string, int bytes)
  {
    return arb.openOrCreateMemoryMappedFile(string, bytes);
  }

  protected void createBlankFile(File file, int bytes)
  {
    System.out.println("Create file " + file + " of " + bytes + " bytes ");
    complete = false;
    try ( RandomAccessFile raf = new RandomAccessFile(file,
                                                      "rw"))
    {
      raf.setLength(bytes);

    }
    catch (Exception e)
    {
      e.printStackTrace();
      System.exit(1);
      ;
    }
  }

  @Override
  public void close()
  {
    assert false : "TODO: call the native code via SWIG that does the msync, munmap, close, calls, etc.";

    scope.close();
    System.out.println("Closing function image cache " + pointer0 + " and " + pointer1);

    if (!complete)
    {
      System.err.println("Deleting incomplete files " + pointer0 + " and " + pointer1);
    }
    System.out.println("Finished closing cache..");
  }
}
