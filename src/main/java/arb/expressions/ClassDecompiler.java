package arb.expressions;

import java.io.File;

import org.jetbrains.java.decompiler.api.Decompiler;
import org.jetbrains.java.decompiler.main.decompiler.DirectoryResultSaver;
import org.jetbrains.java.decompiler.main.decompiler.PrintStreamLogger;
import org.jetbrains.java.decompiler.main.extern.IFernflowerPreferences;

public interface ClassDecompiler
{
  public default void decompile(File inputFile)
  {
    Decompiler decompiler =
                          new Decompiler.Builder().inputs(inputFile)
                                                  .output(new DirectoryResultSaver(new File(".")))
                                                  .option(IFernflowerPreferences.INCLUDE_ENTIRE_CLASSPATH,
                                                          true)
                                                  .logger(new PrintStreamLogger(System.err))
                                                  .build();

    decompiler.decompile();
  }
}
