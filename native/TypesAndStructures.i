%{
#include <flint/fmpz.h>
#include <mpfr.h>
#include <flint/flint.h>
#include <arf.h>
#include <arb.h>
#include <arb_hypgeom.h>
#include <acb.h>
#include <acb_calc.h>
#include <acb_elliptic.h>
#include <acb_poly.h>
#include <acb_dirichlet.h>
#include <dirichlet.h>
#include <acb_modular.h>
#include <acb_dft.h>

int f_lemniscate(acb_ptr res, const acb_t z, void * param, slong order, slong prec);
int f_lemniscate_derivative(acb_ptr res, const acb_t z, void * param, slong order, slong prec);
int f_lemniscate_derivative_abs(acb_ptr res, const acb_t z, void * param, slong order, slong prec);

#include "color.h"
#ifndef size_t
#define size_t long unsigned int
#endif
%}

/**
 fmpz is an arbitrary precision integer implemented as a signed 64bit integer. 
 When its second most significant bit is 0 fmpz represents an ordinary slong integer whose absolute value is at most FLINT_BITS - 2 bits.
 When the second most significant bit is 1 fmpz represents a pointer which is shifted right 2 bits and the second msb is set to 1 - 
 this relies on the fact that malloc always allocates memory blocks on a 4 or 8 byte boundary).
 msb=MostSiginificantBit
 */
typedef long long int fmpz;
typedef fmpz fmpz_t[1];

/* Available random number generation algorithms.  */
typedef enum
{
  GMP_RAND_ALG_DEFAULT = 0,
  GMP_RAND_ALG_LC = GMP_RAND_ALG_DEFAULT /* Linear congruential.  */
} gmp_randalg_t;


typedef unsigned long int	mp_limb_t;

typedef __mpfr_struct mpfr_t[1];
typedef __mpfr_struct *mpfr_ptr;
typedef const __mpfr_struct *mpfr_srcptr;

typedef struct
{
  int _mp_alloc;		/* Number of *limbs* allocated and pointed to by the _mp_d field.  */
  int _mp_size;			/**
                         * abs(_mp_size) is the number of limbs the last field points to.  
                         * If _mp_size is negative this is a negative number.  
                         */ 
  mp_limb_t *_mp_d;		/* Pointer to the limbs.  */
} __mpz_struct;

typedef __mpz_struct mpz_t[1];

/* Random state struct.  */
typedef struct
{
  mpz_t _mp_seed;	      /* _mp_d member points to state of the generator. */
  gmp_randalg_t _mp_alg;  /* Currently unused. */
  union 
  {
    void *_mp_lc;         /* Pointer to function pointers structure.  */
  } _mp_algdata;
} __gmp_randstate_struct;
typedef __gmp_randstate_struct gmp_randstate_t[1];

typedef struct
{
    gmp_randstate_t gmp_state;
    int gmp_init;
    mp_limb_t __randval;
    mp_limb_t __randval2;
} flint_rand_s;

typedef flint_rand_s flint_rand_t[1];

typedef struct
{
    arb_ptr entries;
    slong r;
    slong c;
    arb_ptr * rows;
}
arb_mat_struct;

typedef arb_mat_struct arb_mat_t[1];

typedef struct
{
    acb_ptr entries;
    slong r;
    slong c;
    acb_ptr * rows;
}
acb_mat_struct;

typedef acb_mat_struct acb_mat_t[1];

typedef struct
{
    arf_struct a;
    arf_struct b;
}
arf_interval_struct;

typedef arf_interval_struct arf_interval_t[1];
typedef arf_interval_struct * arf_interval_ptr;
typedef const arf_interval_struct * arf_interval_srcptr;

typedef struct
{
    fmpz exp;
    mp_limb_t man;
}
mag_struct;

typedef mag_struct mag_t[1];
typedef mag_struct * mag_ptr;
typedef const mag_struct * mag_srcptr;

typedef struct
{
    arb_struct real;
    arb_struct imag;
}
acb_struct;

typedef acb_struct acb_t[1];
typedef acb_struct * acb_ptr;
typedef const acb_struct * acb_srcptr;

typedef struct
{
fmpz

    an fmpz is implemented as an slong. When its second most significant bit is 0 the fmpz represents an ordinary slong integer whose absolute value is at most FLINT_BITS - 2 bits.

    When the second most significant bit is 1 then the value represents a pointer (the pointer is shifted right 2 bits and the second msb is set to 1 - this relies on the fact that malloc always allocates memory blocks on a 4 or 8 byte boundary).

    ulong q;                /* modulus */
    ulong q_even;           /* even part of modulus */
    nmod_t mod;             /* modulus with precomputed inverse */
    ulong rad_q;            /* radical = product of odd primes */
    ulong phi_q;            /* phi(q) = group size */
    slong neven;            /* number of even components (in 0,1,2)*/
    slong num;              /* number of prime components (even + odd) */
    ulong expo;             /* exponent = largest order in G */
    dirichlet_prime_group_struct * P;
    ulong * generators;     /* generators lifted mod q */
    ulong * PHI;            /* PHI(k) = expo / phi(k)        */
}
dirichlet_group_struct;

