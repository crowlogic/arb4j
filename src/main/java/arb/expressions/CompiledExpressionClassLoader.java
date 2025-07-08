package arb.expressions;

import static arb.utensils.Utensils.wrapOrThrow;

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

  @Override
  protected Class<?> findClass(String name) throws ClassNotFoundException
  {
    System.err.format("findClass(%s) in {%s}\n", name, compiledClasses.keySet());
    return super.findClass(name);
  }

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
    // assert !compiledClasses.containsKey(className) : className + " already
    // exists";
    try { Class<?> definedClass = defineClass(className, bytecodes, 0, bytecodes.length);
    compiledClasses.put(className, definedClass);
    return definedClass;
    } catch(ClassFormatError e)
    {
      wrapOrThrow(className, e);
      return null;
    }
  }
}
