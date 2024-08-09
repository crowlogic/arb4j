package arb.utensils;

/**
 * Convenience methods with respect to types.
 * 
 * @author Udo Hoefel
 */
public final class Types
{

  /**
   * Gets the (array) dimension of the given class.
   * <p>
   * Example code:
   * <p>
   * <code>elementType(double[][].class)</code> will yield <code>2</code>
   * <code>elementType(String.class)</code> will yield <code>0</code>
   * 
   * @param clazz the class to get the (array) dimension for
   * @return the array dimension, or 0 if not an array
   */
  public static final int dimension(Class<?> clazz)
  {
    if (clazz.isArray())
    {
      return dimension(clazz.getComponentType()) + 1;
    }

    return 0;
  }

}
