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

  public CompiledExpressionClassLoader()
  {
  }

  @Override
  protected Class<?> findClass(String name) throws ClassNotFoundException
  {
    Class<?> compiledClass = compiledClasses.get(name);
    if (compiledClass != null)
    {
      return compiledClass;
    }
    else
    {
      throw new ClassNotFoundException(name);
    }
  }

  public Class<?> defineClass(String className, byte[] bytecodes)
  {

    Class<?> definedClass = defineClass(className, bytecodes, 0, bytecodes.length);
    compiledClasses.put(className, definedClass);
    return definedClass;
  }
}
