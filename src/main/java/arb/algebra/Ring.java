package arb.algebra;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.groups.CommutativeGroup;

/**
 * <pre>
 * A ring is a set R equipped with two operations: addition (+) and 
 * multiplication (⋅) satisfying the ring axioms. The {@link Ring} class
 * extends {@link Magma}, inheriting the {@link Magma#mul(Object, int)} and 
 * {@link Magma#div(Object, int)} methods and declaring methods for addition 
 * and subtraction.
 *
 * A ring R is a {@link CommutativeGroup} under addition, meaning that:
 * - (a + b) + c = a + (b + c) ∀ a, b, c in R                                        (associativity of addition).
 * - a + b = b + a ∀ a, b in R                                                       (commutativity of addition).
 * - There exists an element 0 in R such that a + 0 = a ∀ a in R                     (0 is the additive identity).
 * - For each element a in R, there exists an element −a in R such that a + (−a) = 0 (existence of additive inverses).
 *
 * Under multiplication, R is a monoid, meaning that:
 * - (a ⋅ b) ⋅ c = a ⋅ (b ⋅ c) for all a, b, c in R (associativity of multiplication).
 * - There exists an element 1 in R such that a ⋅ 1 = a and 1 ⋅ a = a for all a in R (1 is the multiplicative identity).
 *
 * Multiplication is distributive with respect to addition:
 * - a ⋅ (b + c) = (a ⋅ b) + (a ⋅ c) ∀a, b, c in R (left distributivity).
 * - (b + c) ⋅ a = (b ⋅ a) + (c ⋅ a) ∀a, b, c in R (right distributivity).
 * </pre>
 *
 * @param <X> the set over which this {@link Ring} is defined.
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Ring<X> extends Magma<X>, CommutativeGroup<X>
{

  int dim();

  @Override
  default boolean contains(X element)
  {
    assert false : "this should be overridden";
    return false;
  }

  @Override
  default X identity()
  {
    assert false : "this should be overridden";
    return null;
  }

  @Override
  default X apply(X x, X y)
  {
    assert false : "this should be overridden";
    return null;
  }

  @Override
  default X inverse(X x)
  {
    assert false : "this should be overridden";
    return null;
  }


  @SuppressWarnings("unchecked")
  public default X add(X addend, int bits)
  {
    return add(addend, bits, (X) this);
  }

  X add(X addend, int bits, X result);

  X sub(X subtrahend, int bits, X result);

  @SuppressWarnings("unchecked")
  @Override
  public default X mul(X x, int prec)
  {
    return mul(x, prec, (X) this);
  }

  @SuppressWarnings("unchecked")
  public default X div(X x, int prec)
  {
    return div(x, prec, (X) this);
  }
  
  @Override
  public X div(X x, int prec, X result);
  
  @SuppressWarnings("unchecked")
  public default X pow(X x, int prec)
  {
    return pow(x, prec, (X) this);
  }
  
  @Override
  public default X pow(X x, int prec, X result)
  {
    assert false : String.format( "TODO: %s needs to implement this", getClass() );
    return null;
  }
  
}
