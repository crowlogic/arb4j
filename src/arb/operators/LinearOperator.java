package arb.operators;

/**
 * A an operator is a linear operator if it transforms the space it operates on
 * in the following way:
 * <ul>
 * <li>f(x+y)=f(x)+f(y) ∀x & ∀y</li>
 * <li>f(cx)=cf(x) ∀x & ∀ constant scalars c</li>
 * </ul>
 * 
 * TODO: define the interfaces of the input and output space(s) as generic
 * arguments, should be straight-forward to create a generic test that tests the
 * linearness of the implementing class
 */
public interface LinearOperator
{

}
