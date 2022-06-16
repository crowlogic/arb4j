package arb.viz;

import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

import arb.Complex;

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
public class FunctionImage
{
  static
  {
    System.loadLibrary("arblib");
  }
  
  ByteBuffer buffer;

  Complex    points[][];

  public static void main(String args[])
  {
    FunctionImage cache = new FunctionImage(2500,
                                            1250);

  }

  public FunctionImage(int numXpoints, int numYpoints)
  {
    int totalBytesToAllocate = Complex.BYTES * numXpoints * numYpoints;
    buffer = ByteBuffer.allocateDirect(totalBytesToAllocate);
    points = new Complex[numXpoints][numYpoints];
    long bufferAddress = arb.arb.bufferAddress(buffer);
    for (int i = 0; i < numXpoints; i++)
    {
      for (int j = 0; j < numYpoints; j++)
      {
        points[i][j]   = new Complex(bufferAddress,
                                     false);
        bufferAddress += Complex.BYTES;
      }
    }
  }

}
