#define __off_t long int
#define off_t long int

#include <gmp.h>
#include <arb_mat.h>
#include <flint/fmpq.h>
#include <flint/fmpq_poly.h>
 int fmpq_equal(const fmpq_t x, const fmpq_t y);
 

void acb_poly_neg(acb_poly_t res, const acb_poly_t poly);

void acb_gamma(acb_t y, const acb_t x, slong prec);
void acb_rgamma(acb_t y, const acb_t x, slong prec);
void acb_lgamma(acb_t y, const acb_t x, slong prec);
void acb_log_sin_pi(acb_t res, const acb_t z, slong prec);
void acb_digamma(acb_t y, const acb_t x, slong prec);
void acb_zeta(acb_t z, const acb_t s, slong prec);
void acb_hurwitz_zeta(acb_t z, const acb_t s, const acb_t a, slong prec);
void acb_polygamma(acb_t res, const acb_t s, const acb_t z, slong prec);

int acb_poly_equal(const acb_poly_t A, const acb_poly_t B);

void acb_poly_add(acb_poly_t res, const acb_poly_t poly1,
              const acb_poly_t poly2, slong prec);
              
void acb_hypgeom_rising_ui(acb_t y, const acb_t x, ulong n, slong prec);
void acb_hypgeom_rising(acb_t y, const acb_t x, const acb_t n, slong prec);

void acb_poly_pow_ui(acb_poly_t res, const acb_poly_t poly, ulong exp, slong prec);

void acb_div_fmpz(acb_t z, const acb_t x, const fmpz_t c, slong prec);

void acb_poly_scalar_div(acb_poly_t res, const acb_poly_t poly, const acb_t c, slong prec);

void acb_poly_set_si(acb_poly_t poly, slong c);
int acb_poly_divrem(acb_poly_t Q, acb_poly_t R,
                             const acb_poly_t A, const acb_poly_t B, slong prec);
                             
void fmpz_fac_ui(fmpz_t f, ulong n);
void fmpz_bin_uiui(fmpz_t res, ulong n, ulong k);

char * fmpq_poly_get_str_pretty(const fmpq_poly_t poly, const char * var);

void fmpq_poly_divrem(fmpq_poly_t Q, fmpq_poly_t R, const fmpq_poly_t poly1, const fmpq_poly_t poly2);
void fmpq_poly_div(fmpq_poly_t Q, const fmpq_poly_t poly1, const fmpq_poly_t poly2);
void fmpq_poly_rem(fmpq_poly_t R, const fmpq_poly_t poly1, const fmpq_poly_t poly2);

void fmpq_poly_add(fmpq_poly_t res,
                   const fmpq_poly_t poly1, const fmpq_poly_t poly2);

void fmpq_poly_sub(fmpq_poly_t res,
                   const fmpq_poly_t poly1, const fmpq_poly_t poly2);

void fmpq_poly_mul(fmpq_poly_t res,
                   const fmpq_poly_t poly1, const fmpq_poly_t poly2);
                                                         
int fmpq_poly_set_str(fmpq_poly_t poly, const char * str);

char * fmpq_poly_get_str(const fmpq_poly_t poly);

char *fmpq_get_str(char *str, int b, const fmpq_t x);
int fmpq_set_str(fmpq_t dest, const char *s, int base);
  
   
void fmpq_set_fmpz_frac(fmpq_t res, const fmpz_t p, const fmpz_t q);

int fmpq_set_str(fmpq_t res, const char * str, int base);

void fmpq_sub(fmpq_t res, const fmpq_t op1, const fmpq_t op2);
void fmpq_sub_si(fmpq_t res, const fmpq_t op1, slong c);
void fmpq_sub_ui(fmpq_t res, const fmpq_t op1, ulong c);
void fmpq_sub_fmpz(fmpq_t res, const fmpq_t op1, const fmpz_t c);
void fmpq_mul_ui(fmpq_t res, const fmpq_t op1, ulong c);
void fmpq_mul(fmpq_t res, const fmpq_t op1, const fmpq_t op2);
void fmpq_neg(fmpq_t dest, const fmpq_t src);
void fmpq_div(fmpq_t res, const fmpq_t op1, const fmpq_t op2);

void acb_poly_fit_length(acb_poly_t poly, slong len);

void acb_poly_sub(acb_poly_t res, const acb_poly_t poly1,
              const acb_poly_t poly2, slong prec);
              
void acb_poly_add_si(acb_poly_t res, const acb_poly_t poly, slong c, slong prec);

void acb_poly_shift_right(acb_poly_t res, const acb_poly_t poly, slong n);

void acb_poly_shift_left(acb_poly_t res, const acb_poly_t poly, slong n);


void
acb_poly_scalar_mul(acb_poly_t res, const acb_poly_t poly, const acb_t c, slong prec);

void
arb_poly_scalar_mul(arb_poly_t res, const arb_poly_t poly, const arb_t c, slong prec);

void acb_poly_mul(acb_poly_t res, const acb_poly_t poly1,
              const acb_poly_t poly2, slong prec);
              
void acb_poly_zero(acb_poly_t poly);
 
void acb_poly_one(acb_poly_t poly);
  
void acb_poly_set_coeff_si(acb_poly_t poly, slong n, slong x);

void acb_poly_set_coeff_acb(acb_poly_t poly, slong n, const acb_t x);

void acb_poly_get_coeff_acb(acb_t x, const acb_poly_t poly, slong n);

void
acb_poly_set_acb(acb_poly_t poly, const acb_t c);

void acb_poly_set_arb_poly(acb_poly_t poly, const arb_poly_t re);

void
acb_sub_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec);

int arb_contains_zero(const arb_t x);
int arb_is_nonzero(const arb_t x);
int arb_is_positive(const arb_t x);
int arb_is_nonnegative(const arb_t x);
int arb_is_negative(const arb_t x);
int arb_is_nonpositive(const arb_t x);
int arb_contains_negative(const arb_t x);
int arb_contains_nonpositive(const arb_t x);
int arb_contains_positive(const arb_t x);
int arb_contains_nonnegative(const arb_t x);

void acb_poly_set(acb_poly_t dest, const acb_poly_t src);

int arb_equal_si(const arb_t x, slong y);
 
void fmpz_lcm(fmpz_t f, const fmpz_t g, const fmpz_t h);
void fmpz_gcd(fmpz_t f, const fmpz_t g, const fmpz_t h);

