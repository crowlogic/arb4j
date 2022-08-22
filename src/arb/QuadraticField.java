package arb;

/**
 * 
 * 
 * An algebraic integer of the form a+b*√D where D is square-free forms a
 * quadratic field and is denoted Q(sqrt(D)). <br>
 * If D>0, the field is called a real quadratic field, and <br>
 * if D<0, it is called an imaginary quadratic field. <br>
 * The integers in Q(sqrt(1)) are simply called "the" {@link Integer}. <br>
 * The integers in Q(sqrt(-1)) are called Gaussian integers,<br>
 * and the integers in Q(sqrt(-3)) are called Eisenstein integers. <br>
 * The algebraic integers in an arbitrary {@link QuadraticField} do not
 * necessarily have unique factorizations. For example, the fields Q(sqrt(-5))
 * and Q(sqrt(-6)) are not uniquely factorable, since
 * 21=3·7=(1+2sqrt(-5))(1-2sqrt(-5)) (1) 6=-sqrt(-6)(sqrt(-6))=2·3, (2) although
 * the above factors are all primes within these fields. <br>
 * All other quadratic fields Q(sqrt(D)) with |D|<=7 are uniquely factorable.
 * 
 * Quadratic fields obey the identities
 * (a+bsqrt(D))+/-(c+dsqrt(D))=(a+/-c)+(b+/-d)sqrt(D) <br>
 * (a+bsqrt(D))(c+dsqrt(D))=(ac+bdD)+(ad+bc)sqrt(D)) <br>
 * 
 * and
 * (a+bsqrt(D))/(c+dsqrt(D))=(ac-bdD)/(c^2-d^2D)+(bc-ad)/(c^2-d^2D)sqrt(D).<br>
 * 
 * The integers in the real field Q(sqrt(D)) are of the form r+srho, where
 * rho={sqrt(D) for D=2 or D=3 (mod 4); 1/2(-1+sqrt(D)) for D=1 (mod 4). (6)
 * 
 * There are exactly 21 quadratic fields in which there is a Euclidean
 * algorithm, corresponding to Q(m) for ▢-free integers -11, -7, -3, -2, -1, 2,
 * 3, 5, 6, 7, 11, 13, 17, 19, 21, 29, 33, 37, 41, 57, and 73 (A048981). This
 * list was published by Inkeri (1947), but erroneously included the spurious
 * additional term 97 (Barnes and Swinnerton-Dyer 1952; Hardy and Wright 1979,
 * p. 217). See also Algebraic Integer, Eisenstein Integer, Gaussian Integer,
 * Imaginary Quadratic Field, Integer, Number Field, Quadratic, Real Quadratic
 * Fiel
 * 
 * @author crow
 *
 */
public interface QuadraticField extends
                                Field<QuadraticField>
{

}
