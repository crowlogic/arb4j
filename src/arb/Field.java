package arb;

import arb.topological.Space;

/**
 * A field is a set on which addition, subtraction, multiplication, and division
 * are defined and behave as the corresponding operations on rational and real
 * numbers do. A field is thus a fundamental algebraic structure which is widely
 * used in algebra, number theory, and many other areas such as physics where
 * fields potentially represent actually existing physical fields and forces and
 * measurements on them, conserved quantities, etc
 */
public interface Field<X extends Field> extends
                      AutoCloseable,
                      Space,
                      Iterable<X>
{

  public default X Σ(int prec, X result)
  {
    result.zero();
    forEach(element -> result.add(element, prec, result));
    return result;
  }

  public X add(X element, int prec, X result);

  public X zero();

  @Override
  public default void close()
  {
  }

  public default Real abs(int prec, Real w)
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

}