int fmpz_kronecker(const fmpz_t a, const fmpz_t n);

void fmpz_rfac_ui(fmpz_t r, const fmpz_t x, ulong n);
void fmpz_rfac_uiui(fmpz_t r, ulong x, ulong n);
 
int fmpz_equal(const fmpz_t f, const fmpz_t g);

void arb_poly_pow_ui(arb_poly_t res, const arb_poly_t poly, ulong exp, slong prec);

int fmpz_sgn(const fmpz_t f);

void fmpz_abs(fmpz_t f1, const fmpz_t f2);
void fmpz_neg(fmpz_t f1, const fmpz_t f2);

void fmpz_mul_ui(fmpz_t f, const fmpz_t g, ulong x);
void fmpz_mul_si(fmpz_t f, const fmpz_t g, slong x);
void fmpz_mul(fmpz_t f, const fmpz_t g, const fmpz_t h);

 ulong fmpz_popcnt(const fmpz_t a);
 void
fmpz_set_ui(fmpz_t f, ulong val);

 int arb_is_int(const arb_t x);
 
void fmpq_add(fmpq_t res, const fmpq_t op1, const fmpq_t op2);

 void arb_fac_ui(arb_t z, ulong n, slong prec);
void fmpz_add_si(fmpz_t f, const fmpz_t g, slong x);

void arb_hypgeom_rising_ui(arb_t res, const arb_t x, ulong n, slong prec);
void arb_hypgeom_rising(arb_t res, const arb_t x, const arb_t n, slong prec);

int arb_is_one(const arb_t f);

int fmpz_cmp(const fmpz_t f, const fmpz_t g);
void fmpz_sub_si(fmpz_t f, const fmpz_t g, slong x);
void arb_add_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec);
int fmpz_pow_fmpz(fmpz_t a, const fmpz_t b, const fmpz_t e);
void arb_mul_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec);
void arb_sub_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec);
void fmpz_fac_ui(fmpz_t f, ulong n);
void fmpz_rfac_ui(fmpz_t r, const fmpz_t x, ulong k);
void fmpz_rfac_uiui(fmpz_t r, ulong x, ulong k);

void fmpz_mul(fmpz_t f, const fmpz_t g, const fmpz_t h);
void fmpz_divexact(fmpz_t f, const fmpz_t g, const fmpz_t h);
void fmpz_add(fmpz_t f, const fmpz_t g, const fmpz_t h);
void fmpz_sub(fmpz_t f, const fmpz_t g, const fmpz_t h);
void arb_pow_fmpz(arb_t y, const arb_t b, const fmpz_t e, slong prec);
void arb_div_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec);

void arb_poly_integral(arb_poly_t res, const arb_poly_t poly, slong prec);
void arb_poly_derivative(arb_poly_t res, const arb_poly_t poly, slong prec);

void arb_rising(arb_t z, const arb_t x, const arb_t n, slong prec);
void arb_rising_ui(arb_t z, const arb_t x, ulong n, slong prec);

slong arb_poly_length(const arb_poly_t poly);

void arb_set_fmpz(arb_t x, const fmpz_t y);

int arb_poly_is_zero(const arb_poly_t z);

void arb_poly_neg(arb_poly_t res, const arb_poly_t poly);

void arb_poly_majorant(arb_poly_t res, const arb_poly_t poly, slong prec);

int arb_poly_equal(const arb_poly_t A, const arb_poly_t B);

int arb_poly_overlaps(const arb_poly_t poly1, const arb_poly_t poly2);

ulong fmpz_get_ui(const fmpz_t f);

slong fmpz_get_si(const fmpz_t f);

void fmpz_set(fmpz_t f, const fmpz_t g);

void fmpz_set_si(fmpz_t f, slong val);

 int fmpz_set_str(fmpz_t f, const char *str, int b);
 
 char *fmpz_get_str(char *str, int b, const fmpz_t f);
 
void fmpz_init(fmpz_t f) { *f = WORD(0); }
void fmpz_clear(fmpz_t f) { if (COEFF_IS_MPZ(*f)) _fmpz_clear_mpz(*f); }
 void fmpz_init2(fmpz_t f, ulong limbs);

slong arf_bits(const arf_t x);

void arb_poly_div_series(arb_poly_t Q, const arb_poly_t A, const arb_poly_t B, slong n, slong prec);

int arb_poly_divrem(arb_poly_t Q, arb_poly_t R,
                             const arb_poly_t A, const arb_poly_t B, slong prec);
                             
void arb_poly_get_coeff_ptr(arb_poly_t poly, slong n);
 
void arb_poly_get_coeff_arb(arb_t v, const arb_poly_t poly, slong n);

void arb_poly_set_coeff_arb(arb_poly_t poly, slong n, const arb_t c);
void arb_poly_set_coeff_si(arb_poly_t poly, slong n, slong c);

void arb_poly_set(arb_poly_t dest, const arb_poly_t src);
 
void _arb_poly_set_length(arb_poly_t poly, slong len);

void _arb_poly_normalise(arb_poly_t poly);

void arb_poly_scalar_mul(arb_poly_t res, const arb_poly_t poly, const arb_t c, slong prec);

void arb_poly_scalar_div(arb_poly_t res, const arb_poly_t poly, const arb_t c, slong prec);

void arb_poly_shift_left(arb_poly_t res, const arb_poly_t poly, slong n);

void arb_poly_shift_right(arb_poly_t res, const arb_poly_t poly, slong n);

void arb_poly_mul(arb_poly_t res, const arb_poly_t poly1,
              const arb_poly_t poly2, slong prec);
              
void arb_poly_add(arb_poly_t res, const arb_poly_t poly1,
              const arb_poly_t poly2, slong prec);

void arb_poly_sub(arb_poly_t res, const arb_poly_t poly1,
              const arb_poly_t poly2, slong prec);

void arb_poly_fit_length(arb_poly_t poly, slong len);
              
void acb_calc_gl_node(arb_t x, arb_t w, slong i, slong k, slong prec);
void arb_ceil(arb_t z, const arb_t x, slong prec);

void arb_mat_bound_frobenius_norm(mag_t b, const arb_mat_t A);
void arb_mat_bound_inf_norm(mag_t b, const arb_mat_t A);
void arb_mat_frobenius_norm(arb_t res, const arb_mat_t A, slong prec);