typedef dirichlet_group_struct dirichlet_group_t[1];

typedef struct
{
    ulong n;           /* number */
    ulong * log;       /* s.t. prod generators[k]^log[k] = number */
}
dirichlet_char_struct;

typedef dirichlet_char_struct dirichlet_char_t[1];

 
typedef struct
{
    ulong p;    /* underlying prime */
    int e;      /* exponent */
    nmod_t pe;  /* modulus */
    nmod_t phi;  /* phi(p^e) */
    ulong g;    /* conrey generator */
    dlog_precomp_struct * dlog;  /* precomputed data for discrete log mod p^e */
}
dirichlet_prime_group_struct;

typedef dirichlet_group_struct dirichlet_group_t[1];

typedef struct
{
    arf_struct mid;
    mag_struct rad;
}
arb_struct;

typedef arb_struct arb_t[1];
typedef arb_struct * arb_ptr;
typedef const arb_struct * arb_srcptr;


typedef struct
{
    mp_limb_t d[ARF_NOPTR_LIMBS];
}
mantissa_noptr_struct;

typedef struct
{
    mp_size_t alloc;
    mp_ptr d;
}
mantissa_ptr_struct;

typedef union
{
    mantissa_noptr_struct noptr;
    mantissa_ptr_struct ptr;
}
mantissa_struct;

typedef struct
{
    fmpz exp;
    mp_size_t size;
    mantissa_struct d;
}
arf_struct;

typedef struct {
  mpfr_prec_t  _mpfr_prec;
  mpfr_sign_t  _mpfr_sign;
  mpfr_exp_t   _mpfr_exp;
  mp_limb_t   *_mpfr_d;
} __mpfr_struct;

typedef fmpz fmpz_t[1];



typedef arf_struct arf_t[1];
typedef arf_struct * arf_ptr;
typedef const arf_struct * arf_srcptr;

typedef struct
{
    acb_ptr coeffs;
    slong length;
    slong alloc;
}
acb_poly_struct;

typedef acb_poly_struct acb_poly_t[1];

// DFT stuff

typedef struct acb_dft_step_struct acb_dft_step_struct;
typedef acb_dft_step_struct * acb_dft_step_ptr;

typedef struct
{
    slong n;
    acb_ptr z;
    int zclear;
    slong num;
    acb_dft_step_ptr cyc;
}
acb_dft_cyc_struct;

typedef acb_dft_cyc_struct acb_dft_cyc_t[1];

typedef struct
{
    int e;
    slong n; /* = 1 << e */
    slong dv;
    slong nz; /* = n but could be bigger */
    acb_ptr z;
}
acb_dft_rad2_struct;

typedef acb_dft_rad2_struct acb_dft_rad2_t[1];

typedef struct
{
    slong n;
    slong dv;
    acb_ptr z; /* z[k] = e(k^2/2n) */
    acb_ptr g; /* g[k] = dft( z ) */
    acb_dft_rad2_t rad2;
}
acb_dft_bluestein_struct;

typedef acb_dft_bluestein_struct acb_dft_bluestein_t[1];

typedef struct
{
    slong n;
    slong num;
    acb_dft_step_ptr cyc;
}
acb_dft_prod_struct;

typedef acb_dft_prod_struct acb_dft_prod_t[1];

typedef struct
{
    slong n;
	// crt_t c;
    slong dv;
    /* then a product */
    acb_dft_step_ptr cyc;
}
acb_dft_crt_struct;

typedef acb_dft_crt_struct acb_dft_crt_t[1];

typedef struct
{
    slong n;
    slong dv;
    int zclear;
    acb_ptr z;
    slong dz;
}
acb_dft_naive_struct;

typedef acb_dft_naive_struct acb_dft_naive_t[1];

typedef struct
{
    slong n;
    int type;
    union
    {
        acb_dft_rad2_t rad2;
        acb_dft_cyc_t cyc;
        acb_dft_prod_t prod;
        acb_dft_crt_t crt;
        acb_dft_naive_t naive;
        acb_dft_bluestein_t bluestein;
    } t;
}
acb_dft_pre_struct;

typedef acb_dft_pre_struct acb_dft_pre_t[1];

/* covers both product and cyclic case */
struct
acb_dft_step_struct
{
    /* [G:H] */
    slong m;
    /* card H */
    //slong M;
    slong dv; /* = M for prod, also = M if cyc is reordered */
    /* pointer on some roots of unity, if needed */
    acb_srcptr z;
    /* index of mM in z */
    slong dz;
    /* dft to call on H */
    acb_dft_pre_t pre;
    /* dft to call on G/H ? */
};
