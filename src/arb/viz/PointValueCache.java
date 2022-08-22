package arb.viz;

import static java.lang.System.out;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;
import java.nio.file.Path;

import arb.Complex;
import arb.ComplexMatrix;
import arb.SWIGTYPE_p_int;
import arb.arb;
import arb.geometry.surfaces.RiemannSurface;
import jdk.incubator.foreign.MemorySegment;
import jdk.incubator.foreign.ResourceScope;

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


  int                  fd0, fd1;

  private int          byteSize;

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
    byteSize    = Complex.BYTES * numXpoints * numYpoints;

    try
    {
      int fd[] = new int[1];
      path     = Path.of(id + ".arb");
      pointer0 = openOrCreateMemoryMappedFile(path, byteSize, fd);
      fd0      = fd[0];
      assert pointer0 != 0 : "openOrCreateMemoryMappedFile('" + path + "') failed";
      path1    = Path.of(id + ".arb1");
      pointer1 = openOrCreateMemoryMappedFile(path1, byteSize, fd);
      fd1      = fd[0];
      assert pointer1 != 0 : "openOrCreateMemoryMappedFile('" + path1 + "') failed";

      points = new Complex[2][numXpoints][numYpoints];
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

  protected long openOrCreateMemoryMappedFile(Path path, int bytes, int fd[]) throws FileNotFoundException,
                                                                              IOException
  {
    return openOrCreateMemoryMappedFile(path.toAbsolutePath().toString(), bytes, fd);
  }

  private long openOrCreateMemoryMappedFile(String string, int bytes, int fd[])
  {
    ByteBuffer     directBuffer = ByteBuffer.allocateDirect(4).order(ByteOrder.LITTLE_ENDIAN);
    IntBuffer      fileHandle   = directBuffer.asIntBuffer();

    SWIGTYPE_p_int fdPointer    = new SWIGTYPE_p_int(arb.bufferAddress(directBuffer),
                                                     false);
    long           pointer      = arb.openOrCreateMemoryMappedFile(string, fdPointer, bytes);
    assert pointer != 0 : "openOrCreateMemoryMappedFile " + string + " byteSize=" + bytes + " didn't succed";
    fd[0] = fileHandle.get();
    out.printf("fd %d -> %d bytes@0x%x in %s\n", fd[0], bytes, pointer, string);
    return pointer;
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
    arb.unmapAndCloseFile(fd0, pointer0, byteSize);
    arb.unmapAndCloseFile(fd1, pointer1, byteSize);

    System.out.println("Closing function image cache " + pointer0 + " and " + pointer1);

    if (!complete)
    {
      System.err.println("Deleting incomplete files " + path + " and " + path1);
      path.toFile().delete();
      path1.toFile().delete();
    }
    System.out.println("Finished closing cache..");
  }
}