void
arb_mat_swap_rows(arb_mat_t mat, slong * perm, slong r, slong s)
{
    if (r != s)
    {
        arb_ptr u;
        slong t;

        if (perm != NULL)
        {
            t = perm[s];
            perm[s] = perm[r];
            perm[r] = t;
        }

        u = mat->rows[s];
        mat->rows[s] = mat->rows[r];
        mat->rows[r] = u;
    }
}

void arb_mat_scalar_mul_arb(arb_mat_t B, const arb_mat_t A, const arb_t c, slong prec)
{
    slong i, j;

    for (i = 0; i < arb_mat_nrows(A); i++)
        for (j = 0; j < arb_mat_ncols(A); j++)
            arb_mul(arb_mat_entry(B, i, j), arb_mat_entry(A, i, j), c, prec);
}

int arb_mat_lu(slong * P, arb_mat_t LU, const arb_mat_t A, slong prec);

void acb_dirichlet_lerch_phi(acb_t res, const acb_t z, const acb_t s, const acb_t a, slong prec);

void arb_poly_product_roots(arb_poly_t poly, arb_srcptr xs, slong n, slong prec);
void arb_poly_clear(arb_poly_t poly);
void arb_poly_evaluate2(arb_t y, arb_t z, const arb_poly_t f, const arb_t x, slong prec);
void arb_poly_fit_length(arb_poly_t poly, slong len);
void arb_poly_evaluate(arb_t res, const arb_poly_t f, const arb_t a, slong prec); 
void arb_poly_init(arb_poly_t poly);

void arb_poly_init2(arb_poly_t poly, slong len);


void arb_poly_swinnerton_dyer_ui(arb_poly_t poly, ulong n, slong prec);
 
void arb_sec(arb_t res, const arb_t x, slong prec);
void arb_csc(arb_t res, const arb_t x, slong prec);
void arb_csc_pi(arb_t res, const arb_t x, slong prec);
void arb_sech(arb_t res, const arb_t x, slong prec);
void arb_csch(arb_t res, const arb_t x, slong prec);

void _arb_vec_set(arb_ptr res, arb_srcptr vec, slong len);

void acb_dft_convol(acb_ptr w, acb_srcptr f, acb_srcptr g, slong len, slong prec);
 
void arb_mat_neg(arb_mat_t dest, const arb_mat_t src);

void arb_mat_add(arb_mat_t res, const arb_mat_t mat1, const arb_mat_t mat2, slong prec);

void arb_mat_sub(arb_mat_t res, const arb_mat_t mat1, const arb_mat_t mat2, slong prec);

void arb_mat_mul(arb_mat_t res, const arb_mat_t mat1, const arb_mat_t mat2, slong prec);

void arb_hypgeom_bessel_j(arb_t res, const arb_t nu, const arb_t z, slong prec);

int arb_is_exact(const arb_t x);
int acb_is_exact(const acb_t z);

int arb_eq(const arb_t x, const arb_t y);
int arb_ne(const arb_t x, const arb_t y);
int arb_lt(const arb_t x, const arb_t y);
int arb_le(const arb_t x, const arb_t y);
int arb_gt(const arb_t x, const arb_t y);
int arb_ge(const arb_t x, const arb_t y);

void acb_hypgeom_legendre_p(acb_t res, const acb_t n, const acb_t m, const acb_t z, int type, slong prec);
void acb_hypgeom_legendre_q(acb_t res, const acb_t n, const acb_t m, const acb_t z, int type, slong prec);
void acb_hypgeom_legendre_p_uiui_rec(acb_t res, ulong n, ulong m, const acb_t z, slong prec);
void acb_hypgeom_spherical_y(acb_t res, slong n, slong m, const acb_t theta, const acb_t phi, slong prec);
void arb_hypgeom_legendre_p(arb_t res, const arb_t n, const arb_t m, const arb_t z, int type, slong prec);
void arb_hypgeom_legendre_q(arb_t res, const arb_t n, const arb_t m, const arb_t z, int type, slong prec);
void arb_hypgeom_legendre_p_ui_deriv_bound(mag_t dp, mag_t dp2, ulong n, const arb_t x, const arb_t x2sub1);
void arb_hypgeom_legendre_p_ui_zero(arb_t res, arb_t res_prime, ulong n, const arb_t x, slong K, slong prec);
void arb_hypgeom_legendre_p_ui_one(arb_t res, arb_t res_prime, ulong n, const arb_t x, slong K, slong prec);
void arb_hypgeom_legendre_p_ui_asymp(arb_t res, arb_t res_prime, ulong n, const arb_t x, slong K, slong prec);
void arb_hypgeom_legendre_p_ui(arb_t res, arb_t res_prime, ulong n, const arb_t x, slong prec);    
void acb_hypgeom_bessel_j(acb_t res, const acb_t nu, const acb_t z, slong prec);
void arb_hypgeom_legendre_p_ui_root(arb_t res, arb_t weight, ulong n, ulong k, slong prec);

void acb_hypgeom_coulomb(acb_t F, acb_t G, acb_t Hpos, acb_t Hneg, const acb_t l, const acb_t eta, const acb_t z, slong prec);

void arb_add_si(arb_t z, const arb_t x, slong y, slong prec);
void arb_sub_si(arb_t z, const arb_t x, slong y, slong prec);

void acb_sub_arb(acb_t z, const acb_t x, const arb_t y, slong prec);

void acb_addmul(acb_t z, const acb_t x, const acb_t y, slong prec);

void acb_addmul_ui(acb_t z, const acb_t x, ulong y, slong prec);
void acb_addmul_si(acb_t z, const acb_t x, slong y, slong prec);
void acb_addmul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec);


void arb_addmul(arb_t z, const arb_t x, const arb_t y, slong prec);
void arb_addmul_arf(arb_t z, const arb_t x, const arf_t y, slong prec);
void arb_addmul_si(arb_t z, const arb_t x, slong y, slong prec);
void arb_addmul_ui(arb_t z, const arb_t x, ulong y, slong prec);
void arb_addmul_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec);

void arb_submul(arb_t z, const arb_t x, const arb_t y, slong prec);
void arb_submul_arf(arb_t z, const arb_t x, const arf_t y, slong prec);
void arb_submul_si(arb_t z, const arb_t x, slong y, slong prec);
void arb_submul_ui(arb_t z, const arb_t x, ulong y, slong prec);
void arb_submul_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec);

jlong bufferAddress (jobject buffer);

 void arf_abs(arf_t y, const arf_t x);

