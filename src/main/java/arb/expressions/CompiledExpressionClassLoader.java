package arb.expressions;

import static arb.utensils.Utensils.wrapOrThrow;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;

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
    if (Expression.trace)
    {
      System.err.format("findClass(%s) in classes {%s} of %s\n",
                        name,
                        compiledClasses.keySet(),
                        context);
    }
    AtomicReference<Class<?>> mapped = new AtomicReference<Class<?>>();
    context.functions.map.values().forEach(mapping ->
    {
      if (mapping.functionClass != null && name.equals(mapping.functionClass.getSimpleName()))
      {
        assert mapped.get() == null : mapped + " is already mapped to " + mapping;
        mapped.set(mapping.functionClass);
        if (Expression.trace)
        {
          System.err.println("Mapped " + mapping + " to " + name);
        }
      }
    });
    Class<?> mappedClass = mapped.get();
    return mappedClass != null ? mappedClass : super.findClass(name);
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
    try
    {
      Class<?> definedClass = defineClass(className, bytecodes, 0, bytecodes.length);
      compiledClasses.put(className, definedClass);
      return definedClass;
    }
    catch (ClassFormatError e)
    {
      wrapOrThrow(className, e);
      return null;
    }
  }
}
