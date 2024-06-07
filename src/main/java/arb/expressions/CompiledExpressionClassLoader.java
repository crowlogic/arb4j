package arb.expressions;

import java.util.HashMap;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class CompiledExpressionClassLoader extends
                                           ClassLoader
{

  HashMap<String, Class<?>> compiledClasses = new HashMap<>();
  public Context            context;

  public CompiledExpressionClassLoader()
  {
  }

  public CompiledExpressionClassLoader(Context context)
  {
    this.context = context;
  }

  public Class<?> defineClass(String className, byte[] bytecodes)
  {
    if (Expression.trace)
    {
      System.err.format("defineClass( className=%s, ... )\ncompiledClasses.keys=%s\n\n",
                        className,
                        compiledClasses.keySet());
    }
    assert !compiledClasses.containsKey(className) : className + " already exists";
    Class<?> definedClass = defineClass(className, bytecodes, 0, bytecodes.length);
    compiledClasses.put(className, definedClass);
    return definedClass;
  }
}
