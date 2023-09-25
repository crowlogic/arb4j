package arb.expressions;

public class ByteArrayClassLoader extends
                                  ClassLoader
{

  private final byte[] classData;
  private final String className;

  public ByteArrayClassLoader(String className, byte[] classData)
  {
    this.className = className;
    this.classData = classData;
  }

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
