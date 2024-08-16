%typemap(javafinalize) arb_struct ""

%typemap(javainterfaces) arb_struct "Domain<Real>,Serializable,Comparable<Real>,Iterable<Real>,NamedField<Real>,Lockable<Real>,IntFunction<Real>,Assignable<Real>"

%typemap(javaimports) arb_struct %{
import static arb.IntegerConstants.*;
import static arb.RealConstants.zero;
import static arb.arblib.*;

import java.io.Serializable;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.stream.IntStream;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.stochastic.ProbabilityDistributionFunction;
import arb.utensils.Utensils; 

/**
 * <pre>
 * This class wraps the arb_t type from the arblib module of the FLINT library
 * which represents a ball over the real numbers, that is, an interval m±r 
 * equivalently [m-r, m+r] where the midpoint m and the radius r are (extended) real
 * numbers and r is nonnegative (possibly infinite). The result of an
 * (approximate) operation done on arb_t variables is a ball which contains the
 * result of the (mathematically exact) operation applied to any choice of
 * points in the input balls. In general, the output ball is not the smallest
 * possible.
 * 
 * The precision parameter passed to each function roughly indicates the
 * precision to which calculations on the midpoint are carried out (operations
 * on the radius are always done using a fixed, small precision.)
 * 
 * For arithmetic operations, the precision parameter currently simply specifies
 * the precision of the corresponding arf_t operation. In the future, the
 * arithmetic might be made faster by incorporating sloppy rounding (typically
 * equivalent to a loss of 1 or 2 bits of effective working precision) when the
 * result is known to be inexact (while still propagating errors rigorously, of
 * course). Arithmetic operations done on exact input with exactly representable
 * output are always guaranteed to produce exact output.
 * 
 * For more complex operations, the precision parameter indicates a minimum
 * working precision (algorithms might allocate extra internal precision to
 * attempt to produce an output accurate to the requested number of bits,
 * especially when the required precision can be estimated easily, but this is
 * not generally required).
 * 
 * If the precision is increased and the inputs either are exact or are computed
 * with increased accuracy as well, the output should converge proportionally,
 * absent any bugs. The general intended strategy for using ball arithmetic is
 * to add a few guard bits, and then repeat the calculation as necessary with an
 * exponentially increasing number of guard bits (Ziv's strategy) until the
 * result is exact enough for one's purposes (typically the first attempt will
 * be successful).
 * 
 * The following balls with an infinite or NaN component are permitted, and may
 * be returned as output from functions.
 *
 * The ball ∞±c, where c is finite, represents the point at positive
 * infinity. Such a ball can always be replaced by ∞±0 while preserving
 * mathematical correctness (this is currently not done automatically by the
 * library). 
 * 
 * The ball -∞±c, where c is finite, represents the point at
 * negative infinity. Such a ball can always be replaced by -∞±0 while
 * preserving mathematical correctness (this is currently not done automatically
 * by the library). 
 * 
 * The ball c±∞, where c is finite or infinite, represents
 * the whole extended real line [-∞,+∞]. Such a ball can always be replaced by
 * 0±∞ while preserving mathematical correctness (this is currently not
 * done automatically by the library). 
 * 
 * Note that there is no way to represent a half-infinite interval such as [0,∞]. 
 * On the whole line ℝ, symmetry around 0 allows for a midpoint at 0 between -∞ 
 * and +∞. This concept doesn't apply to the half-line [0, ∞), where no finite 
 * midpoint exists between 0 and ∞ due to the absence of symmetry and the nature 
 * of ∞ as unbounded.
 * 
 * The ball NaN±c, where c is finite or infinite, represents an indeterminate 
 * value (the value could be any extended real number, or it could represent 
 * a function being evaluated outside its domain of definition, for example 
 * where the result would be complex). Such an indeterminate ball can always 
 * be replaced by NaN±∞ while preserving mathematical correctness (this is
 * currently not done automatically by the library).
 * </pre>
 * 
 * <pre>
 * Besides inheriting this tremendous functionality from arb, this class 
 * also implements multiple interfaces that give it capabilities like being 
 * part of a vector space, being lockable, and having a serializable representation.
 *
 * It also incorporates several mathematical operations like addition,
 * subtraction, multiplication, division, trigonometric operations, and complex
 * operations, along with utility operations like hashing, comparison,
 * normalization, covariance calculations, etc. It also handles uncertainties
 * and precision.
 *
 * The {@link Real} class provides the ability to generate random real numbers based on a
 * probability distribution function, calculate logarithmic values, manage the
 * variance and standard deviation, among other operations. It allows operations
 * at different levels of precision controlled by integer values.
 *
 * The class can also be resized and has several static functions to create new
 * instances.
 *
 * Instances of this class can be locked and unlocked; this means that by calling the 
 * this{@link #lock()} method, the region of memory pointed to this{@link #swigCPtr} will be marked
 * read-only at the kernel level by using the POSIX {@link arblib#mprotect(SWIGTYPE_p_void, long, int)}
 * function which will cause an access violation to occur if any process whatsoever
 * attempts to modify the variables value at that the memory level, completely bypassing any of Java's
 * notions of virtual machine yet interoperating with it perfectly. For this to work the 
 * {@link Real} must have been allocated with {@link Real#newAlignedVector(int)} and the bits of 
 * precision allocated must be no more than 128 but this is not asserted presently so as to avoid a this{@link #bits()} function call. The limit
 * of 128 bits exists because this is the maximum number of bits that can be stored in arblib's 
 * inline number format. Any greater than 128 and arblib stores a pointer to the numerical contents 
 * rather than the numerical contents itself. In principle it would be possible to use 
 * {@link arblib#mprotect(SWIGTYPE_p_void, long, int)} to prevent this secondary data from being modified, 
 * but it too would have to be allocated in such a way that it is aligned on a page boundary. The 
 * this{@link #unlock()} call restores the read/writeability by calling {@link arblib#mprotect(SWIGTYPE_p_void, long, int)} 
 * with the appropriate flags and this{@link #locked} can be called to test for locking without triggering 
 * an access violation.
 *
 * It also provides a way to interact with complex numbers with a subset of
 * operations. The class also includes facilities to manage an array of real
 * numbers, including methods for obtaining an iterator over the elements.
 *
 * The conversion of the instances to string for displaying purposes is handled
 * in a flexible way with the option to adjust the precision of the output. It
 * also includes functions to handle the overlap and containment scenarios.
 *
 * The class has fields to control its behavior like the dimension of the space,
 * the elements themselves, and the precision for printing, among others.
 * 
 * Finally, it includes methods to get the size of the memory allocated for the
 * object and clean up the resources used by the instance.
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}
%typemap(javacode) arb_struct %{
  private static final long serialVersionUID = 1L;

  static { System.loadLibrary( "arblib" ); }

  public Real(Arena arena)
  {
    this(arena.allocate(Real.BYTES).address(),
         false);
  }
  
  public Fraction sub(Fraction subtrahend, int bits, Fraction res)
  {
    return res.set(this).sub(subtrahend,bits,res);
  }

  /**
   * 
   * @param bits
   * @param value
   * @return this{@link #lnΓ(int, Real)}
   */
  public Real
         logΓ(int bits,
              Real value)
  {
    return lnΓ(bits, value);
  }

  public Fraction sub(Integer a, int bits, Fraction res)
  {
    return res.set(this).sub(a,bits,res);
  }
  
  
  public Real sub(Fraction a, int bits, Real res)
  {
    return res.set(this).sub(a,bits,res);
  }
  
  public RationalFunction mul(RationalFunction that, int prec, RationalFunction res)
  {
    return res.set(this).mul(that,prec);
  }
    
  /**
   * Calculate the ascending factorial this_(power)
   * 
   * @param power
   * @param bits
   * @param result
   * @return
   */
  public Complex ascendingFactorial(Integer power, int bits, Complex result)
  {
    assert power.getSignedValue() >= 0 : "power must be nonnegative";
    arblib.arb_hypgeom_rising_ui(result.re(), this, power.getUnsignedValue(), bits);
    result.im().zero();
    result.bits = bits;
    return result;
  }

  public Real one()
  {
    arblib.arb_one(this);
    return this;
  }

  public Complex log(int prec, Complex res)
  {
    return res.set(this).log(prec);
  }
      
  /**
   * 
   * @param mag
   * @return {@link arblib#arb_get_mag(Magnitude, Real)}
   */
  public Magnitude getMagnitude(Magnitude mag)
  {
    arb_get_mag(mag, this);
    return mag;
  }

  public RealPolynomial sub(Integer a, int bits, RealPolynomial res)
  {
    res.fitLength(1);
    res.set(1);
    sub(a,bits,res.get(0));
    return res;
  }  
  
  /**
   * <pre>
   * Calls this{@link #close()} and then replaces this{@link #elements},
   * this{@link #swigCPtr}, this{@link #swigCMemOwn}, and this{@link #dim} with
   * new values. This is different from this{@link #set(Real)} or
   * this{@link #set(Real...)} because those methods do not change the pointers to
   * that of its input but copies by value instead. Also sets
   * that{@link #swigCMemOwn} to false since this {@link Real}s {@link #close()}
   * method now frees the memory instead of the {@link #close()} method of that
   * 
   * The `become` method fuctions metaphorically like the Terminator T-1000 as it
   * took on the form of a person in the classic movie scene. In this case, the
   * `Real` object `this` absorbs all the properties and state of another `Real`
   * object `that`, effectively transforming into it.
   * 
   * Just as the T-1000 assumes the physical appearance and characteristics of its
   * target, the `become` method copies the internal data pointers and state of
   * `that` into `this`. Moreover, by setting `that.swigCMemOwn` to false, it
   * ensures that `that` will no longer assume the responsibility of freeing the
   * memory when its {@link #close()} method is called, much like the target no
   * longer retaining their form once the T-1000 transforms into them.
   * 
   * This approach ensures that the original object (`this`) now fully embodies
   * the other object (`that`).
   * </pre>
   * 
   * @param that
   * @return this after becoming that
   */
  public Real become(Real that)
  {
    close();
    elements         = that.elements;
    swigCPtr         = that.swigCPtr;
    swigCMemOwn      = that.swigCMemOwn;
    dim              = that.dim;
    name             = that.name;
    that.swigCMemOwn = false;
    return this;
  }
    
  /**
   * NOTICE: this is 1-indexed, not 0 indexed like this{@link #get(int)} !!!
   * 
   * @param k
   * @return
   */
  public Real get(Integer k)
  {
    return get(k.getSignedValue() - 1);
  }

  public RealPolynomial div(RealPolynomial a, int bits, RealPolynomial res)
  {
    return res.set(this).div(a, bits, res);
  }
  
  public static Predicate<Real> isNegativeInteger       = αᵢ ->
                                                        {

                                                          Real α = (Real) αᵢ;
                                                          return α.isInteger() && α.isNegative();

                                                        };

  public static Predicate<Real> isNegativeIntegerOrZero = isNegativeInteger.or(αᵢ ->
                                                        {

                                                          Real α = (Real) αᵢ;
                                                          return α.isInteger() && (α.isNegative()
                                                                        || α.isZero());

                                                        });

  public RealPolynomial mul(RealPolynomial a, int bits, RealPolynomial res)
  {
    return a.mul(this, bits, res);
  }

  public Real mul(Real x, int bits)
  {
    return mul(x, bits, this);
  }

  public RealPolynomial sub(RealPolynomial that, int prec, RealPolynomial result)
  {
    return result.set(this).sub(that, prec);
  }
  
  public ComplexPolynomial sub(ComplexPolynomial that, int prec, ComplexPolynomial result)
  {
    return result.set(this).sub(that, prec);
  }  
        
  public Real factorial(int bits, Real result)
  {
    assert isInteger() : this + " is not an integer";  
    try ( Integer intVal = integerValue(new Integer()))
    {
      return intVal.factorial(bits, result);
    }
  }

  public Integer integerValue(Integer integer)
  {
    assert swigCPtr != 0 : "this=null pointer";
    assert integer.swigCPtr != 0 : "argument has a null pointer";
    arblib.arb_get_unique_fmpz(integer.swigCPtr, this);
    return integer;
  }

  public Real gamma(int bits)
  {
    return Γ(bits, this);
  }
    
  public Real Γ(int bits)
  {
    return Γ(bits, this);
  }

  public static Real newVector(double... vals)
  {
    Real vec = Real.newVector(vals.length);
    vec.set(vals);
    return vec;
  }

  public static Real newVector(String name, double... vals)
  {
    Real vec = Real.newVector(vals.length);
    vec.setName(name);
    vec.set(vals);
    return vec;
  }  
  
  /**
   * Calculate the ascending factorial this_(power)
   * 
   * @param power
   * @param bits
   * @param result
   * @return
   */
  public Real ascendingFactorial(long power, int bits, Real result)
  {
    arblib.arb_hypgeom_rising_ui(result, this, power, bits);
    result.bits = bits;    
    return result;
  }

  /**
   * Calculate the ascending factorial this_(power)
   * 
   * @param power
   * @param bits
   * @param result
   * @return
   */
  public Real ascendingFactorial(Integer power, int bits, Real result)
  {
    assert power.getSignedValue() >= 0 : "power must be nonnegative";
    arblib.arb_hypgeom_rising_ui(result, this, power.getUnsignedValue(), bits);
    result.bits = bits;
    return result;
  }

  /**
   * Calculate the ascending factorial this_(power)
   * 
   * @param power
   * @param bits
   * @param result
   * @return
   */
  public RationalFunction ascendingFactorial(Integer power, int bits, RationalFunction result)
  {
    try ( Real tmp = new Real())
    {
      ascendingFactorial(power, bits, tmp);
      return result.set(tmp);
    }
  }
  
  public RationalFunction div(RationalFunction unit, int bits, RationalFunction result )
  {
    assert bits > 0;
    result.set(this);
    return result.div(unit, bits);
  }
    
  /**
   * Calculate the ascending factorial this_(power)
   * 
   * @param power
   * @param bits
   * @param result
   * @return
   */
  public Real ascendingFactorial(Real power, int bits, Real result)
  {
    assert result != null : "result shan't be null, but it is";
    arblib.arb_hypgeom_rising(result, this, power, bits);
    result.bits = bits;
    return result; 
  }

  
  public RealPolynomial ascendingFactorial(Integer n, int bits, RealPolynomial result)
  {
    assert result != null : "result shan't be null, but it is";  
    result.set(1);
    ascendingFactorial(n, bits, result.get(0));
    result.bits = bits;
    return result;
  }
  
  public RealPolynomial div(Real divisor, int bits, RealPolynomial result)
  {
    result.bits = bits;
    return result.set(this).div(divisor,bits);
  }
  
  public boolean isInteger()
  {
    return arblib.arb_is_int(this) != 0;
  }

  public Integer getInteger(Integer result)
  {
    arblib.arb_get_unique_fmpz(result.swigCPtr, this);
    return result;
  }


  @Override
  public Real additiveIdentity()
  {
    return set(RealConstants.zero);
  }

  @Override
  public Real multiplicativeIdentity()
  {
    return set(RealConstants.one);
  }
  
  public Real div(Integer operand, int prec)
  {
     return div(operand,prec,this);
  }
    
  public Real div(Integer operand, int prec, Real result)
  {
    arblib.arb_div_fmpz(result, this, operand.swigCPtr, prec );
    result.bits = prec;
    return result;
  }

  public Real tanh(int bits)
  {
    this.bits = bits;
    return tanh(bits, this);
  }
  
  public RealPolynomial add(RealPolynomial a, int bits, RealPolynomial res)
  {
    res.set(a);
    Real x = res.getCoeffs().get(0);
    x.add(this,bits);
    x.bits = bits;
    return res;
  }

  public static Real of(String string, int bits)
  {
    return new Real(string,bits);
  }

  public Real
         set(Fraction fraction,
             int bits)
  {
    assert dim == fraction.dim : String.format("this,dim = %d != fraction.dim = %d",
                                               this,
                                               fraction);
    if ( dim == 1 )
    {
    arblib.arb_set_fmpq(this,
                        fraction,
                        bits);
    }
    else
    {
      for ( int i = 0; i < dim; i++ )
      {
        get(i).set(fraction.get(i));
      }
    }
    return this;
  }
  
  public Real set(Fraction fraction)
  {
    return set(fraction,bits);
  }
  
  public RationalFunction sub(RationalFunction operand, int bits, RationalFunction result)
  {
    return result.set(this).sub(operand,bits,result);
  }
  
  public RealPolynomial sub(Real a, int bits, RealPolynomial res)
  {
    res.set(a);
    res.getCoeffs().get(0).sub(this,bits);
    return res;
  }
 
  public Real add( Integer z, int bits, Real result )
  {
    arblib.arb_add_fmpz(result, this, z.swigCPtr, bits);
    return result;
  }
  
  public Real pow( Integer i, int bits, Real result )
  {
    arblib.arb_pow_fmpz(result, this, i.swigCPtr, bits);
    return result;
  }
  
  @Override
  public Real apply(int value)
  {
    return get(value);
  }

  public Real mul(Integer operand, int prec)
  {
    return mul(operand, prec, this);
  }

  public Real mul(Integer operand, int prec, Real result)
  {
    arblib.arb_mul_fmpz(result, this, operand.swigCPtr, prec);
    return result;
  }
 
 /**
   * @see arblib#arb_asin(Real, Real, int)
   * @param prec
   * @param result
   * @return
   */
  public Real arcsin(int prec, Real result )
  {
    arblib.arb_asin(result, this, prec );
    return result;
  }
  
  public Real pow(Integer operand, int prec)
  {
    return pow(operand,prec,this);
  }

  public Real add(Integer operand, int prec)
  {
    return add(operand, prec, this);
  }
  
  /**
   * @see arblib#acb_dirichlet_hardy_z(Complex, Complex, DirichletGroup,
   *      DirichletCharacter, int, int)
   *      
   * @param bits
   * @param result
   * @return
   */
  public Real Z(int bits, Real result)
  {
    try ( Complex z = new Complex())
    {
      z.re().set(this);
      arblib.acb_dirichlet_hardy_z(z, z, null, null, 1, bits);
      return result.set(z.re());
    }
  }
  
  public Real set(Integer integer)
  {
    arblib.arb_set_fmpz(this, integer.swigCPtr);
    return this;
  }
    
  public Real sub( Integer z, int bits, Real result )
  {
    arblib.arb_sub_fmpz(result, this, z.swigCPtr, bits);
    return result;
  }
  
  public Real sub(Integer operand, int prec)
  {
    return sub(operand,prec,this);  
  }  
  
  /**
   * 
   * @return {@link arb#arb_is_exact(Real)} != 0
   */
  public boolean isExact()
  {
    return arblib.arb_is_exact(this) != 0;
  }
  
  /**
   * Binomial coefficient. 
   * 
   * The number of ways of choosing k out of this items in no particular order
   * 
   * @param k
   * @param bits
   * @return this
   */
  public Real C( int k, int bits )
  {
    return C(k,bits,this);
  }
  
  /**
   * Binomial coefficient. 
   * 
   * this choose k
   * 
   * @param k
   * @param bits
   * @param result
   * @return
   */
  public Real C( int k, int bits, Real result )
  {
    arblib.arb_bin_ui(result, this, k, bits);
    return result;
  }
    
  /**
   * Bessel function of the first kind
   * 
   * @see arb#arb_hypgeom_bessel_j(Real, Real, Real, int)
   * 
   * @param t
   * @param order
   * @param bits
   * @param result
   * @return result
   */
  public Real BesselJ(Real order, int bits, Real result)
  {
    arblib.arb_hypgeom_bessel_j(result, order, this, bits);
    return result;
  }

  /**
   * Bessel function of the first kind of order zero, see
   * this{@link #BesselJ(Real, Real, int, Real)}
   * 
   * @param t
   * @param bits
   * @param result
   * @return
   */
  public Real J0(int bits, Real result)
  {
    return BesselJ(zero, bits, result);
  }
    
  public Real gammaVariance(int n, int prec, Real result)
  {
    if (n == 0)
    {
      return result.zero();
    }

    try ( Real unshiftedSlice = slice(0, dim-n); Real shiftedSlice = shift(n);
          Real y = unshiftedSlice.sub(shiftedSlice, prec, Real.newVector(dim - n)))
    {
      Real pow = y.pow(2, prec);
      Real sum = pow.sum(prec, result);
      Real div = sum.div(dim - n, prec, result);
      return div;
    }
  }
  
 /**
   * Calculate the empirical (variance) structure function, also known as a variogram:
   *
   * <|Z(i+n)-Z(i)|^2>
   *
   * @param n number of shifts to calculate
   
   * @param bits
   * @param Result
   * @return a vector of n {@link Real} γ-variances calculated via
   *         this{@link #γVariance(int, int, Real)} for each finite shift from 0
   *         to n-1
   */
  public Real structure(int n, int bits, Real result)
  {
    IntStream.range(0, n).parallel().forEach(i -> gammaVariance(i, bits, result.get(i)));
    return result;
  }
  
  /**
   * Shortcut for this{@link #structure(int, int)} which allocates a new
   * {@link Real} vector with {@link Real#newVector(int)}
   * 
   * @param n
   * @param bits
   * @return this{@link #structure(int, int)}
   */
  public Real structure(int n, int bits)
  {
    return structure(n, bits, Real.newVector(n, "γ"));
  }  
  
  /**
   * A this{@link #slice(int, int)} of this array of {@link Real}s from the n-th
   * element to the last
   * 
   * @param n how many elements to skip
   * @return a subset of this vector of length dim-n
   */
  public Real shift(int n)
  {
    return slice(n, dim );
  }
  
  /**
   * Sets u to an upper bound for the absolute value of x via
   * {@link arb#arb_get_mag(Magnitude, Real)}
   *
   * 
   * @param upperBound the {@link Magnitude} to be assigned the result
   * @return upperBound after it has been assigned the return value
   */
  public Magnitude absUpperBound(Magnitude upperBound)
  {
    arblib.arb_get_mag(upperBound, this);
    return upperBound;
  }
  
  /**
   * 
   * @return a clone of this
   */
  public Real copy()
  {
    Real copy = Real.newVector(dim, name);
    for (int i = 0; i < copy.dim; i++)
    {
      copy.get(i).set(get(i));
    }
    return copy;
  }

  /**
   * A variable-argument assignment-from-{@link Double} functions that uses
   * {@link Real#set(double)} for each eleent in order
   * 
   * 
   * @param d
   * @return this
   */
  public Real set(double... d)
  {
    assert dim == d.length : "this.dim=" + dim + " != d.length=" + d.length;
    for (int i = 0; i < d.length; i++)
    {
      get(i).set(d[i]);
    }
    return this;
  }
  
  @Override
  public Real clone()
  {
    return copy();
  }
 
  public static Real newVector( int dim, String vecName  )
  {
    Real array = arblib._arb_vec_init(dim);    
    array.swigCMemOwn = true;    
    array.elements = new Real[array.dim = dim];
    array.name = vecName;
    return array;
  }


  public static Real valueOf(int d)
  {
    Real real = new Real();
    real.set(d);
    return real;
  }
  
  public static Real valueOf(double d)
  {
    Real real = new Real();
    real.set(d);
    return real;
  }
  

    
  /**
   * Swap the two elements
   * 
   * @param i
   * @param j
   * @return
   */
  public Real swap(int i, int j)
  {
    return get(i).swap(get(j));
  }

  
  /**
   * multiply this by the imaginary unit
   * @param bits 
   * @param result
   * 
   * @return this*i where i=√(-1)
   */
  public Complex muli(int bits, Complex result)
  {
    return ComplexConstants.ⅈ.mul(this, bits, result );
  }

  public Real(Collection<Real> elements)
  {
    this(elements.stream());
  }

  public Real(Real... elements)
  {
    this.elements    = elements;
    this.dim         = elements.length;
    this.swigCMemOwn = false;
    this.swigCPtr    = 0;
  }

  public Real(Stream<Real> elements)
  {
    List<Real> list  = elements.toList();
    become(Real.newVector(list.size()));
    assert dim == list.size();
    for ( int i = 0; i < dim; i++ )
    {
      set(i,list.get(i));
    }
  }
    
  public Real(Real _z)
  {
    this();
    set(_z);
  }

  public Real sinh(int prec, Real result)
  {
    arblib.arb_sinh(result, this, prec);
    return result;
  }
  
  public Real cosh(int prec, Real result)
  {
    arblib.arb_cosh(result, this, prec);
    return result;

  }
  
  public Real mul2e(int i)
  {
    return mul2e(i, this);
  }
  
  @Override
  public int hashCode()
  {
    return Objects.hash(doubleValue());
  }
  
  public Real set(Real... elements)
  {
    clear();
    this.elements    = elements;
    this.dim         = elements.length;
    this.swigCMemOwn = false;
    this.swigCPtr    = 0;
    return this;
  }
    
  public Real normalize(int prec)
  {
    return normalize(prec,this);
  }
  
  /**
   * Divides the elements of this by the standard deviation
   * 
   * @param prec
   * @param result
   * @return this / this{@link #standardDeviation(int, Real)}
   */
  public Real normalize(int prec, Real result)
  {
    try ( Real σ = standardDeviation(prec, new Real() ))
    {
      for (int i = 0; i < dim; i++)
      {
        get(i).div(σ, prec, result.get(i));
      }
      return result;
    }
  }

  public boolean equals( int i )
  {
    return arblib.arb_equal_si(this, i) != 0;
  }
  
  /*
   * The covariance of x and y is Σ(x[i]-x̄)*(y[i]-ȳ),i=1..dim) where x̄ denotes 
   * the this{@link #mean(int, Field)}
   * 
   * @param that
   * @param prec
   * @param res
   * @return the covariance of this and that
   */
  public Real covariance(Real that, int prec, Real res)
  {
    assert dim == that.dim;
    try ( Real a = mean(prec, new Real()); 
          Real b = that.mean(prec, new Real());
          Real aCentered = subScalar(a, prec, Real.newVector(dim));
          Real bCentered = that.subScalar(b, prec, Real.newVector(dim)))
    {
      return aCentered.dotProduct(bCentered, prec, res).div(dim, prec);
    }
  }
  
  /**
   * Subtract a scalar from each element of this vector
   * 
   * @param a      scalar (single real value, only element 0 is used, it is NOT
   *               treated as a vector)
   * @param prec
   * @param result
   * @return newVector=this-a where a is a scalar subtracted from each element of
   *         this
   */
  public Real subScalar(Real a, int prec, Real result)
  {
    assert dim == result.dim;
    for (int i = 0; i < dim; i++)
    {
      get(i).sub(a, prec, result.get(i));
    }
    return result;
  }

  public Real vecNegate(Real res)
  {
    arblib._arb_vec_neg(res, this, dim);
    return res;
  }
    
  /**
   * Calls {@link arblibJNI#mprotect(long, long, int)} with
   * {@link Protections#PROT_READ} only so that the contents become immutable. Any
   * code that attmpets to change the variable will trigger a segfault
   * @return 
   */
  @Override
  public Real lock()
  {
    assert swigCPtr % PAGESIZE == 0 : "swigCPtr does not point to a page-aligned buffer";
    int status = arblibJNI.mprotect(swigCPtr, BYTES * dim, Protections.PROT_READ.bitfield);
    assert status == 0 : "mprotect call failed. errno=" + arblib.errorNumber();
    locked = true;
    return this;
  }

  /**
   * Calls {@link arblibJNI#mprotect(long, long, int)} with
   * {@link Protections#PROT_READ} and {@link Protections#PROT_WRITE} so that the contents 
   * become mutable again
   */
  @Override
  public Real unlock()
  {
    int status = arblibJNI.mprotect(swigCPtr,
                                 BYTES * dim,
                                 Protections.PROT_READ.bitfield | Protections.PROT_WRITE.bitfield);
    assert status == 0 : "mprotect call failed. errno=" + arblib.errorNumber();
    locked = false;
    return this;
  }

  boolean locked = false;
  
  @Override
  public boolean locked()
  {
    return locked;
  }
  
  /**
   * @see {@link Real#log(int, Real)}
   * 
   * @param prec
   * @return log(prec,this)
   */
  public Real log(int prec)
  {
    return log(prec, this);
  }
  
  public Real add(Fraction addend, int bits)
  {
    return add(addend,bits,this);
  }
    
  public Real add( Fraction addend, int bits, Real result )
  {
    return addend.add(this,bits,result);
  }  
  
  public Real add(Real addend, int prec)
  {
    return add(addend, prec, this);
  }  
    
  /**
   * Self-referencing this{@link #add(int, int, Real)}
   * 
   * @param i
   * @param prec
   * @return
   */
  public Real add(int i, int prec)
  {
    return add(i, prec, this);
  }

  public Real sub(int x, int prec, Real res)
  {
    arblib.arb_sub_si(res, this, x, prec);
    return res;
  }

  /**
   * Add an integer to this
   * 
   * @param d    possibly signed integer to add
   * @param prec precision
   * @param res  where to store the result
   * @return the result of the addition
   */
  public Real add(int x, int prec, Real res)
  {
    arblib.arb_add_si(res, this, x, prec);
    return res;
  }
  
  public Real sub(int i, int prec)
  {
    return sub(i,prec,this);
  }
  
  public Real variance(int prec, Real result)
  {
    try ( Real mean = new Real())
    {
      return variance(prec, mean(prec, mean), result);
    }
  }

  public Real variance(int prec, Real mean, Real result)
  {
    result.zero();
    try ( Real x = new Real(); )
    {
      // TODO: use the vectorized arb fuctions if the elements are contiguous in memory
      for (Real element : this)
      {	    
        result.add( element.sub(mean, prec, x).pow(2, prec), prec );
      }
    }
    return result.div(dim, prec);
  }
  
  public Real standardDeviation(int prec, Real result)
  {
    try ( Real mean = new Real())
    {
      return standardDeviation(prec, mean(prec, mean), result);
    }  
  }
  
  public Real standardDeviation(int prec, Real mean, Real result)
  {
    return variance(prec, mean, result).sqrt(prec);
  }
  
 
  @Override
  public int dim()
  {
    return dim;    
  }

  public Stream<Real> stream()
  {
    return StreamSupport.stream(Spliterators.spliterator(iterator(), dim, Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }
  
  public Real abs()
  {
    return abs(this);
  }
  
  @Override
  public RealIterator iterator()
  {
    return new RealIterator(this);
  }
  
  /**
    * Copy constructor
    */
  public Real(Float div, Magnitude mag)
  {
    this();
    setMid(div);
    setRad(mag);
  }

  public Real pow(int i, int prec)
  {
    return pow(i,prec,this);
  }

  public int bits = 128;

  public Real(String string, int prec)
  {
    this();
    set(string, prec);
    bits = prec;
  }
  
  public Real log(int prec, Real res)
  {
    arblib.arb_log(res, this, prec);
    res.bits = prec;
    return res;    
  }
  
  public Real mul2e( int e, Real res )
  {
    arb_mul_2exp_si(res, this, e);
    return res;
  }

  /**
   * Calls {@link arblib#flint_realloc(SWIGTYPE_p_void, long)} and also allocate a
   * new this{@link #elements} array and copy the contents from the existing one
   * if any
   * 
   * @param alloc
   * @return this
   */
  public Real resize(int alloc)
  {
    swigCPtr = SWIGTYPE_p_void.getCPtr(arblib.flint_realloc(new SWIGTYPE_p_void(swigCPtr,
                                                                                false),
                                                            2 * (long) alloc * Real.BYTES));
    Real newElements[] = new Real[alloc];
    if (elements != null)
    {
      System.arraycopy(elements, 0, newElements, 0, Math.min(alloc, dim));
    }
    this.dim = alloc;
    elements = newElements;
    return this;
  }

  public Real abs(int prec, Real w)
  {
    arblib.arb_abs(w, this);
    bits = prec;
    return w;
  }
  
  /**
   * Computes the (Normal Gaussian) error function using an automatic algorithm
   * choice. If z is too small to use the asymptotic expansion, a working
   * precision sufficient to circumvent cancellation in the hypergeometric series
   * is determined automatically, and a bound for the propagated error is computed
   * with acb_hypgeom_erf_propagated_error().
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erf(Real, Real, int)}
   */
  public Real erf(int prec, Real res)
  {
    arblib.arb_hypgeom_erf(res, this, prec);
    bits = prec;
    return res;
  }

  /**
   * Computes the complementary (Normal Gaussian) error function  1-this{@link #erf(int, Real)}
   * whilst avoiding the catastrophic cancellation for large positive z.
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erf(Real, Real, int)}
   */
  public Real erfc(int prec, Real res)
  {
    arblib.arb_hypgeom_erfc(res, this, prec);
    bits = prec;
    return res;
  }
    
 /**
   * The inverse of this{@link #erf(int, Real)}
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erfinv(Real, Real, int)}
   */
  public Real erfinv(int prec, Real res)
  {
    arblib.arb_hypgeom_erfinv(res, this, prec);
    bits = prec;
    return res;
  }

  /**
   * The inverse of this{@link #erfc(int, Real)}
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_ercfinv(Real, Real, int)}
   */
  public Real erfcinv(int prec, Real res)
  {
    arblib.arb_hypgeom_erfcinv(res, this, prec);
    bits = prec;
    return res;
  }
      
  public Complex div(Complex divisor, int prec, Complex w)
  {  
    return mul( divisor.inv(prec, w), prec, w );   
  }
  
  public Real sech(int prec, Real w)
  {
    arblib.arb_sech(w, this, prec);
    return w;
  }
  
  public Complex sub(Complex subtrahend, int prec, Complex res)
  {
    assert subtrahend != null : "subtrahend is null";
    arblib.acb_sub_arb(res, subtrahend, this, prec);
    return res;
  }
  
  public Complex add(Complex addend, int prec, Complex res)
  {
  	assert addend != null : "addend is null";
    arblib.acb_add_arb(res, addend, this, prec);
    return res;
  }
  
  /**
   * Adds the magnitude to the radius of this 
   * 
   * @param err
   * @return
   */
  public Real addUncertainty(Magnitude err)
  {
    arblib.arb_add_error_mag(this, err);
    return this;
  }
  
  public Real clear()
  {
    if ( swigCMemOwn )
    {
      swigCMemOwn = false;    
      for ( int i = 0; i < dim; i++ )
      {
        get(i).clear();
      }
    }
    return this;
  }
    
  /**
   * Compares the midpoint of this to another Real, disregarding the uncertainty
   * radius if they are not equal. If they are equal, then compare the radius
   */
  @Override
  public int compareTo(Real o)
  {
    int cmp = getMid().compareTo(o.getMid());
    if ( cmp == 0 )
    {
      cmp = getRad().compareTo(o.getRad());
    }
    return cmp;
  }
  
  public Real set(int i)
  {
    arblib.arb_set_si(this, i);;
    return this;
  }

  public Real exp(int prec, Real res)
  {
    arblib.arb_exp(res, this, prec);
    return res;
  }

  @Override
  public boolean equals(Object obj)
  {
    if ( !(obj instanceof Real))
    {
      return false;
    }
    Real that = (Real)obj;
    if ( dim != that.dim )
    {
      return false;
    }
    for ( int i = 0; i < dim; i++ )
    {
      if ( arblib.arb_equal(get(i), that.get(i)) == 0 )
      {
        return false;
      }
    }
    return true;
  }
  
  /**
   * 
   * @param prec
   * @param interval
   * @return {@link arb#arb_get_interval_arf(Float, Float, Real, int)
   */
  public FloatInterval getInterval(int prec, FloatInterval interval)
  {
    arblib.arb_get_interval_arf(interval.getA(), interval.getB(), this, prec);
    return interval;
  }
  
  /**
   * @return {@link arb#arb_allocated_bytes(Real)}
   */
  public int getAllocatedBytes()
  {
    return arblib.arb_allocated_bytes(this);
  }

  /**
   *  
   * @return -this
   */  
  public Real neg()
  {
    return neg(this);
  }

  /**
   * 
   * @param value variable to be assigned the resulting value
   * @return value=-this
   */
  public Real neg(Real value)
  {
    arblib.arb_neg(value, this);
    return value;
  }
    
  public Real sqrt( int prec )  
  {
    return sqrt(prec,this);
  }
  
  public Real sqrt(int prec, Real res)
  {
    arblib.arb_sqrt(res, this, prec);
    this.bits = prec;
    return res;
  }

  /**
   * @see arb#arb_addmul(Real, Real, Real, int)
   * @param that
   * @param prec
   * @param result
   * @return result = result + this * that
   */
  public Real addmul(Real that, int prec, Real result)
  {
    assert that != null : "operand is null";
    arblib.arb_addmul(result, this, that, prec);
    result.bits = prec;
    return result;
  }
  
  public boolean isFinite()
  {
    return arblib.arb_is_finite(this) != 0;
  }

  public Integer floor(int prec, Integer res)
  {
    try ( Real tmp = new Real();)
    {
      arblib.arb_floor(tmp, this, prec);
      assert tmp.isInteger() : "floor " + tmp + " isnt an integer?!";
      tmp.getInteger(res);
      return res;
    }
  }
  
  public Real floor( int prec, Real res )
  {
    arblib.arb_floor( res, this, prec );
    res.bits = prec;
    return res;
  }

  public Real ceil( int prec, Real res )
  {
    arblib.arb_ceil( res, this, prec );
    res.bits = prec;
    return res;
  }
 
  /**
   * @return this after calling arb#arb_indeterminate(Real)
   */
  public Real indeterminate()
  {
    arb_indeterminate(this);
    return this;
  }
 
  public Real frac(int prec, Real res)
  {
    try (Real f = new Real() )
    {
      return sub(floor(prec, f), prec, res);
    }
  }
 
   public int dim = 1;
  
  public int size()
  {
    return dim;
  }
 
  public Real slice(int startInclusive, int endExclusive)
  {
    int sliceDim = endExclusive - startInclusive;
    assert startInclusive <= dim && startInclusive <= endExclusive
                  && endExclusive <= dim : String.format("startInclusive=%d < endExclusive=%d\n",
                                                         startInclusive,
                                                         endExclusive);

    Real array = new Real(swigCPtr + startInclusive * BYTES,
                          false);
    array.elements = new Real[array.dim = sliceDim];
    return array;
  }
     
  public static Real newAlignedVectorViaAllocativeNative(int size)
  {

    Real x = new Real(0,
                      false);
    x.nativeSegment = arena.allocate(Real.BYTES * size, arblib.getpagesize());
    x.swigCPtr      = x.nativeSegment.address();
    x.dim           = size;
    x.elements      = new Real[x.dim];
    for (int j = 0; j < x.dim; j++)
    {
      Real y = x.elements[j] = new Real(x.swigCPtr + (Real.BYTES * j),
                                        false);
      y.init();
    }
    return x;
  }
  
  public static Arena  arena = Arena.ofAuto();
  public MemorySegment nativeSegment;
         
  /**
   * Construct a new {@link Real} aligned on a page boundary so that this can be
   * this{@link #lock()}ed by invoking the
   * {@link arblibJNI#mprotect(long, long, int)} method. 
   * 
   * TODO: use
   * {@link MemorySegment#allocateNative(java.lang.foreign.MemoryLayout, java.lang.foreign.MemorySession)}
   * instead of {@link arblibJNI#memalign(long, long)}
   * 
   * @param size
   * @return
   */
  public static Real newAlignedVector(int size)
  {
    // Calculate the size aligned to the page boundary
    int  bytes   = (int) ((size * Real.BYTES + PAGESIZE - 1) / PAGESIZE * PAGESIZE);

    long pointer = arblibJNI.memalign(PAGESIZE, bytes);
    arblibJNI.memset(pointer, 0, bytes);
    Real x = new Real(pointer,
                      true);

    // Calculate the actual number of elements that can fit in the aligned buffer
    // int actualSize = alignedSize / Real.BYTES;

    x.elements = new Real[x.dim = size];
    for (int j = 0; j < size; j++)
    {
      Real y = x.elements[j] = new Real(pointer + (Real.BYTES * j),
                                        false);
      y.init();
    }
    return x;
  }
       
  public static Real newVector( int dim )
  {
    Real array = arblib._arb_vec_init(dim);    
    array.swigCMemOwn = true;    
    array.dim = dim;
    array.elements = new Real[array.dim = dim];
    return array;
  }
 
  public Real cos(int prec, Real result )
  {
    arblib.arb_cos(result, this, prec );
    return result;
  }

  public Real sin(int prec, Real result )
  {
    arblib.arb_sin(result, this, prec );
    return result;
  }
 
  @Override
  public Real mul(int i, int prec, Real res)
  {
    arblib.arb_mul_si(res, this, i, prec);
    return res;
  }
 
  public Complex mul(Complex exp, int prec, Complex r)
  {
    arblib.acb_mul_arb(r, exp, this, prec );
    return r;
  }
  
  public Real tanh(int prec, Real result )
  {   
    arblib.arb_tanh(result, this, prec );
    return result;
  }
  
  public Real swap(Real u)
  {
    arblib.arb_swap(this, u);
    return this;
  }

  @Override
  public Real div(Real that, int prec, Real res)
  {
    assert dim == that.dim;
    if (dim != res.dim)
    {
      res.become(Real.newVector(dim));
    }
    for (int i = 0; i < dim; i++)
    {
      arblib.arb_div(res.get(i), this.get(i), that.get(i), prec);
    }
    bits = prec;
    return res;
  }

  /**
   * Calls this{@link #div(int, int)} with bits=this{@link #bits()}
   * 
   * @param i
   * @return this
   */
  public Real div(int i)
  {
    return div(i, bits);
  }
    

  public int relAccuracyBits()
  {
   return arblib.arb_rel_accuracy_bits(this);
  }

  public Real sub(Real that, int prec, Real res)
  {
    assert dim == that.dim;
    if ( dim != res.dim )
    {
      res.become( Real.newVector(dim) );
    }
    for (int i = 0; i < dim; i++)
    {
      arblib.arb_sub(res.get(i), this.get(i), that.get(i), prec );
    }
    bits = prec;
    return res;
  }

  public static final int BYTES = Float.BYTES + Magnitude.BYTES;

  public Real setIntervalMagnitude( Magnitude a, Magnitude b, int prec )
  {
    arblib.arb_set_interval_mag(this, a, b, prec);
    bits = prec;
    return this;
  }
    
  public Real π( int prec )
  {
    arblib.arb_const_pi(this, prec);
    bits = prec;
    return this;
  }
  
  public Real init()
  {
    arblib.arb_init(this);
    return this;
  }
  
  /**
   * Return this field to the cycloid of non-existence from which it came by calling this{@link #clear()}
   */
  @Override
  public void close() 
  { 
    if ( locked )
    {
      unlock();
    }
    clear();
  }

 public Real add(Real that, int prec, Real res)
  {
    assert dim == that.dim;
    if (dim != res.dim)
    {
      res.become(Real.newVector(dim));
    }
    for (int i = 0; i < dim; i++)
    {
      arblib.arb_add(res.get(i), this.get(i), that.get(i), prec);
    }
    bits = prec;
    return res;
  }
  
  public Real[] elements;
  
  public Real get(int index)
  {
    assert index < dim : String.format("index = %d >= dim = %d", index, dim);
    if (index == 0 && dim == 1 && elements == null)
    {
      return this;
    }
    if ( elements == null )
    {
      elements = new Real[dim];
    }
    Real element = elements[index];
    if (element == null)
    {
      element = elements[index] = new Real(swigCPtr + index * Real.BYTES,
                                           false);
    }
    return element;
  }
  
  public Real set(int index, Real element )
  {
    assert index < dim : String.format("index = %d >= dim = %d", index, dim);
    if (index == 0 && dim == 1)
    {
      return set(element);
    }
    return elements[index] = element;
  }  
   
  public String toFixedString()
  {
    StringBuilder sb = new StringBuilder();
    sb.append("[");
    for (int i = 0; i < dim; i++)
    {
      if ( i > 0 )
      {
        if ( dim > 3 )
        {
          sb.append(",\n ");
        }
        else
        {
          sb.append(", ");          
        }
      }
      sb.append(String.format("%010.010f", get(i).doubleValue() ) );
    }
    sb.append("]");
    return sb.toString();
  }
  
  public String toString()
  {
    return ( name == null ? "" : name + "=" ) + toString(digits());
  }

  public String name;
    
  public int digits()
  {
   return 20;
  }  
 
  
  public boolean  printPrecision = true;
    
  public String toString(int digits)
  {
    return toString(digits, printPrecision);
  }

  public String toString(int digits, boolean precise)
  {
    if (dim == 1 && elements == null )
    {
      return Utensils.removeTrailingZeros(arblib.arb_get_str(this, digits, (printPrecision || precise) ? 0 : 2)
                                         .replace("[", "")
                                         .replace("]", ""));
    }
    else
    {
      StringBuilder sb = new StringBuilder();
      if (dim > 1)
      {
        sb.append("[");
      }
      for (int i = 0; i < dim; i++)
      {
        if (i > 0)
        {
          if (dim > 3)
          {
            sb.append(", ");
          }
          else
          {
            sb.append(", ");
          }
        }
        sb.append(String.format("%s", get(i).toString(digits, printPrecision)));
      }
      if (dim > 1)
      {
        sb.append("]");
      }
      return sb.toString();
    }
  }
  
  public Real abs(Real res)  
  {
    arblib.arb_abs(res, this);
    return res;
  }

        
  public Real set(Real real)
  {
    assert dim == real.dim;
    if ( dim == 1 )
    {
     arblib.arb_set( this, real );
     }
     else
     { 
       arblib._arb_vec_set( this, real, dim );
     }
     bits = real.bits;
     return this;    
  }
  
  public int bits()
  {
    return arblib.arb_bits(this);
  }

  public Real posInf()
  {
    arblib.arb_pos_inf(this);
    return this;
  }
  
  public Real negInf()
  {
    arblib.arb_neg_inf(this);
    return this;
  }
  
  public Real zero()
  {
    arblib.arb_zero(this);
    return this;
  }

  @Override
  public Real identity()
  {
    arblib.arb_one(this);
    return this;
  }
         
  public Real set(String string, int prec)
  {
    arblib.arb_set_str(this, string, prec);
    bits = prec;
    return this;
  }
  
  
  public boolean overlaps( Real interval )
  {
    return arblib.arb_overlaps(this, interval) != 0;
  }
  
  @Override  
  public boolean contains( Real interval )
  {
    return arblib.arb_contains(this, interval) != 0;
  }
    
  public Real set(double d)
  {
    arblib.arb_set_d(this, d);
    return this;
  }
  
  @Override
  public Real div(int k, int prec, Real res)
  {
    arblib.arb_div_si(res, this, k, prec);
    bits = prec;
    return res;
  }
  
  public double doubleValue()
  {
    return getMid().doubleValue();
  }

  public double doubleValue(RoundingMode rm)
  {
    return getMid().doubleValue(rm);
  }
  
  /**
   * @return arb#arb_sgn_nonzero(Real)
   */
  public int sign()
  {
    return arblib.arb_sgn_nonzero(this);
  }

  public boolean isPositive()
  {
    return arblib.arb_is_positive(this) != 0;
  }

  public boolean isNegative()
  {
    return arblib.arb_is_negative(this) != 0;
  }
  
  public boolean containsZero()
  {
    return arblib.arb_contains_zero(this) != 0;
  }
  
  public Real set(FloatInterval interval, int prec)
  {
    Float a = interval.getA();
    Float b = interval.getB();
    bits = prec;
    /* [-inf, -inf] or [+inf, +inf] */
    if (a.isInfinite() && a.equals(b) )
    {
      setMid(a);
      getRad().zero();
      return this;
    }

    /* any nan -> [nan +/- inf] */
    if (a.isNotANumber() || b.isNotANumber() )
    {
      arb_indeterminate(this);
      return this;
    }

    /* [-inf, x] or [x, +inf] = [+/- inf] */
    if (arf_is_neg_inf(a) != 0 || arf_is_pos_inf(b) != 0)
    {
      arf_zero(getMid());
      mag_inf(getRad());
      return this;
    }

    try ( Float t = new Float();)
    {
      /* [(a + b) +/- (b - a)] / 2 */
      arf_sub(t, b, a, MAG_BITS, ARF_RND_UP);

      if (arf_sgn(t) < 0)
      {
        throw new IllegalArgumentException("endpoints are out of order");
      }

      arf_get_mag(getRad(), t);

      int inexact = arf_add(getMid(), a, b, prec, ARB_RND);
      if (inexact != 0)
      {
        Magnitude xrad = getRad();
        arf_mag_add_ulp(xrad, xrad, getMid(), prec);
      }

      arb_mul_2exp_si(this, this, -1);

      return this;
    }
  }

  /**
   * 
   * @param prec
   * @param r
   * @return the multiplicative inverse of r 
   */
  public Real inv( int prec, Real r )
  {
    arblib.arb_inv(r, this, prec);
    bits = prec;
    return r;
  }

  /**
   * The secant of r is the multiplicative inverse of the cosine of r
   * 
   * @param prec
   * @param r
   * @return
   */
  public Real sec(int prec, Real r)
  {
    arblib.arb_sec(r, this, prec);
    bits = prec;
    return r;
  }  
  
  /**
   * Sets this real number to its reciprocal, also known as its multiplicative
   * inverse
   * 
   * @param prec
   * @return this=1/this
   */
  public Real recip(int prec)
  {    
    return inv(prec, this);
  }

  @SuppressWarnings("resource")    
  public Real pow(int power, int prec, Real r)
  {
    if (dim == 1)
    {
      arblib.arb_pow_si(r, this, power, prec);
    }
    else
    {
      IntStream.range(0, dim).forEach(i -> get(i).pow(power, prec, r.get(i) ) );
    }
    r.bits = prec;
    return r;
  }
  
  /**
   * Sets this real number to its reciprocal, also known as its multiplicative
   * inverse
   * 
   * @param prec
   * @param result
   * @return result=1/this
   */
  public Real recip(int prec, Real result)
  {
    return inv(prec,result);
  }
    
  public Real tan(int prec, Real r)
  {
    arblib.arb_tan(r, this, prec);
    bits= prec;
    return r;
  }
  
  /**
   * @see arblib#arb_is_one(Real)
   * @return
   */
  public boolean isOne()
  {
    return arb_is_one(this) != 0;
  }

  /**
   * @see arblib#arb_is_zero(Real)
   * @return
   */
  public boolean isZero()
  {
    return arb_is_zero(this) != 0;
  }

  /**
   * Calls this{@link #setMid(Float)} and zeros out the radius
   * @param u value to set the midpoint of this real number ball to 
   * @return this
   */
  public Real set(Float u)
  {
    setMid(u);
    getRad().zero();
    return this;
  }  
  
  public Real mul(Real that, int prec, Real res)
  {
    assert dim == that.dim;
    if (dim != res.dim)
    {
      res.become(Real.newVector(dim));
    }
    for (int i = 0; i < dim; i++)
    {
      arblib.arb_mul(res.get(i), this.get(i), that.get(i), prec);
    }
    bits = prec;
    return res;
  }

  public Real dotProduct(Real other, int prec, Real res)
  {
    // TODO: replace this with arblib.arb_dot(res, res, prec, other, prec, res, prec, prec, prec);
  
    assert dim == other.dim;
    res.zero();
    try ( Real x = new Real();)
    {
      for (int i = 0; i < dim; i++)
      {
        get(i).mul(other.get(i), prec, x);
        res.add(x, prec);
      }
    }
    res.bits = prec;
    return res;
  }

  @Override
  public Real newFieldElement()
  {
    return new Real();
  }

  /**
   * Raise this to the power of y and store the result in res
   * 
   * @param y    exponent
   * @param prec
   * @param res
   * @return res=this^y
   */
  public Real pow(Real y, int prec, Real res)
  {
    arblib.arb_pow(res, this, y, prec);
    bits = prec;
    return res;
  }

  public Real pow(Real y, int prec)
  {
    bits = prec;
    return pow(y, prec, this);
  }


  public Real exp(int prec)
  {
    return exp(prec,this);
  }
  
 /**
   * log-Γ
   * 
   * @see arb#arb_lgamma(Real, Real, int)
   * @param bits
   * @param value
   * @return value=lnΓ(this)
   */
  public Real lnΓ(int bits, Real value)
  {
    arblib.arb_lgamma(value, this, bits);
    value.bits = bits;
    return value;
  }
  
  /**
   * @see arb#arb_gamma(Real, Real, int)
   * @param bits
   * @param value
   * @return value=Γ(this)
   */
  public Real Γ(int bits, Real value)
  {
    arblib.arb_gamma(value, this, bits);
    value.bits = bits;
    return value;
  }
    
  /**
   * Like this{@link #equals(Object)} but declares equality to be true if is true
   * up to a specified precision
   * 
   * @param that
   * @param prec
   * @return true if this is equal to b up to prec bits
   */
  public boolean approximatelyEquals(Real that, int prec)
  {
    try ( Real residual = new Real())
    {
      return approximatelyEquals(that,prec,residual);
    }
  }

  
 /**
   * 
   * @param bits
   * @return true if this{@link #approximatelyEquals(Real, int)} {@link RealConstants#zero} up to bits precision
   */
  public boolean isZeroUpTo(int bits)
  {
    return approximatelyEquals(RealConstants.zero, bits);
  }


  /**
   * Like this{@link #equals(Object)} but declares equality to be true if is true
   * up to a specified precision
   * 
   * @param that
   * @param prec
   * @param res  is the result and the residual this-that
   * @return true if this is equal to b up to prec bits
   */
  public boolean approximatelyEquals(Real that, int prec, Real res)
  {
    return sub(that, prec, res).containsZero();
  }
    
  public Real(double w)
  {
    this();
    set(w);
  }
  
  /**
   * Perform a linear regression where this=x is the independent variable
   * 
   * @param y      dependent variable
   * @param bits
   * @param result {@link Real} vector of dimension at least 2 to hold the slope
   *               and intercept
   *
   * @return result=[slope=(NΣ(xy) - ΣxΣy) / (N*Σ(x^2) - (Σx)^2), intercept=(Σy *
   *         m*Σx) / N]
   * 
   */
  public RealPolynomial linearlyRegress(Real y, int bits, RealPolynomial result)
  {
    assert result.getLength() >= 2 : "result.dim must be >=2";
    final Real x = this;
    assert x.size() == y.size() : String.format("x.size=%d != y.size=%d", x.size(), y.size());
    final int n         = x.size();
    Real      slope     = result.get(1);
    Real      intercept = result.get(0);

    try ( Real sumX = x.sum(bits, new Real()); Real sumY = y.sum(bits, new Real());
          Real sumXY = x.dotProduct(y, bits, new Real()); Real sumXX = x.dotProduct(x, bits, new Real());
          Real pivot = new Real();)
    {
      // m = (N*Σ(xy) - Σx*Σy) / (N*Σ(x^2) - (Σx)^2)
      sumXY.mul(n, bits); // N*Σ(xy)
      sumX.mul(sumY, bits, pivot); // Σx*Σy
      sumXY.sub(pivot, bits, slope); // N*Σ(xy) - Σx*Σy
      sumXX.mul(n, bits, sumXY); // N*Σ(x^2)
      sumX.pow(2, bits, pivot); // (Σx)^2
      sumXY.sub(pivot, bits, intercept); // N*Σ(x^2) - (Σx)^2
      slope.div(intercept, bits); // (N*Σ(xy) - Σx*Σy) / (N*Σ(x^2) - (Σx)^2)
      // c = (Σy - m*Σx) / N
      slope.mul(sumX, bits, sumXY); // m*Σx
      sumY.sub(sumXY, bits, pivot); // Σy - m*Σx
      pivot.div(n, bits, intercept); // (Σy - m*Σx) / N
    }
    return result;
  }

  
  /**
   * Calculate the sum of the elements
   * 
   * @param bits
   * @param result where to store the result
   * @return result=Σget(i)
   */
  public Real sum(int bits, Real result)
  {
    result.zero();
    for (Real val : this)
    {
      result.add(val, bits);
    }
    return result;
  }  
  
  @SuppressWarnings("unchecked")
  public Real setName(String name)
  {
    this.name = name;
    return this;
  }
  
  @Override
  public String getName()
  {
    return name;
  }  

%};

