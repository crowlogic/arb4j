package arb.expressions;

import static arb.utensils.Utensils.wrapOrThrow;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ExpressionClassLoader extends
                                   ClassLoader
{

  private final static Logger log = LoggerFactory.getLogger(ExpressionClassLoader.class);

  @Override
  protected Class<?> findClass(String name) throws ClassNotFoundException
  {
    if (Expression.trace)
    {
      log.debug("\n\nfindClass('{}') in classes {{}} of Context#{}\n",
                              name,
                              compiledClasses.keySet(),
                              System.identityHashCode(context));
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
          log.debug("\n\nMapped {} to {}\n", mapping, name);
        }
      }
    });
    Class<?> mappedClass = mapped.get();
    return mappedClass != null ? mappedClass : super.findClass(name);
  }

  HashMap<String, Class<?>> compiledClasses = new HashMap<>();
  public Context            context;

  public ExpressionClassLoader()
  {
  }

  public ExpressionClassLoader(Context context)
  {
    this.context = context;
  }

  public Class<?> defineClass(String className, byte[] bytecodes)
  {
    if (Expression.trace)
    {
      log.debug(String.format("defineClass( className=%s )", className));
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
