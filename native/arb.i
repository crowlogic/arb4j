%module arb

%include typemaps.i
 
%include "init.i"

#define __signed__
#define slong signed long 
#define ulong unsigned long 
#define fmpr_rnd_t int
#define arf_rnd_t int

typedef mag_struct mag_t[1];
typedef mag_struct * mag_ptr;

%typemap(in) slong = long;

SWIG_JAVABODY_PROXY(public, public, SWIGTYPE)
SWIG_JAVABODY_TYPEWRAPPER(public, public, public, SWIGTYPE)

%rename (RealVector) *arb_ptr;
%rename (initialValue) gmp_init;
%rename (algorithm) _mp_alg;
%rename (seed) _mp_seed;
%rename (randomState) gmp_state;
%rename (algorithmData) _mp_algdata;
%rename (randomValue) __randval;
%rename (randomValue2) __randval2;
%rename (RandomAlgorithmData) __gmp_randstate_struct__mp_algdata;
%rename (RandomAlgorithm) gmp_randalg_t;
%rename (GMPRandomState) __gmp_randstate_struct;
%rename (RandomState) flint_rand_s;
%rename (FastDFTBluesteinScheme) acb_dft_bluestein_struct;
%rename (FastDFTPrecomputedCyclicScheme) acb_dft_cyc_precomp;
%rename (FastDFTRadix2Scheme) acb_dft_rad2_struct;
%rename (FastDFTScheme) acb_dft_pre_struct;
%rename (FastDFTChineseRemainder) acb_dft_crt_struct;
%rename (FastDFTSchemeUnion) acb_dft_pre_struct_t;
%rename (MultiplePrecisionInteger) __mpz_struct;
%rename (FloatInterval) arf_interval_struct;
%rename (MultiplePrecisionFloat) __mpfr_struct;
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
%rename (ComplexPolynomial) acb_poly_struct;
%rename (ComplexMatrix) acb_mat_struct;
%rename (RealMatrix) arb_mat_struct;
%rename (FoundRoots) root_struct;

%include "Magnitude.i"

%include "Float.i"

%include "FloatInterval.i"

%include "Real.i"

%include "MultiPrecFloat.i"

%include "Functions.i"

%rename (realObj) real;
%rename (imagObj) imag;

%include "Complex.i"

%rename (realObj) realObj;
%rename (imagObj) imagObj;

%include "ComplexPolynomial.i"

%include "ComplexMatrix.i"

%include "RealMatrix.i"

%include "DirichletCharacter.i"

%include "DirichletGroup.i"

%include "RandomState.i"

%include "TypesAndStructures.i"





   