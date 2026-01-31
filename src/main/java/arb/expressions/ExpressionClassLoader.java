package arb.expressions;

import static arb.utensils.Utensils.wrapOrThrow;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ExpressionClassLoader extends
                                   ClassLoader
{

  @Override
  public String toString()
  {
    return String.format("ExpressionClassLoader[compiledClasses=%s, context=%s]",
                         compiledClasses,
                         context);
  }

  private final static Logger log = LoggerFactory.getLogger(ExpressionClassLoader.class);

  @Override
  protected Class<?> findClass(String name) throws ClassNotFoundException
  {
//    if (Expression.trace)
//    {
//      log.debug("\n\nfindClass('{}') in classes {{}} of Context#{} which has functions={}\n",
//                name,
//                compiledClasses.keySet(),
//                System.identityHashCode(context),
//                context.functions);
//    }

    // First check compiledClasses map for direct class name match
//    Class<?> directMatch = compiledClasses.get(name);
//    if (directMatch != null)
//    {
//      directMatch.s
//      log.debug("Returning " + directMatch + " for " + name );
//
//      return directMatch;
//    }
//    
    FunctionMapping<Object,
                  Object,
                  Function<? extends Object,
                                ? extends Object>> functionMapping =
                                                                   context.getFunctionMapping(name);
    if (functionMapping != null)
    {
      log.debug("Returning " + functionMapping + " for " + name);
      return functionMapping.type();
    }

    AtomicReference<Class<?>> mappedClassReference = new AtomicReference<Class<?>>();
    context.functions.values().forEach(mapping ->
    {
      if (name.equals(mapping.functionName) || name.equals(mapping.functionClass.getName()))
      {
        assert mappedClassReference.get()
                      == null : mappedClassReference + " is already mapped to " + mapping;
        mappedClassReference.set(mapping.functionClass);
        if (Expression.trace)
        {
          log.debug("\n\nMapped {} to {}\n", mapping, name);
        }
      }
    });

    Class<?> mappedClass = mappedClassReference.get();

    return mappedClass;
  }

  HashMap<String, Class<?>> compiledClasses = new HashMap<>();
  public final Context            context;

  public ExpressionClassLoader(Context context)
  {
    this.context = context;
    assert context != null : "context shan't be null";
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
