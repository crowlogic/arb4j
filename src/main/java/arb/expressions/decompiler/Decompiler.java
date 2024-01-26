package arb.expressions.decompiler;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.jetbrains.java.decompiler.main.decompiler.BaseDecompiler;
import org.jetbrains.java.decompiler.main.decompiler.PrintStreamLogger;
import org.jetbrains.java.decompiler.main.extern.IFernflowerLogger;
import org.jetbrains.java.decompiler.main.extern.IResultSaver;

import arb.expressions.Expression;

/**
 * TODO: integrate this with {@link Expression}
 */
public class Decompiler
{
  public static void main(String[] args)
  {

    IResultSaver        saver           = new DecompiledResultBeautifierAndSaver();

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
