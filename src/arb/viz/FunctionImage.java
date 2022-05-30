package arb.viz;

import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

import arb.Complex;

/**
 * TODO: cache the values that are calculated in
 * {@link ComplexFunctionPlotter#evaluateFunctionOnGrid()} using
 * {@link ByteBuffer}s memory-mapped via
 * {@link FileChannel#map(java.nio.channels.FileChannel.MapMode, long, long)}
 * 
 * TODO: find out how acb_t heap works and how to specify a custom GMP allocator
 * where the function we would pass to GMP would be something that created the
 * empty files of the appropriate size and returned a {@link ByteBuffer} mapping
 * its contents
 * 
 * 
 * 
 * @author crow
 *
 */
public class FunctionImage
{
  ByteBuffer buffer;

  public FunctionImage(int numXpoints, int numYpoints, int precision)
  {
    Complex c = new Complex().init();
  }
}