void acb_lambertw_asymp(acb_t res, const acb_t z, const fmpz_t k, slong L, slong M, slong prec);
int acb_lambertw_check_branch(const acb_t w, const fmpz_t k, slong prec);
void acb_lambertw_bound_deriv(mag_t res, const acb_t z, const acb_t ez1, const fmpz_t k);
void acb_lambertw(acb_t res, const acb_t z, const fmpz_t k, int flags, slong prec);

void arb_get_abs_ubound_arf(arf_t u, const arb_t x, slong prec);
void arb_get_abs_lbound_arf(arf_t u, const arb_t x, slong prec);
void arb_get_ubound_arf(arf_t u, const arb_t x, slong prec);
void arb_get_lbound_arf(arf_t u, const arb_t x, slong prec);

void arb_nonnegative_part(arb_t res, const arb_t x);

slong arb_rel_error_bits(const arb_t x);

slong arb_rel_accuracy_bits(const arb_t x)
{
    return -arb_rel_error_bits(x);
}

slong arb_rel_one_accuracy_bits(const arb_t x);

slong arb_bits(const arb_t x)
{
    return arf_bits(arb_midref(x));
}

void _arb_vec_neg(arb_ptr B, arb_srcptr A, slong n);
 
void _arb_vec_scalar_addmul(arb_ptr res, arb_srcptr vec, slong len, const arb_t c, slong prec);
 
void _arb_vec_sub(arb_ptr C, arb_srcptr A, arb_srcptr B, slong n, slong prec);
 
void acb_addmul(acb_t z, const acb_t x, const acb_t y, slong prec);
void arb_mat_mul_entrywise(arb_mat_t res, const arb_mat_t mat1, const arb_mat_t mat2, slong prec);

void acb_submul(acb_t z, const acb_t x, const acb_t y, slong prec);

void arb_sinh(arb_t z, const arb_t x, slong prec);
void arb_cosh(arb_t z, const arb_t x, slong prec);

void arb_addmul(arb_t z, const arb_t x, const arb_t y, slong prec);
 
void arb_mat_det_lu(arb_t det, const arb_mat_t A, slong prec);
void arb_mat_det_precond(arb_t det, const arb_mat_t A, slong prec);
void arb_mat_det(arb_t det, const arb_mat_t A, slong prec);


int ftruncate (int fd, off_t length);

void acb_hypgeom_bessel_j_0f1(acb_t res, const acb_t nu, const acb_t z, slong prec);
void acb_hypgeom_bessel_j_asymp(acb_t res, const acb_t nu, const acb_t z, slong prec);
void acb_hypgeom_bessel_j(acb_t res, const acb_t nu, const acb_t z, slong prec);

void acb_hypgeom_bessel_i_0f1(acb_t res, const acb_t nu, const acb_t z, int scaled, slong prec);
void acb_hypgeom_bessel_i_asymp(acb_t res, const acb_t nu, const acb_t z, int scaled, slong prec);
void acb_hypgeom_bessel_i(acb_t res, const acb_t nu, const acb_t z, slong prec);
void acb_hypgeom_bessel_i_scaled(acb_t res, const acb_t nu, const acb_t z, slong prec);

void acb_hypgeom_bessel_k_0f1(acb_t res, const acb_t nu, const acb_t z, int scaled, slong prec);
void acb_hypgeom_bessel_k_0f1_series(acb_poly_t res, const acb_poly_t n, const acb_poly_t z, int scaled, slong len, slong prec);
void acb_hypgeom_bessel_k_asymp(acb_t res, const acb_t nu, const acb_t z, int scaled, slong prec);
void acb_hypgeom_bessel_k(acb_t res, const acb_t nu, const acb_t z, slong prec);
void acb_hypgeom_bessel_k_scaled(acb_t res, const acb_t nu, const acb_t z, slong prec);

void acb_hypgeom_bessel_y(acb_t res, const acb_t nu, const acb_t z, slong prec);
void acb_hypgeom_bessel_jy(acb_t res1, acb_t res2, const acb_t nu, const acb_t z, slong prec);


void acb_hypgeom_beta_lower_series(acb_poly_t res, const acb_t a, const acb_t b, const acb_poly_t z, int regularized, slong n, slong prec);
void acb_hypgeom_beta_lower(acb_t res, const acb_t a, const acb_t b, const acb_t z, int regularized, slong prec);
void acb_hypgeom_gamma_upper(acb_t res, const acb_t s, const acb_t z, int regularized, slong prec);
void acb_hypgeom_gamma_lower(acb_t res, const acb_t s, const acb_t z, int regularized, slong prec);
    
int arb_mat_overlaps(const arb_mat_t mat1, const arb_mat_t mat2);
int arb_mat_contains(const arb_mat_t mat1, const arb_mat_t mat2);
void arb_mat_set(arb_mat_t dest, const arb_mat_t src);
int arb_mat_eq(const arb_mat_t mat1, const arb_mat_t mat2);
int arb_mat_ne(const arb_mat_t mat1, const arb_mat_t mat2);
void arb_mat_zero(arb_mat_t mat);
void arb_mat_one(arb_mat_t mat);
    
void arb_mat_transpose(arb_mat_t mat1, const arb_mat_t mat2);

void arb_mat_mul(arb_mat_t res, const arb_mat_t mat1, const arb_mat_t mat2, slong prec);
 
void arb_mat_printd(const arb_mat_t mat, slong digits);

int arb_mat_inv(arb_mat_t X, const arb_mat_t A, slong prec);
 void fmpq_one(fmpq_t res);
   
int getpagesize(void);
void *memalign(size_t alignment, size_t size);
       
int errorNumber();
int mprotect (void *addr, size_t len, int prot);

// TODO: use {@link MemorySegment#allocateNative(java.lang.foreign.MemoryLayout, java.lang.foreign.MemorySession)} instead of {@link arblibJNI#memalign(long, long)}

void *memset(void *s, int c, size_t n);

void arb_dot_simple(arb_t res, const arb_t initial, int subtract,
arb_srcptr x, slong xstep, arb_srcptr y, slong ystep, slong len, slong prec);
void arb_dot_precise(arb_t res, const arb_t initial, int subtract,
arb_srcptr x, slong xstep, arb_srcptr y, slong ystep, slong len, slong prec);
void arb_dot(arb_t res, const arb_t initial, int subtract,
arb_srcptr x, slong xstep, arb_srcptr y, slong ystep, slong len, slong prec);

