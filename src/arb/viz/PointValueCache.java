package arb.viz;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel.MapMode;
import java.nio.file.Path;

import arb.Complex;
import arb.arb;
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
 * TODO: use MemorySegmen
 */
public class PointValueCache implements
                             AutoCloseable
{
  static
  {
    System.loadLibrary("arblib");
  }

  Complex            points[][][];

  private int        width;

  private int        height;

  ByteBuffer buffer;

  private ByteBuffer buffer1;

  private long       bufferAddress;

  private long       buffer1Address;

  public Complex pointAt(int n, int x, int y)
  {
    return points[n][x][y];
  }

  public boolean       complete = false;

  public MemorySegment segment;

  public MemorySegment segment1;

  public Path          path;

  public Path          path1;

  private File         file;

  private File         file1;

  public PointValueCache(String id, int numXpoints, int numYpoints)
  {
    System.out.println("Opening " + id + ".arb" + " and .arb1");
    this.width  = numXpoints;
    this.height = numYpoints;
    int bytes = Complex.BYTES * numXpoints * numYpoints;

    try
    {
      path           = Path.of(id + ".arb");
      file           = openFileOrCreateNewOneIfNotExisting(path, bytes);
      path1          = Path.of(id + ".arb1");
      file1          = openFileOrCreateNewOneIfNotExisting(path1, bytes);

      segment        = MemorySegment.mapFile(path, 0, bytes, MapMode.READ_WRITE, ResourceScope.globalScope());
      segment1       = MemorySegment.mapFile(path1, 0, bytes, MapMode.READ_WRITE, ResourceScope.globalScope());
      buffer         = segment.asByteBuffer();
      buffer1        = segment1.asByteBuffer();

      points         = new Complex[2][numXpoints][numYpoints];
      bufferAddress  = arb.bufferAddress(buffer);
      buffer1Address = arb.bufferAddress(buffer1);

      for (int x = 0; x < numXpoints; x++)
      {
        for (int y = 0; y < numYpoints; y++)
        {
          Complex point0 = points[0][x][y] = new Complex(bufferAddress += Complex.BYTES,
                                                         false);
          Complex point1 = points[1][x][y] = new Complex(buffer1Address += Complex.BYTES,
                                                         false);
          point0.dim      = 2;
          point0.elements = new Complex[]
          { point0, point1 };
        }
      }
      assert bufferAddress - arb.bufferAddress(buffer) == bytes;
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }

  }

  protected File openFileOrCreateNewOneIfNotExisting(Path path, int bytes) throws FileNotFoundException, IOException
  {
    File file = path.toFile();
    if (file.exists() && file.length() == bytes)
    {
      complete = true;
      return file;
    }
    createBlankFile(file, bytes);
    return file;
  }

  protected void createBlankFile(File file, int bytes) throws FileNotFoundException, IOException
  {
    System.out.println("Create file " + file + " of " + bytes + " bytes ");
    complete = false;
    try ( RandomAccessFile raf = new RandomAccessFile(file,
                                                      "rw"))
    {
      raf.setLength(bytes);
    }
  }

  @Override
  public void close()
  {
    assert buffer != null;
    System.out.println("Closing function image cache " + file + " and " + file1);
    
    buffer  = null;
    buffer1 = null;
    System.out.println( "unmapping caches");
    segment.unload();
    segment1.unload();
    System.out.println( "unmapped caches");

    if (!complete)
    {
      System.err.println("Deleting incomplete files " + file + " and " + file1);
      file.delete();
      file1.delete();

    }
    System.out.println("Finished closing cache..");
  }
}
