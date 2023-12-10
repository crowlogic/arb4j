package arb.expressions;

import java.util.HashMap;

/**
 * <pre>
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 * 
 * @author ©2023 Stephen Crowley
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
