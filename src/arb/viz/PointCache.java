package arb.viz;

import java.io.*;
import java.nio.*;
import java.nio.channels.*;

import arb.*;

/**
 * TODO: cache the values that are calculated in
 * {@link ComplexFunctionRenderer#evaluateFunctionOnGrid()} using
 * {@link ByteBuffer}s memory-mapped via
 * {@link FileChannel#map(java.nio.channels.FileChannel.MapMode, long, long)}
 * 
 * If the precision of the number is 128 bits or less then ONLY the space
 * required is enough to hold {@link Complex#BYTES} without any internal-to-arb
 * allocations necessary and thus simplifies things.. so we go with the
 * rule-of-thumb that 128 bits is enough for calculating RGB intensities
 * anyway..
 * 
 */
public class PointCache 
{
  static
  {
    System.loadLibrary("arblib");
  }

  ByteBuffer buffer;

  Complex    points[][];

  public Complex pointAt(int x, int y)
  {
    return points[x][y];
  }

  public PointCache(String id, int numXpoints, int numYpoints)
  {

    int bytes = Complex.BYTES * numXpoints * numYpoints;
    try ( RandomAccessFile file = new RandomAccessFile(id + ".arb",
                                                       "rw"))
    {
      MappedByteBuffer buffer = file.getChannel().map(FileChannel.MapMode.READ_WRITE, 0, bytes);
      points = new Complex[numXpoints][numYpoints];
      long bufferAddress = arb.bufferAddress(buffer);
      for (int i = 0; i < numXpoints; i++)
      {
        for (int j = 0; j < numYpoints; j++)
        {
          points[i][j]   = new Complex(bufferAddress,
                                       false);
          bufferAddress += Complex.BYTES;
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

}
