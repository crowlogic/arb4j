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
 * anyway.. if someone wants to fork the project and change them then have a
 * ball :)
 * 
 */
public class FunctionImage
{
  ByteBuffer buffer;

  public static void main(String args[])
  {
    FunctionImage cache = new FunctionImage(2500,
                                            1250,
                                            128);

  }

  public FunctionImage(int numXpoints, int numYpoints, int precision)
  {
    Complex c = new Complex();
    c.getReal().set("324324.32423423423423423", precision);
    c.getImag().set("29834930824890324.7892304980324980329084", precision);
    int allocatedBytes        = c.getAllocatedBytes();
    int totalBytesToAllocated = allocatedBytes * numXpoints * numYpoints;
    System.out.println("Total Allocated for FunctionImage: " + totalBytesToAllocated);
  }
}
