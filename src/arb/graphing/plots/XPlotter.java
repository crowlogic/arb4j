/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
package arb.graphing.plots;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import org.lwjgl.system.Configuration;
import org.lwjgl.system.MemoryUtil;
import org.lwjgl.system.MemoryUtil.MemoryAllocationReport;
import org.lwjgl.system.MemoryUtil.MemoryAllocationReport.Aggregate;

import arb.functions.complex.XFunction;
import arb.graphing.ComplexFunctionPlotter;
import arb.graphing.Part;

/**
 * Renders the {@link XFunction} via {@link ComplexFunctionPlotter}
 */
public class XPlotter extends
                      ComplexFunctionPlotter
{
  public static void main(String args[]) throws IOException, NoninvertibleTransformException, InterruptedException
  {
    Configuration.DEBUG_MEMORY_ALLOCATOR.set(true);
    Configuration.MEMORY_ALLOCATOR.set("rpmalloc");
    try ( XPlotter plotter = new XPlotter(5);)
    {
      plotter.plot();
      plotter.saveToFile();
      plotter.close();
    }
    Thread.sleep(5000);

    System.out.println("Memory Leak Report:");
    printMemoryReport();
  }

  public static void printMemoryReport()
  {
    MemoryUtil.memReport(new MemoryAllocationReport()
    {

      @Override
      public void
             invoke(long address, long memory, long threadId, String threadName, StackTraceElement... stacktrace)
      {

        System.out.format("addr=0x%x mem=0x%x threadId=%i threadName=%s\n", address, memory, threadId, threadName);
        for (StackTraceElement element : stacktrace)
        {
          System.out.println(element);
        }
        System.out.println();

      }
    }, Aggregate.GROUP_BY_STACKTRACE, false);
  }

  public static final int width  = 2500 / 2;
  public static final int height = 1250;

  public XPlotter(double vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -7.5 * 5,
                                 80,
                                 15 * 5),
          new XFunction(vscale));

    color_mode        = 5;
    bilinearSmoothing = false;
    displayMode       = Part.Blend;

  }

}