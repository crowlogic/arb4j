package arb.viz;

import java.io.Closeable;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

import arb.Complex;
import arb.ComplexMatrix;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * If the precision of the number is 128 bits or less then the only space
 * required to allocate the pair of Real(arb_t) structures to constitute the
 * Complex(acb_t) structure is the structures themselves ( {@link Complex#BYTES}
 * ) without any internal-to-arb allocations necessary and thus simplifies
 * things.. so we go with the rule-of-thumb that 128 bits is enough for
 * calculating RGB intensities anyway..
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings(
{ "unused" })
public class PointValueCache implements
                             AutoCloseable
{
  static
  {
    System.loadLibrary("arblib");
  }

  Complex[][][]         points;

  transient private int width;

  transient private int height;

  public Complex pointAt(int n, int x, int y)
  {
    return points[n][x][y];
  }

  public boolean     complete = false;

  public Path        path;

  public Path        path1;

  private MappedFile mappedFile0;

  private MappedFile mappedFile1;

  private int        byteSize;

  /**
   * TODO: replace 3d this{@link #points} with 2 {@link ComplexMatrix}s
   * 
   * @param id
   * @param numXpoints
   * @param numYpoints
   * @param autoDelete TODO
   */
  public PointValueCache(String id, int numXpoints, int numYpoints, boolean autoDelete)
  {
    this.width  = numXpoints;
    this.height = numYpoints;
    byteSize    = Complex.BYTES * numXpoints * numYpoints;

    try
    {
      path        = Path.of(id + ".arb");
      mappedFile0 = openOrCreateMemoryMappedFile(path, byteSize, autoDelete);
      path1       = Path.of(id + ".arb1");
      mappedFile1 = openOrCreateMemoryMappedFile(path1, byteSize, autoDelete);
      points      = new Complex[2][numXpoints][numYpoints];
      long bufferPointer  = mappedFile0.pointer;
      long buffer1Pointer = mappedFile1.pointer;

      int  nonzeroCount   = 0;

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
          if (!point0.isZero())
          {
            nonzeroCount++;
          }
          if (!point1.isZero())
          {
            nonzeroCount++;
          }
        }
      }
      if (nonzeroCount > 100)
      {
        complete = true;
      }
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }

  }

  public static class MappedFile implements
                                 AutoCloseable,
                                 Closeable
  {
    @Override
    public String toString()
    {
      return "MappedFile[path="
             + path
             + ", pointer="
             + pointer
             + ", directBuffer="
             + directBuffer
             + ", fileChannel="
             + fileChannel
             + "]";
    }

    long        pointer;
    ByteBuffer  directBuffer;
    FileChannel fileChannel;
    public Path path;

    public void close()
    {
      try
      {
        if (fileChannel != null)
        {
          fileChannel.close();
        }
      }
      catch (IOException e)
      {
        System.err.println("Exception occured trying to close " + path);
        e.printStackTrace();
      }
      fileChannel = null;
    }
  }

  private MappedFile
          openOrCreateMemoryMappedFile(Path path, int bytes, boolean autodelete) throws IOException
  {
    MappedFile mf = new MappedFile();

    mf.path         = path;
    mf.fileChannel  = autodelete
                                 ? FileChannel.open(path,
                                                    StandardOpenOption.CREATE,
                                                    StandardOpenOption.READ,
                                                    StandardOpenOption.WRITE,
                                                    StandardOpenOption.DELETE_ON_CLOSE)
                                 : FileChannel.open(path,
                                                    StandardOpenOption.CREATE,
                                                    StandardOpenOption.READ,
                                                    StandardOpenOption.WRITE);
    mf.directBuffer = mf.fileChannel.map(MapMode.READ_WRITE, 0, bytes);

    mf.pointer      = arblib.bufferAddress(mf.directBuffer);
    if (mf.pointer == 0)
    {
      throw new IOException("openOrCreateMemoryMappedFile "
                            + path
                            + " byteSize="
                            + bytes
                            + " didn't succed");
    }
    return mf;
  }

  @Override
  public void close()
  {
    mappedFile0.close();
    mappedFile1.close();
  }

}
