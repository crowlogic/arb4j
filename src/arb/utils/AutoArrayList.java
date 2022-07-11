package arb.utils;

import java.util.*;
import java.util.function.*;

public class AutoArrayList<V> extends
                          ArrayList<V>
{
  private static final long serialVersionUID = 1L;
  final Class<? super V> valueClass;
  private Function<Integer, V> constructor;

  public AutoArrayList(int initialCapacity, Class<? super V> valueClass)
  {
    super(initialCapacity);
    this.valueClass = valueClass;
  }

  public AutoArrayList(int initialCapacity, Function<Integer, V> constructor)
  {
    super(initialCapacity);
    this.constructor = constructor;
    this.valueClass = null;
  }

  public AutoArrayList(Class<? super V> valueClass)
  {
    this.valueClass = valueClass;
  }

  public AutoArrayList(Function<Integer, V> constructor)
  {
    this.constructor = constructor;
    this.valueClass = null;
  }

  public AutoArrayList()
  {
    this.valueClass = null;
  }

  /*
   * WARNING - Removed try catching itself - possible behaviour change.
   */
  @SuppressWarnings("unchecked")
  public V getOrCreate(Integer key)
  {
    V value;
    V v = value = key < this.size() ? (V) this.get(key) : null;
    if (value == null)
    {
      AutoArrayList<V> autoArrayList = this;
      synchronized (autoArrayList)
      {
        try
        {
          value = this.valueClass == null ? this.newValueInstance(key)
                        : (V) this.valueClass.getConstructor(new Class[0]).newInstance(new Object[0]);
        }
        catch (Exception e)
        {
          throw new RuntimeException(e);
        }
      }
    }
    return value;
  }

  public V newValueInstance(Integer key)
  {
    if (this.constructor != null)
    {
      V constructed = this.constructor.apply(key);
      while (this.size() < key)
      {
        this.add(null);
      }
      this.add(key, constructed);
      return constructed;
    }
    throw new UnsupportedOperationException("newInstance() must be overriden if not instantiated with a value class or constructor function");
  }
}