void arb_hypgeom_chebyshev_t(arb_t res, const arb_t nu, const arb_t z, slong prec);
void arb_hypgeom_chebyshev_u(arb_t res, const arb_t nu, const arb_t z, slong prec);
void arb_hypgeom_jacobi_p(arb_t res, const arb_t n, const arb_t a, const arb_t b, const arb_t z, slong prec);
void arb_hypgeom_gegenbauer_c(arb_t res, const arb_t n, const arb_t m, const arb_t z, slong prec);
void arb_hypgeom_laguerre_l(arb_t res, const arb_t n, const arb_t m, const arb_t z, slong prec);
void arb_hypgeom_hermite_h(arb_t res, const arb_t nu, const arb_t z, slong prec);
void arb_hypgeom_legendre_p(arb_t res, const arb_t n, const arb_t m, const arb_t z, int type, slong prec);
void arb_hypgeom_legendre_q(arb_t res, const arb_t n, const arb_t m, const arb_t z, int type, slong prec);

void arb_hypgeom_legendre_p_ui_deriv_bound(mag_t dp, mag_t dp2, ulong n, const arb_t x, const arb_t x2sub1);
void arb_hypgeom_legendre_p_ui_rec(arb_t res, arb_t res_prime, ulong n, const arb_t x, slong prec);
void arb_hypgeom_legendre_p_ui_asymp(arb_t res, arb_t res2, ulong n, const arb_t x, slong K, slong prec);
void arb_hypgeom_legendre_p_ui_one(arb_t res, arb_t res2, ulong n, const arb_t x, slong K, slong prec);
void arb_hypgeom_legendre_p_ui_zero(arb_t res, arb_t res2, ulong n, const arb_t x, slong K, slong prec);
void arb_hypgeom_legendre_p_ui(arb_t res, arb_t res_prime, ulong n, const arb_t x, slong prec);


void arb_hypgeom_legendre_p_ui_root(arb_t res, arb_t weight, ulong n, ulong k, slong prec);

void arb_hypgeom_central_bin_ui(arb_t res, ulong n, slong prec);

void arb_hypgeom_dilog(arb_t res, const arb_t z, slong prec);


void acb_dft_rad2_precomp(acb_ptr w, acb_srcptr v, const acb_dft_rad2_t t, slong prec);

void acb_dirichlet_xi(acb_t res, const acb_t s, slong prec);
 
void arb_hypgeom_erfinv(arb_t res, const arb_t z, slong prec);

void arb_hypgeom_erfcinv(arb_t res, const arb_t z, slong prec);

void acb_hypgeom_erf(acb_t res, const acb_t z, slong prec);

void arb_hypgeom_erf(arb_t res, const arb_t z, slong prec);

void arb_hypgeom_erfc(arb_t res, const arb_t z, slong prec);

void arb_hypgeom_m(arb_t res, const arb_t a, const arb_t b, const arb_t z, int regularized, slong prec);

int arf_div(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);
 
void gmp_randclear (gmp_randstate_t state);

void arb_hypgeom_hermite_h(arb_t res, const arb_t nu, const arb_t z, slong prec);
void acb_hypgeom_hermite_h(acb_t res, const acb_t n, const acb_t z, slong prec);
 

void gmp_randinit_mt (gmp_randstate_t state);

void gmp_randinit_default (gmp_randstate_t);

void gmp_randseed_ui (gmp_randstate_t, unsigned long int);
 
void arb_urandom(arb_t x, flint_rand_t state, slong prec);
 
void arb_log(arb_t z, const arb_t x, slong prec);

void arb_exp(arb_t z, const arb_t x, slong prec);

void _acb_dirichlet_hardy_z_series(acb_ptr res, acb_srcptr s, slong slen, const dirichlet_group_t G, const dirichlet_char_t chi, slong len, slong prec);

void acb_dirichlet_hardy_z_series(acb_poly_t res, const acb_poly_t s, const dirichlet_group_t G, const dirichlet_char_t chi, slong len, slong prec);

void acb_dirichlet_hardy_z_zero(arb_t res, const fmpz_t n, slong prec);
 
void acb_sinh(acb_t y, const acb_t x, slong prec);

void acb_elliptic_f(acb_t res, const acb_t phi, const acb_t m, int times_pi, slong prec);

void arb_sech(arb_t res, const arb_t x, slong prec);

void acb_sech(acb_t r, const acb_t z, slong prec);

void acb_hypgeom_legendre_p_uiui_rec(acb_t res, ulong n, ulong m, const acb_t z, slong prec);
void acb_hypgeom_legendre_p(acb_t res, const acb_t n, const acb_t m, const acb_t z, int type, slong prec);
void acb_hypgeom_legendre_q(acb_t res, const acb_t n, const acb_t m, const acb_t z, int type, slong prec);
void acb_hypgeom_jacobi_p(acb_t res, const acb_t n, const acb_t a, const acb_t b, const acb_t z, slong prec);
void acb_hypgeom_gegenbauer_c(acb_t res, const acb_t n, const acb_t m, const acb_t z, slong prec);
void acb_hypgeom_laguerre_l(acb_t res, const acb_t n, const acb_t m, const acb_t z, slong prec);
void acb_hypgeom_hermite_h(acb_t res, const acb_t n, const acb_t z, slong prec);
void acb_hypgeom_chebyshev_t(acb_t res, const acb_t n, const acb_t z, slong prec);
void acb_hypgeom_chebyshev_u(acb_t res, const acb_t n, const acb_t z, slong prec);
void acb_hypgeom_spherical_y(acb_t res, slong n, slong m, const acb_t theta, const acb_t phi, slong prec);

void acb_tan(acb_t r, const acb_t z, slong prec);

void acb_sec(acb_t y, const acb_t x, slong prec);

void arb_add_ui(arb_t z, const arb_t x, ulong y, slong prec);

void arb_sub_si(arb_t z, const arb_t x, slong y, slong prec);
 
void arb_sub_ui(arb_t z, const arb_t x, ulong y, slong prec);

void mag_div(mag_t z, const mag_t x, const mag_t y);

void mag_log(mag_t z, const mag_t x);

void mag_inv(mag_t res, const mag_t x);

int arf_is_zero(const arf_t x);

void acb_add_arb(acb_t z, const acb_t x, const arb_t y, slong prec);

void arb_mul_ui(arb_t z, const arb_t x, ulong y, slong prec);
 
