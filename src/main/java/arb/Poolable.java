package arb;

public interface Poolable<T>
{
  public T borrowVariable();

  void returnVariable(T object);
}
