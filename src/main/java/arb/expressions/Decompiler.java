package arb.expressions;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.jetbrains.java.decompiler.main.decompiler.*;
import org.jetbrains.java.decompiler.main.extern.IFernflowerLogger;
import org.jetbrains.java.decompiler.main.extern.IResultSaver;

/**
 * TODO: integrate this with {@link Expression}
 */
public class Decompiler
{
  public static void main(String[] args)
  {
    IResultSaver        saver           = new DirectoryResultSaver(new File("."));

    IFernflowerLogger   logger          = new PrintStreamLogger(System.out);

    Map<String, Object> options         = new HashMap<>();

    BaseDecompiler      decompiler      = new BaseDecompiler(saver,
                                                             options,
                                                             logger);

    File                sourceClassFile = new File(args[0]);

    decompiler.addSource(sourceClassFile);
    decompiler.decompileContext();
  }
}