void arb_mul_si(arb_t z, const arb_t x, ulong y, slong prec);

void arb_mul_si(arb_t z, const arb_t x, slong y, slong prec);
void arb_mul_ui(arb_t z, const arb_t x, ulong y, slong prec);

void dirichlet_group_init(dirichlet_group_t G, ulong q);
void dirichlet_subgroup_init(dirichlet_group_t H, const dirichlet_group_t G, ulong h);
void dirichlet_group_clear(dirichlet_group_t G);

void dirichlet_char_init(dirichlet_char_t x, const dirichlet_group_t G);

void dirichlet_char_clear(dirichlet_char_t x);
int arb_mat_cho(arb_mat_t L, const arb_mat_t A, slong prec);
void arb_mat_solve_cho_precomp(arb_mat_t X, const arb_mat_t L, const arb_mat_t B, slong prec);
int arb_mat_spd_solve(arb_mat_t X, const arb_mat_t A, const arb_mat_t B, slong prec);
void arb_mat_inv_cho_precomp(arb_mat_t X, const arb_mat_t L, slong prec);
int arb_mat_spd_inv(arb_mat_t X, const arb_mat_t A, slong prec);
int arb_mat_ldl(arb_mat_t res, const arb_mat_t A, slong prec);

void arb_mat_solve_ldl_precomp(arb_mat_t X, const arb_mat_t L, const arb_mat_t B, slong prec);
void arb_mat_inv_ldl_precomp(arb_mat_t X, const arb_mat_t L, slong prec);
void acb_mat_dft(acb_mat_t mat, int type, slong prec);

int acb_mat_eig_multiple(acb_ptr E, const acb_mat_t A, acb_srcptr E_approx, const acb_mat_t R_approx, slong prec);
          
void arb_mat_clear(arb_mat_t mat);
void acb_mat_clear(acb_mat_t mat);

void arb_mat_init(arb_mat_t mat, slong r, slong c);

void arb_mat_clear(arb_mat_t mat);
void arb_mat_transpose(arb_mat_t dest, const arb_mat_t src);
void acb_poly_clear(acb_poly_t poly);

arb_ptr arb_mat_entry_ptr(arb_mat_t mat, slong i, slong j);

void flint_cleanup(void);
void flint_cleanup_master(void);



extern "C" {

void acb_calc_gl_node(arb_t x, arb_t w, slong i, slong k, slong prec);

int arf_cmp(const arf_t x, const arf_t y);
 
void acb_one(acb_t z);
 
int arb_is_zero(const arb_t z);

int acb_is_zero(const acb_t z);

void acb_div_si(acb_t z, const acb_t x, slong c, slong prec);

void acb_neg(acb_t z, const acb_t x);

int acb_equal(const acb_t x, const acb_t y);

int arb_equal(const arb_t x, const arb_t y);

void arb_set_si(arb_t x, slong y);

void mag_set_d(mag_t res, double x);
 
void acb_dft_inverse_precomp(acb_ptr w, acb_srcptr v, const acb_dft_pre_t pre, slong prec);
 
void acb_dft_precomp(acb_ptr w, acb_srcptr v, const acb_dft_pre_t pre, slong prec);
 
void acb_dft_precomp_clear(acb_dft_pre_t pre);
 
void acb_dft_precomp_init(acb_dft_pre_t pre, slong len, slong prec);
 
void acb_dft_inverse(acb_ptr w, acb_srcptr v, slong n, slong prec);
 
void acb_dft(acb_ptr w, acb_srcptr v, slong n, slong prec);
 
int acb_is_real(const acb_t x);

void mag_swap(mag_t x, mag_t y);

void acb_swap(acb_t z, acb_t x);

void mag_max(mag_t z, const mag_t x, const mag_t y);

void mag_mul_2exp_si(mag_t z, const mag_t x, slong y);

void acb_get_mag_lower(mag_t z, const acb_t x);

void arb_get_mag_lower(mag_t z, const arb_t x);

mag_ptr _mag_vec_init(slong n);

void arb_get_interval_arf(arf_t a, arf_t b, const arb_t x, slong prec);

void arb_tan(arb_t y, const arb_t x, slong prec);

void acb_inv(acb_t res, const acb_t z, slong prec);

void arb_inv(arb_t z, const arb_t x, slong prec);
 
slong arb_allocated_bytes(const arb_t x);

void arf_set_mag(arf_t y, const mag_t x);

void arf_mag_add_ulp(mag_t z, const mag_t x, const arf_t y, slong prec);

void arb_printd(const arb_t x, slong digits);

int arf_is_pos_inf(const arf_t x);

int arf_is_neg_inf(const arf_t x);

int arf_sgn(const arf_t x);

int arf_is_nan(const arf_t x);

int arf_equal(const arf_t x, const arf_t y);

int arf_is_inf(const arf_t x);

void arb_get_mag(mag_t z, const arb_t x);

void mag_sub_lower(mag_t z, const mag_t x, const mag_t y);

void arb_add_error_mag(arb_t x, const mag_t err);

void arb_add_error_arf(arb_t x, const arf_t err);

void arb_add_error_2exp_si(arb_t x, slong err);

void arb_add_error_2exp_fmpz(arb_t x, const fmpz_t err);

void arb_add_error(arb_t x, const arb_t error);

 void
arb_pow_si(arb_t res, const arb_t x, slong y, slong prec);


void arb_add_error_ulp(arb_t x, slong n)
{
    if (n < 0)
    {
        if (n < -1)
            flint_error("arb_add_error_ulp: negative n > -2");
        n = -n;
        arb_mul_2exp_si(x, x, -n);
        arb_sub_error(x, x);
        arb_div_2exp_si(x, x, n);
    }
    else if (n > 0)
    {
        arb_mul_2exp_si(x, x, n);
        arb_add_error(x, x);
        arb_div_2exp_si(x, x, n);
    }
};

void mag_div(mag_t z, const mag_t x, const mag_t y);

void mag_mul_ui_lower(mag_t z, const mag_t x, ulong y);

void mag_sub(mag_t z, const mag_t x, const mag_t y);

double mag_get_d(const mag_t z);

void acb_zero(acb_t z);

void acb_sub(acb_t z, const acb_t x, const acb_t y, slong prec);

void acb_addmul_arb(acb_t z, const acb_t x, const arb_t y, slong prec);

void mag_add_lower(mag_t z, const mag_t x, const mag_t y);

void mag_mul_lower(mag_t z, const mag_t x, const mag_t y);

void acb_add_error_mag(acb_t x, const mag_t err);

void arb_neg(arb_t y, const arb_t x);

void arf_interval_swap(arf_interval_t v, arf_interval_t u);

void arb_set_arf(arb_t x, const arf_t y);


void mag_one(mag_t x);

void mag_mul_2exp_si(mag_t z, const mag_t x, slong y);

void mag_clear(mag_t x);

void mag_inf(mag_t x);

void acb_mul_2exp_si(acb_t z, const acb_t x, slong e);

void acb_indeterminate(acb_t x);

int arb_is_positive(const arb_t x);

int arb_is_negative(const arb_t x);

int arb_is_nonnegative(const arb_t x);

int arb_is_nonpositive(const arb_t x);

void mag_sqrt(mag_t y, const mag_t x);
void mag_sqrt_lower(mag_t y, const mag_t x);
void mag_rsqrt(mag_t y, const mag_t x);
void mag_rsqrt_lower(mag_t y, const mag_t x);

void mag_root(mag_t y, const mag_t x, ulong n);

void mag_hypot(mag_t z, const mag_t x, const mag_t y);

void mag_binpow_uiui(mag_t b, ulong m, ulong n);

void mag_polylog_tail(mag_t u, const mag_t z, slong sigma, ulong d, ulong N);

void mag_geom_series(mag_t res, const mag_t x, ulong n);

void mag_hurwitz_zeta_uiui(mag_t res, ulong s, ulong a);

void mag_set_ui(mag_t z, ulong x);
void mag_set_ui_lower(mag_t z, ulong x);


void mag_set(mag_t x, const mag_t y);

void mag_pow_ui_lower(mag_t z, const mag_t x, ulong e);

void arf_mul_2exp_si(arf_t y, const arf_t x, slong e);

void arf_interval_set(arf_interval_t v, const arf_interval_t u);

void arf_interval_get_arb(arb_t x, const arf_interval_t v, slong prec);

int arb_sgn_nonzero(const arb_t x);

void acb_poly_derivative(acb_poly_t res, const acb_poly_t poly, slong prec);
void acb_poly_integral(acb_poly_t res, const acb_poly_t poly, slong prec);
 
void acb_poly_product_roots(acb_poly_t poly, acb_srcptr xs, slong n, slong prec);
 
void acb_poly_evaluate(acb_t y, const acb_poly_t f, const acb_t x, slong prec);
 
void acb_poly_evaluate2(acb_t y, acb_t z, const acb_poly_t f, const acb_t x, slong prec);

void flint_free(void * ptr);
                            
void arb_mat_init(arb_mat_t mat, slong r, slong c);
  
  void acb_get_mag(mag_t u, const acb_t z);

 void acb_mat_init(acb_mat_t mat, slong r, slong c);
 
void acb_dot(acb_t res, const acb_t initial, int subtract, acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec);

void acb_poly_interpolate_newton(acb_poly_t poly, acb_srcptr xs, acb_srcptr ys, slong n, slong prec);
    
void arf_zero(arf_t x);

void acb_cosh(acb_t y, const acb_t x, slong prec);

void arf_neg(arf_t y, const arf_t x);

int arf_mul_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd);

