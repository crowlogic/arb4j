package arb;

import arb.spaces.Space;

/**
 * A field is a set on which addition, subtraction, multiplication, and division
 * are defined and behave as the corresponding operations on rational and real
 * numbers do. A field is thus a fundamental algebraic structure which is widely
 * used in algebra, number theory, and many other areas such as physics where
 * fields potentially represent actually existing physical fields and forces and
 * measurements on them, conserved quantities, etc
 */
public interface Field extends
                       AutoCloseable, Space
{

  @Override
  public default void close()
  {
  }

  public default Real abs(int prec, Real w)
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

}
