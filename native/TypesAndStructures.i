
%{
#include <flint/fmpz.h>
#include <flint/qqbar.h>
#include <mpfr.h>
#include <flint/flint.h>
#include <arf.h>
#include <arb.h>
#include <acb_hypgeom.h>
#include <arb_hypgeom.h>
#include <acb.h>
#include <acb_calc.h>
#include <acb_elliptic.h>
#include <acb_poly.h>
#include <acb_dirichlet.h>
#include <dirichlet.h>
#include <acb_modular.h>
#include <arb_calc.h>
#include <acb_dft.h>
#include <arb_mat.h>
#include <arb_poly.h>
#include <acb_mat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <malloc.h>
#include <mpfr.h>

typedef unsigned long* unsigned_long_ptr;

typedef unsigned long int mp_limb_t;

typedef mp_limb_t *   mp_ptr;

typedef slong fmpz;
typedef fmpz fmpz_t[1];

typedef long int		mp_size_t;

#ifndef size_t
#define size_t long unsigned int
#endif

#define flint_bitcnt_t ulong

%}

typedef struct
{
    fmpz_poly_struct poly;
    acb_struct enclosure;
}
qqbar_struct;

typedef qqbar_struct qqbar_t[1];

typedef struct
{
    ulong * data;
    slong alloc;
}
fexpr_struct;

typedef fexpr_struct fexpr_t[1];

typedef struct
{
    jlong num;
    jlong den;
}
fmpz_poly_q_struct;

typedef fmpz_poly_q_struct fmpz_poly_q_t[1];

typedef struct
{
    fmpz_t coeffs;
    slong alloc;
    slong length;
}
fmpz_poly_struct;

typedef fmpz_poly_struct fmpz_poly_t[1];


typedef struct
{
    jlong num;
    jlong den;
}
fmpq;

typedef fmpq fmpq_t[1];

typedef enum
{
  GMP_RAND_ALG_DEFAULT = 0,
  GMP_RAND_ALG_LC = GMP_RAND_ALG_DEFAULT /* Linear congruential.  */
} gmp_randalg_t;



/* Random state struct.  */
typedef struct
{
  mpz_t _mp_seed;	    
  gmp_randalg_t _mp_alg;  
  union 
  {
    void *_mp_lc;         
  } _mp_algdata;
} __gmp_randstate_struct;

typedef __gmp_randstate_struct gmp_randstate_t[1];


 
typedef struct
{
    arb_ptr entries;
    slong r;
    slong c;
    jlong rows;
}
arb_mat_struct;

typedef arb_mat_struct arb_mat_t[1];

typedef struct
{
    acb_ptr entries;
    slong r;
    slong c;
    jlong rows;
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
    jlong exp;
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
    ulong q;                /* modulus */
    ulong q_even;           /* even part of modulus */
    nmod_t mod;             /* modulus with precomputed inverse */
    ulong rad_q;            /* radical = product of odd primes */
    ulong phi_q;            /* phi(q) = group size */
    slong neven;            /* number of even components (in 0,1,2)*/
    slong num;              /* number of prime components (even + odd) */
    ulong expo;             /* exponent = largest order in G */
    dirichlet_prime_group_struct * P;
    unsigned_long_ptr       generators;     /* generators lifted mod q */
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
    jlong exp;
    mp_size_t size;
    mantissa_struct d;
}
arf_struct;

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

typedef struct
{
    arb_ptr coeffs;
    slong length;
    slong alloc;
}
arb_poly_struct;

typedef arb_poly_struct arb_poly_t[1];

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



