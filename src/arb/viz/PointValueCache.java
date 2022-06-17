package arb.viz;

import java.io.*;
import java.nio.*;
import java.nio.channels.*;

import arb.*;

/**
 * If the precision of the number is 128 bits or less then ONLY the space
 * required is enough to hold {@link Complex#BYTES} without any internal-to-arb
 * allocations necessary and thus simplifies things.. so we go with the
 * rule-of-thumb that 128 bits is enough for calculating RGB intensities
 * anyway..
 * 
 */
public class PointValueCache implements
                             AutoCloseable
{
  static
  {
    System.loadLibrary("arblib");
  }

  Complex          points[][][];

  private int      width;

  private int      height;

  MappedByteBuffer buffer;

  MappedByteBuffer buffer1;

  private long     bufferAddress;

  private long     buffer1Address;

  public Complex pointAt(int n, int x, int y)
  {
    return points[n][x][y];
  }

  public PointValueCache(String id, int numXpoints, int numYpoints)
  {
    this.width  = numXpoints;
    this.height = numYpoints;
    int bytes = Complex.BYTES * numXpoints * numYpoints;
    try ( RandomAccessFile file = new RandomAccessFile(id + ".arb",
                                                       "rw");
          RandomAccessFile file1 = new RandomAccessFile(id + ".arb1",
                                                        "rw"))
    {
      if (file.length() < bytes)
      {
        file.setLength(bytes);
      }
      if (file1.length() < bytes)
      {
        file1.setLength(bytes);
      }

      buffer         = file.getChannel().map(FileChannel.MapMode.READ_WRITE, 0, bytes);
      buffer1        = file1.getChannel().map(FileChannel.MapMode.READ_WRITE, 0, bytes);

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

  public void check()
  {
    for (int x = 0; x < width; x++)
    {
      for (int y = 0; y < height; y++)
      {
        Complex point0        = points[0][x][y];
        Complex point1        = points[1][x][y];
        int     zeroPointBits = point0.bits();
        if (zeroPointBits > 256)
        {
          System.out.println("point has too many bits, " + zeroPointBits + " at " + x + "," + y);
          arb.arb_trim(point0.getReal(), point0.getReal());
          arb.arb_trim(point0.getImag(), point0.getImag());
          zeroPointBits = point0.bits();
          throw new RuntimeException("point still has too many bits after trimming, " + zeroPointBits + " at " + x
                        + "," + y);
        }
      }
    }
  }

  @Override
  public void close() throws Exception
  {
    check();
  }
}