int arf_mul_rnd_any(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

int arf_mul_rnd_down(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec);

void * flint_malloc(size_t size);
void * flint_realloc(void * ptr, size_t size);
void * flint_calloc(size_t num, size_t size);

%apply double *OUTPUT { double *R };
%apply double *OUTPUT { double *G };
%apply double *OUTPUT { double *B };

 void acb_set_d(acb_t z, double c);

 void acb_dirichlet_zeta_jet(acb_t res, const acb_t s, int deflate, slong len, slong prec);
 
 void acb_dirichlet_hardy_z(acb_ptr res, 
                                  const acb_t t, 
								  const dirichlet_group_t G, 
								  const dirichlet_char_t chi,
								  slong len, 
								  slong prec);
	
 void acb_print(const acb_t x);
	 			  
 char *arb_get_str(const arb_t x, slong n, ulong flags);

char * arf_get_str(const arf_t x, slong d);

 double arf_get_d(const arf_t x, arf_rnd_t rnd);

 void arf_set_d(arf_t x, double v);

 int arf_sub(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

 void acb_conj(acb_t z, const acb_t x);
 
void arb_floor(arb_t y, const arb_t x, slong prec);

void arb_div(arb_t z, const arb_t x, const arb_t y, slong prec);

 void acb_div_si(acb_t z, const acb_t x, slong y, slong prec);
 
 void arb_sin(arb_t s, const arb_t x, slong prec);

 void arb_cos(arb_t s, const arb_t x, slong prec);

void arb_mul(arb_t z, const arb_t x, const arb_t y, slong prec);

slong arf_abs_bound_lt_2exp_si(const arf_t x);

void arb_mul_2exp_si(arb_t y, const arb_t x, slong e);

void arb_get_abs_ubound_arf(arf_t u, const arb_t x, slong prec);
void acb_mul_si(acb_t z, const acb_t x, slong y, slong prec);

 
 int arf_mul_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd);

int
arf_mul_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd);

 int arf_div_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd);

 int mag_cmp(const mag_t x, const mag_t y);

 void arb_swap(arb_t x, arb_t y);

 void mag_init(mag_t x);
 
 void mag_add(mag_t z, const mag_t x, const mag_t y);
 
 void arf_set(arf_t y, const arf_t x);

 void mag_pow_ui(mag_t res, const mag_t x, ulong e);
 
 void mag_mul(mag_t z, const mag_t x, const mag_t y);

 void arf_get_mag(mag_t y, const arf_t x);

 int arf_add(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

 slong acb_rel_accuracy_bits(const acb_t x);

 void acb_dirichlet_hardy_z(acb_ptr res, const acb_t t, const dirichlet_group_t G, const dirichlet_char_t chi, slong len, slong prec);

 slong arb_bits(const arb_t x);
 
 void acb_pow_ui(acb_t y, const acb_t b, ulong e, slong prec);

 void acb_add_ui(acb_t z, const acb_t x, ulong c, slong prec);

 void acb_log(acb_t r, const acb_t z, slong prec);

 void acb_tanh(acb_t y, const acb_t x, slong prec);

 void arb_set_d(arb_t x, double y);
        
 void acb_dirichlet_hurwitz(acb_t res, const acb_t s, const acb_t a, slong prec);

 void acb_dirichlet_hardy_theta(acb_ptr res, const acb_t t, const dirichlet_group_t G, const dirichlet_char_t chi, slong len, slong prec);

 void acb_mul(acb_t z, const acb_t x, const acb_t y, slong prec);

void acb_cos(acb_t r, const acb_t z, slong prec);

void acb_sin(acb_t r, const acb_t z, slong prec);

 void acb_exp(acb_t y, const acb_t z, slong prec);
  
 void arb_add(arb_t z, const arb_t x, const arb_t y, slong prec);
  
 void arb_sub(arb_t z, const arb_t x, const arb_t y, slong prec);
  
 void acb_arg(arb_t r, const acb_t z, slong prec);
  
 void acb_modular_eisenstein(acb_ptr r, const acb_t tau, slong len, slong prec);
 
 void acb_pow_arb(acb_t z, const acb_t x, const arb_t y, slong prec);
  
 void acb_pow(acb_t z, const acb_t x, const acb_t y, slong prec);

 int arb_contains(const arb_t x, const arb_t y);

int arb_contains_zero(const arb_t x);

 int arb_set_str(arb_t res, const char *inp, slong prec);
  
 int arb_overlaps(const arb_t x, const arb_t y);

  acb_ptr _acb_vec_init(slong n);

  arb_ptr _arb_vec_init(slong n);

  void _acb_vec_clear(acb_ptr v, slong n);

 void acb_mul_ui(acb_t z, const acb_t x, ulong y, slong prec);

 void acb_mul(acb_t z, const acb_t x, const acb_t y, slong prec);

 void acb_set(acb_t z, const acb_t x);

  void acb_clear(acb_t x);

void mag_clear(mag_t x);

void arb_clear(arb_t x);

 void acb_add(acb_t z, const acb_t x, const acb_t y, slong prec);

 void acb_sub_ui(acb_t z, const acb_t x, ulong y, slong prec);

 void acb_add_ui(acb_t z, const acb_t x, ulong y, slong prec);

 void acb_div(acb_t z, const acb_t x, const acb_t y, slong prec);

 void acb_sub(acb_t z, const acb_t x, const acb_t y, slong prec);

 arb_ptr _arb_vec_init(slong n);
 void _arb_vec_clear(arb_ptr v, slong n);
 void acb_mul_onei(acb_t z, const acb_t x);
 void acb_div_onei(acb_t z, const acb_t x);
 void acb_neg(acb_t z, const acb_t x);
 void arb_pow_ui(arb_t y, const arb_t b, ulong e, slong prec);
void arb_pow(arb_t z, const arb_t x, const arb_t y, slong prec);

void acb_abs(arb_t r, const acb_t z, slong prec);
 
void arb_sqrt(arb_t z, const arb_t x, slong prec);
 
void acb_sqr(acb_t z, const acb_t x, slong prec);
  
int acb_contains(const acb_t x, const acb_t y);

int acb_overlaps(const acb_t x, const acb_t y);
   
int acb_contains_zero(const acb_t x); 


 slong acb_allocated_bytes(const acb_t x);
 
 void acb_mul_arb(acb_t z, const acb_t x, const arb_t y, slong prec);
 void acb_div_arb(acb_t z, const acb_t x, const arb_t y, slong prec);
 
 void acb_neg(acb_t z, const acb_t x); 
 void arb_set(arb_t z, const arb_t x);
 
 void acb_elliptic_k(acb_t res, const acb_t m, slong prec);

int
arb_get_unique_fmpz(fmpz_t z, const arb_t x);


   
void acb_get_mid(acb_t m, const acb_t x);
                                       
void arb_const_pi(arb_t z, slong prec);

int arb_is_finite(const arb_t z);

int acb_is_finite(const acb_t z);

 void arb_abs(arb_t y, const arb_t x);
  
   void arb_zero(arb_t x);
   
    void arb_one(arb_t f);
    
    void arb_pos_inf(arb_t x);
    
  void arb_neg_inf(arb_t x);
 
 
 void arb_zero_pm_inf(arb_t x);
 
  void arb_indeterminate(arb_t x);
  
   void arb_zero_pm_one(arb_t x);
   
    slong arb_rel_accuracy_bits(const arb_t x);
    
    void arb_unit_interval(arb_t x);
    
    void mag_zero(mag_t res);
    
   void arb_div_si(arb_t z, const arb_t x, slong y, slong prec);
   
  void arb_trim(arb_t y, const arb_t x);


void arb_bin_ui(arb_t z, const arb_t n, ulong k, slong prec);

void arb_bin_uiui(arb_t z, ulong n, ulong k, slong prec);
  
   void arb_set_interval_mag(arb_t x, const mag_t a, const mag_t b, slong prec);

void arb_sub(arb_t z, const arb_t x, const arb_t y, slong prec);

void acb_modular_theta_series(acb_poly_t theta1, acb_poly_t theta2, acb_poly_t theta3, acb_poly_t theta4, const acb_poly_t z, const acb_t tau, slong len, slong prec);

 void acb_poly_init(acb_poly_t poly);
 
 void arf_clear(arf_t x);
 
void arb_init(arb_t x);

void arf_init(arf_t x);

void acb_init(acb_t x);
 
  void arb_tanh(arb_t y, const arb_t x, slong prec);

  void arb_asinh(arb_t z, const arb_t x, slong prec);
 
  void arb_acosh(arb_t z, const arb_t x, slong prec);
  
  void arb_lambertw(arb_t res, const arb_t x, int flags, slong prec);
  
  void arb_gamma(arb_t z, const arb_t x, slong prec);
  
  void arb_lgamma(arb_t z, const arb_t x, slong prec);
  
  void arb_sqr(arb_t y, const arb_t x, slong prec);
  
  void acb_sqrt(acb_t y, const acb_t x, slong prec);
  
void arb_atan(arb_t z, const arb_t x, slong prec);
void arb_atan2(arb_t z, const arb_t b, const arb_t a, slong prec);
void arb_asin(arb_t z, const arb_t x, slong prec);
void arb_acos(arb_t z, const arb_t x, slong prec);
void arb_atanh(arb_t z, const arb_t x, slong prec);
void arb_asinh(arb_t z, const arb_t x, slong prec);
void arb_acosh(arb_t z, const arb_t x, slong prec);
}
