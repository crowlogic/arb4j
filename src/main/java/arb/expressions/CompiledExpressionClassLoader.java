package arb.expressions;

import java.util.HashMap;

/**
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
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
