%typemap(javafinalize) arb_struct ""

%typemap(javainterfaces) arb_struct "Domain<Real>,Serializable,Comparable<Real>,Iterable<Real>,Field<Real>,Lockable<Real>,IntFunction<Real>"

%typemap(javaimports) arb_struct %{
import static arb.IntegerConstants.*;
import static arb.arblib.*;
import static arb.RealConstants.*;
import java.io.Serializable;
import java.lang.foreign.MemorySegment;
import java.util.*;
import java.util.function.IntFunction;
import java.util.stream.*;
import arb.domains.Domain;
import arb.stochastic.ProbabilityDistributionFunction;

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
 * notions of virtual machine. For this to work the {@link Real} must have been allocated
 * with {@link Real#newAlignedVector(int)} and the bits of precision allocated must be no more than 128
 * but this is not asserted presently so as to avoid a this{@link #bits()} function call. The limit
 * of 128 bits exists because this is the maximum number of bits that can be stored in arblib's inline
 * number format. Any greater than 128 and arblib stores a pointer to the numerical contents 
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
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
%}
%typemap(javacode) arb_struct %{
  private static final long serialVersionUID = 1L;

  static { System.loadLibrary( "arblib" ); }


  @Override
  public Real apply(int value)
  {
    return get(value);
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
  public Real choose( int k, int bits )
  {
    arblib.arb_bin_ui(this, this, k, bits);
    return this;
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
  public Real choose( int k, int bits, Real result )
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
    return ComplexConstants.i.mul(this, bits, result );
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

  /*
   * The covariance of x and y is Σ(x[i]-mean(x))*(y[i]-mean(y)),i=1..dim)
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
          Real aCentered = vecScalarSub(a, prec, Real.newVector(dim));
          Real bCentered = that.vecScalarSub(b, prec, Real.newVector(dim)))
    {
      return aCentered.dotProduct(bCentered, prec, res).div(dim, prec);
    }
  }
  
  /**
   * 
   * @param a      scalar (single real value, only element 0 is used, it is NOT
   *               treated as a vector)
   * @param prec
   * @param result
   * @return newVector=this-a where a is a scalar subtracted from each element of
   *         this
   */
  public Real vecScalarSub(Real a, int prec, Real result)
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
  
  /**
   * Calls {@link Real#random(RandomState, int)} on each element of this
   * 
   * @param pdf
   * @param randomState
   * @param prec
   */
  public void randomlyGenerate(ProbabilityDistributionFunction pdf, RandomState randomState, int prec)
  {
    forEach(element -> pdf.sample(randomState, prec, element));
  }
  
  public Real add(Real d, int prec)
  {
    return add(d, prec, this);
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
  public Iterator<Real> iterator()
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

  public Real(String string, int prec)
  {
    this();
    set(string, prec);
  }
  
  public Real log(int prec, Real res)
  {
    arblib.arb_log(res, this, prec);
    return res;    
  }

  
  public Real mul2e( int e, Real res )
  {
    arb_mul_2exp_si(res, this, e);
    return res;
  }

  /**
   * Sets this to a uniformly distributed (pseudo) random number
   * 
   * @param state the {@link RandomState}
   * @param bits  precision
   * @return uniformly distributed pseudo-random number
   */
  public Real random(RandomState state, int bits)
  {
    arblib.arb_urandom(this, state, bits);
    return this;
  }
  
  
  /**
   * FIXME: test for memory leaks
   */ 
  public Real resize(int alloc)
  {
    swigCPtr = SWIGTYPE_p_void.getCPtr(arblib.flint_realloc(new SWIGTYPE_p_void(swigCPtr,
                                                                             false),
                                                         2 * (long)alloc * Real.BYTES));
    Real newElements[] = new Real[alloc];
    System.arraycopy(elements, 0, newElements, 0, dim);
    this.dim = alloc;
    elements = newElements;
    return this;
  }
   

  public Real abs(int prec, Real w)
  {
    arblib.arb_abs(w, this);
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
  
  public Complex sub(Complex a, int prec, Complex res)
  {
    return add(a.neg(res), prec, res);
  }
  
  public Complex add(Complex a, int prec, Complex res)
  {
    arblib.acb_add_arb(res, a, this, prec);
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

  /**
   * @return {@link arb#arb_equal(Real, Real)} != 0
   */
  @Override
  public boolean equals(Object obj)
  {
    if ( !(obj instanceof Real))
    {
      return false;
    }
    Real that = (Real)obj;
    return arblib.arb_equal(this, that) != 0;
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
  
  public Real sqrt( int prec, Real res )
  {
    arblib.arb_sqrt(res, this, prec);
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
    arblib.arb_addmul( result, this, that, prec );
    return result;
  }
  
  public boolean isFinite()
  {
    return arblib.arb_is_finite(this) != 0;
  }

  public Real floor( int prec, Real res )
  {
    arblib.arb_floor( res, this, prec );
    return res;
  }

  public Real ceil( int prec, Real res )
  {
    arblib.arb_ceil( res, this, prec );
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
     
 /**
   * Construct a new {@link Real} aligned on a page boundary so that this can be
   * this{@link #lock()}ed by invoking the
   * {@link arblibJNI#mprotect(long, long, int)} method. The actual size based on the
   * rounding up of the buffer size to the nearest page boundary is set which is
   * always greater than or equal to the requested dimension
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
    int  alignedSize = (int) ((size * Real.BYTES + PAGESIZE - 1) / PAGESIZE * PAGESIZE);

    long pointer     = arblibJNI.memalign(PAGESIZE, alignedSize);
    arblibJNI.memset(pointer, 0, alignedSize);
    Real x          = new Real(pointer,
                               true);

    // Calculate the actual number of elements that can fit in the aligned buffer
    int  actualSize = alignedSize / Real.BYTES;

    x.elements = new Real[x.dim = actualSize];
    for (int j = 0; j < actualSize; j++)
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
  public Real div(Real exp, int prec, Real r)
  {
    arblib.arb_div(r, this, exp, prec );
    return r;
  }
  

  public int relAccuracyBits()
  {
   return arblib.arb_rel_accuracy_bits(this);
  }

  public Real sub(Real real, int prec, Real res)
  {
    if (dim == 1)
    {
      arblib.arb_sub(res, this, real, prec);
      return res;
    }
    else
    {
      assert dim == real.dim : String.format("this.dim=%d != dim=%d\n", this.dim, real.dim);
      arblib._arb_vec_sub(res, this, real, dim, prec);
      return res;
    }
  }

  public static final int BYTES = Float.BYTES + Magnitude.BYTES;

  public Real setIntervalMagnitude( Magnitude a, Magnitude b, int prec )
  {
    arblib.arb_set_interval_mag(this, a, b, prec);
    return this;
  }
    
  public Real π( int prec )
  {
    arblib.arb_const_pi(this, prec);
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

  public Real add(Real d, int prec, Real res)
  {
    arblib.arb_add(res, this, d, prec );
    return res;
  }
  
    public Real[] elements;
  
  public Real get(int index)
  {
    assert index < dim : String.format("index = %d >= dim = %d", index, dim);
    if (index == 0 && dim == 1)
    {
      return this;
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
    return ( name == null ? "" : name + " " ) + toString(digits());
  }

  public String name;
    
  public int digits()
  {
    try ( Magnitude d = new Magnitude()  )
    {
      getRad().inv(d);
      d.log(d);
      d.div(MagnitudeConstants.log10mag, d);
      return Math.max( 5, (int) d.doubleValue() + 2 );
    }
  }  
  
  public boolean  printPrecision = true;
    
  public String toString(int digits)
  {
    return toString(digits, printPrecision);
  }

  public String toString(int digits, boolean precise)
  {
    if (dim == 1)
    {
      return arblib.arb_get_str(this,
                             digits,
                             (printPrecision
                                           || precise) ? IntegerConstants.ARB_STR_MORE : IntegerConstants.ARB_STR_NO_RADIUS)
                             .replace("[", "")
                             .replace("]", "");                                           
    }
    else
    {
      StringBuilder sb = new StringBuilder();
      if ( dim > 1 ) 
      {
        sb.append("[");
      }
      for (int i = 0; i < dim; i++)
      {
        if (i > 0)
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
        sb.append(String.format("%s", get(i).toString(digits, printPrecision)));
      }
      if ( dim > 1 )
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

  public Real one()
  {
    arblib.arb_one(this);
    return this;
  }
         
  public Real set(String string, int prec)
  {
    arblib.arb_set_str(this, string, prec);
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
    
  public Real pow(int power, int prec, Real r)
  {
    if (dim == 1)
    {
      arblib.arb_pow_si(r, this, power, prec);
    }
    else
    {
      IntStream.range(0, dim).forEach(i ->
      {
        get(i).pow(power, prec, r.get(i));
      });
    }
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
    return r;
  }
  
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
   
  public Real mul(Real x, int prec, Real result)
  {
    arblib.arb_mul(result, this, x, prec );
    return result;
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
    return res;
  }

  @Override
  public Real newFieldElement()
  {
    return new Real();
  }

  /**
   * <pre>
   *                 n*Σ(this*that)-Σthis*Σthat 
   *      ----------------------------------------------------- 
   *       √(n*Σ(this^2)-(Σthis)^2) * √( n*(Σ(that^2))-(that)^2)
   * </pre>
   * 
   * @param that vector to compare with
   * @param prec number of bits to use in calculations
   * @param res  where to store the result∈[-1,1]
   * @return the correlation between this and that
   */
  public Real correlation(Real that, int prec, Real res)
  {
    assert dim == that.dim : "dimensions must match, this.dim=" + dim + " != that.dim = " + that.dim;
    try ( Real thisSum = Σ(prec, new Real());
          Real thatSum = that.Σ(prec, new Real());
          Real thisThatDotProduct = new Real();)
    {
      dotProduct(that, prec, thisThatDotProduct);
      // return ( n*Σ(this*that)-Σthis*Σthat ) / (
      // √(n*Σ(this^2)-(Σthis)^2)*√(n*Σ(that^2)-(that)^2) )
      assert false : "TODO: return ( n*Σ(this*that)-Σthis*Σthat ) / ( √(n*Σ(this^2)-(Σthis)^2)*√(n*Σ(that^2)-(that)^2) )";
    }
    return null;
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
    return res;
  }

  public Real pow(Real y, int prec)
  {
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
   * @return result=[slope=(NΣ(xy) - ΣxΣy) / (N*Σ(x^2) - (Σx)^2),intercept=(Σy -
   *         m*Σx) / N]
   */
  public Real linearlyRegress(Real y, int bits, Real result)
  {
    assert result.size() >= 2 : "result.dim must be >=2";
    final Real x = this;
    assert x.size() == y.size() : String.format("x.size=%d != y.size=%d", x.size(), y.size());
    final int n         = x.size();
    Real      slope     = result.get(0);
    Real      intercept = result.get(1);

    try ( Real sumX = x.sum(bits, new Real());
          Real sumY = y.sum(bits, new Real());
          Real sumXY = x.dotProduct(y, bits, new Real());
          Real sumXX = x.dotProduct(x, bits, new Real());
          Real tmp = new Real();)
    {
      // m = (N*Σ(xy) - Σx*Σy) / (N*Σ(x^2) - (Σx)^2)
      sumXY.mul(n, bits); // N*Σ(xy)
      sumX.mul(sumY, bits, tmp); // Σx*Σy
      sumXY.sub(tmp, bits, slope); // N*Σ(xy) - Σx*Σy
      sumXX.mul(n, bits, sumXY); // N*Σ(x^2)
      sumX.pow(2, bits, tmp); // (Σx)^2
      sumXY.sub(tmp, bits, intercept); // N*Σ(x^2) - (Σx)^2
      slope.div(intercept, bits); // (N*Σ(xy) - Σx*Σy) / (N*Σ(x^2) - (Σx)^2)
      // c = (Σy - m*Σx) / N
      slope.mul(sumX, bits, sumXY); // m*Σx
      sumY.sub(sumXY, bits, tmp); // Σy - m*Σx
      tmp.div(n, bits, intercept); // (Σy - m*Σx) / N
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
  
  /**
   * Sets this{@link #name} to the given name
   * 
   * @param name
   * @return this for reference chaining fluent-style
   */
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

