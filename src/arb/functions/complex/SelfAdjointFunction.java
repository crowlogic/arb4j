package arb.functions.complex;

/**
 * A self-adjoint function (more commonly called a Hermitian function which is
 * named after Charles Hermite) is a complex function with the property that its
 * complex conjugate is equal to the original function with the variable changed
 * in sign:<br>
 * 
 * f^*(x)=f(-x) where f^* is the complex conjugate of f <br>
 * 
 * ∀x in the domain of f. <br>
 * 
 * In physics, this property is referred to as PT symmetry which is invariance
 * with respect to the simultaneous action of the (P) <b>parity-inversion</b>
 * and (T) <b>time reversal</b> symmetry operators)<br>
 * 
 * f is a self-adjoint iff (if and only if)
 * 
 * 1. the real part of f is an even function <br>
 * and <br>
 * 2. the imaginary of f is an odd function
 */
public interface SelfAdjointFunction extends
                                     ComplexFunction
{

}
