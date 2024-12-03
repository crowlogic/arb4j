%module arblib

%include typemaps.i
 
%include "init.i"

%typemap(javabody) SWIGTYPE (CLASS::Real) %{
  protected long swigCPtr;
  protected boolean swigCMemOwn;

  public $javaclassname(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr($javaclassname obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }
%}

typedef unsigned long* unsigned_long_ptr;

#define __signed__
#define slong signed long 
#define ulong unsigned long 
#define fmpr_rnd_t int
#define arf_rnd_t int
#define fmpz_t signed long long


typedef mag_struct mag_t[1];
typedef mag_struct * mag_ptr;
typedef unsigned long* unsigned_long_ptr;
typedef unsigned long int mp_limb_t;

%ignore modmap;
%ignore keymap;
%ignore symbol;
%ignore code;
%ignore xdpy;
%ignore size;
%ignore mp_size_t;
%ignore d;
%ignore alloc;
%ignore mp_lc;
%ignore dlog_precomp_struct;
%ignore dlog;
%ignore log;
%ignore generators;
%ignore PHI;
%ignore _mp_seed;
%ignore _mp_alg;
%ignore phi;
%ignore pe;
//%ignore d;
%ignore mod;
%ignore entries;

%rename (numRows) r;
%rename (numCols) c;

%rename (CharacterCodeMap) charcodemap;
%rename (XDO) xdo_struct;
%rename (SymbolicExpression) fexpr_struct;
%rename (AlgebraicNumber) qqbar_struct;
%rename (RationalFunction) fmpz_poly_q_struct;
%rename (IntegerPolynomial) fmpz_poly_struct;
%rename (denominatorAddress) den;
%rename (numeratorAddress) num;
%rename (Fraction) fmpq;
%rename (rowPointers) rows;
%rename (initialValue) gmp_init;
%rename (gmpRandomState) gmp_state;
%rename (algorithmData) _mp_algdata;
%rename (randomValue) __randval;
%rename (randomValue2) __randval2;
%rename (RandomAlgorithmData) __gmp_randstate_struct__mp_algdata;
%rename ($ignore) gmp_randalg_t;
%rename (GMPRandomState) __gmp_randstate_struct;
%rename (FastDFTBluesteinScheme) acb_dft_bluestein_struct;
%rename (FastDFTPrecomputedCyclicScheme) acb_dft_cyc_precomp;
%rename (FastDFTRadix2Scheme) acb_dft_rad2_struct;
%rename (FastDFTScheme) acb_dft_pre_struct;
%rename (FastDFTChineseRemainder) acb_dft_crt_struct;
%rename (FastDFTSchemeUnion) acb_dft_pre_struct_t;
%rename (FastDFTCyclicScheme) acb_dft_cyc_struct;
%rename (FastDFTNaiveScheme) acb_dft_naive_struct;
%rename (FastDFTProductScheme) acb_dft_prod_struct;
%rename (FastDFTStepScheme) acb_dft_step_struct;
%rename (FloatInterval) arf_interval_struct;
%rename (Complex) acb_struct;
%rename (Real) arb_struct;
%rename (Float) arf_struct;
%rename (Magnitude) mag_struct;
%rename (Mantissa) mantissa_struct;
%rename (MantissaPointer) mantissa_ptr_struct;
%rename (MantissaNoPointer) mantissa_noptr_struct;
%rename (DirichletCharacter) dirichlet_char_struct;
%rename (DirichletGroup) dirichlet_group_struct;
%rename (DirichletPrimeGroup) dirichlet_prime_group_struct;
%rename (RealPolynomial) arb_poly_struct;
%rename (ComplexPolynomial) acb_poly_struct;
%rename (ComplexMatrix) acb_mat_struct;
%rename (RealMatrix) arb_mat_struct;
%rename (FoundRoots) root_struct;

%typemap(javafinalize) dirichlet_prime_group_struct ""
%typemap(javafinalize) dirichlet_char_struct ""
%typemap(javafinalize) dirichlet_group_struct ""
%typemap(javafinalize) acb_dft_bluestein_struct ""
%typemap(javafinalize) acb_dft_crt_struct ""
%typemap(javafinalize) acb_dft_cyc_struct ""
%typemap(javafinalize) acb_dft_naive_struct ""
%typemap(javafinalize) acb_dft_prod_struct ""
%typemap(javafinalize) acb_dft_rad2_struct ""
%typemap(javafinalize) acb_dft_pre_struct ""
%typemap(javafinalize) acb_dft_pre_struct_t ""
%typemap(javafinalize) struct acb_dft_step_struct ""
%typemap(javafinalize) __gmp_randstate_struct ""
%typemap(javafinalize) __gmp_randstate_struct__mp_algdata ""
%typemap(javafinalize) mantissa_struct ""
%typemap(javafinalize) mantissa_ptr_struct ""
%typemap(javafinalize) mantissa_noptr_struct ""

%typemap(jtype) slong* "java.nio.LongBuffer"
%typemap(jstype) slong* "java.nio.LongBuffer"
%typemap(javain) slong* "$javainput"
%typemap(in) long* {
    if ( $input != 0 )
    {
     $1 = (long *)(*jenv)->GetDirectBufferAddress(jenv, $input);    
     if (!$1) SWIG_JavaThrowException(jenv, SWIG_JavaNullPointerException, "Direct buffer is null");
    }
    else
    {
     $1 = 0;
    }
}

%include "Magnitude.i"

%include "Float.i"

%include "FloatInterval.i"

%include "Real.i"

%include "Functions.i"

%rename (realObj) real;
%rename (imagObj) imag;

%include "Complex.i"

%rename (real) realObj;
%rename (imag) imagObj;

%include "IntegerPolynomial.i"

%rename (coeffsNative) coeffs;

%include "RealPolynomial.i"

%include "ComplexPolynomial.i"

%rename (coeffs) coeffsNative;

%include "ComplexMatrix.i"

%include "RealMatrix.i"

%include "DirichletCharacter.i"

%include "DirichletGroup.i"

%include "Fraction.i"

%include "RationalFunction.i"

%include "AlgebraicNumber.i"

%include "TypesAndStructures.i"

