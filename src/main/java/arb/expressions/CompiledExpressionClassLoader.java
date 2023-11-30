package arb.expressions;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class CompiledExpressionClassLoader extends
                                           ClassLoader
{

  private final byte[] classData;
  private final String className;

  public CompiledExpressionClassLoader(String className, byte[] classData)
  {
    this.className = className;
    this.classData = classData;
  }

  /**
   * FIXME: this needs to coordinate with {@link Context} so references to
   * registered functions can be handled
   * 
   * https://github.com/crowlogic/arb4j/issues/264
   * 
   * https://github.com/crowlogic/arb4j/issues/264
   */
  @Override
  protected Class<?> findClass(String name) throws ClassNotFoundException
  {
    if (!name.equals(this.className))
    {
      throw new ClassNotFoundException(name);
    }
    return defineClass(name, this.classData, 0, this.classData.length);
  }
}
