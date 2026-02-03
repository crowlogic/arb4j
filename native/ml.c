/*
 * Mittag-Leffler E_{alpha,beta}(z) - Complete Implementation
 * FLINT/Arb arbitrary precision
 *
 * Build: gcc -O3 -march=native -Wall -o ml ml.c -lflint -lmpfr -lgmp -lm
 * Run:   ./ml test
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <limits.h>

#include "flint/flint.h"
#include "flint/fmpz.h"
#include "arb.h"
#include "acb.h"

#ifndef WORD_MAX
#define WORD_MAX LONG_MAX
#endif
#define ML_SLONG_MAX WORD_MAX

/* ======================== Data Structures ======================== */

typedef struct {
    acb_t s;
    arb_t phi;
    int is_origin;
} ml_sing_t;

typedef struct {
    slong region_index;
    arb_t mu;
    arb_t h;
    slong N;
    arb_t phi_left;
    arb_t phi_right;
} ml_region_t;

/* ======================== Utilities ======================== */

static void ml_sing_init(ml_sing_t *x)
{
    acb_init(x->s);
    arb_init(x->phi);
    x->is_origin = 0;
}

static void ml_sing_clear(ml_sing_t *x)
{
    acb_clear(x->s);
    arb_clear(x->phi);
}

static void ml_region_init(ml_region_t *r)
{
    arb_init(r->mu);
    arb_init(r->h);
    arb_init(r->phi_left);
    arb_init(r->phi_right);
    r->region_index = -1;
    r->N = 0;
}

static void ml_region_clear(ml_region_t *r)
{
    arb_clear(r->mu);
    arb_clear(r->h);
    arb_clear(r->phi_left);
    arb_clear(r->phi_right);
}

static void ml_phi(arb_t out, const acb_t s, slong prec)
{
    arb_t re, ab;
    arb_init(re);
    arb_init(ab);
    acb_get_real(re, s);
    acb_abs(ab, s, prec);
    arb_add(out, re, ab, prec);
    arb_mul_2exp_si(out, out, -1);
    arb_clear(re);
    arb_clear(ab);
}

static int ml_cmp_phi_qsort(const void *a, const void *b)
{
    const ml_sing_t *x = (const ml_sing_t *) a;
    const ml_sing_t *y = (const ml_sing_t *) b;
    return arf_cmp(arb_midref(x->phi), arb_midref(y->phi));
}

static void ml_exp_i_theta(acb_t out, const arb_t theta, slong prec)
{
    arb_t s, c;
    arb_init(s);
    arb_init(c);
    arb_sin_cos(s, c, theta, prec);
    arb_set(acb_realref(out), c);
    arb_set(acb_imagref(out), s);
    arb_clear(s);
    arb_clear(c);
}

static slong ml_ceil_ub_slong(const arb_t x, slong prec)
{
    arf_t ub;
    double d;
    slong n;
    arf_init(ub);
    arb_get_ubound_arf(ub, x, prec);
    d = arf_get_d(ub, ARF_RND_UP);
    arf_clear(ub);
    if (!isfinite(d) || d > (double) ML_SLONG_MAX / 4.0)
        return (slong) (ML_SLONG_MAX / 4);
    n = (slong) ceil(d);
    if (n < 0) n = 0;
    return n;
}

static void ml_default_thresholds(arb_t series_thr, arb_t asymp_thr, slong prec)
{
    arb_set_d(series_thr, 0.3);
    arb_set_d(asymp_thr, 50.0);
    (void)prec;
}

/* ======================== Singularity Finding ======================== */

static ml_sing_t * ml_find_singularities(slong *count_out, const acb_t lambda,
                                         const arb_t alpha, slong prec)
{
    arb_t theta, pi, two_pi, tmp, j_lower, j_upper;
    arb_t abs_lambda, inv_alpha, radius, arg;
    arf_t lb, ub;
    fmpz_t jmin_z, jmax_z;
    slong jmin, jmax, n_poles, i;
    ml_sing_t *sing;

    *count_out = 0;

    if (acb_is_zero(lambda))
    {
        sing = (ml_sing_t *) malloc(sizeof(ml_sing_t));
        if (!sing) flint_abort();
        ml_sing_init(&sing[0]);
        acb_zero(sing[0].s);
        arb_zero(sing[0].phi);
        sing[0].is_origin = 1;
        *count_out = 1;
        return sing;
    }

    arb_init(theta); arb_init(pi); arb_init(two_pi); arb_init(tmp);
    arb_init(j_lower); arb_init(j_upper); arb_init(abs_lambda);
    arb_init(inv_alpha); arb_init(radius); arb_init(arg);
    arf_init(lb); arf_init(ub);
    fmpz_init(jmin_z); fmpz_init(jmax_z);

    acb_arg(theta, lambda, prec);
    arb_const_pi(pi, prec);
    arb_mul_2exp_si(two_pi, pi, 1);

    arb_div(tmp, theta, two_pi, prec);
    arb_neg(j_lower, alpha);
    arb_mul_2exp_si(j_lower, j_lower, -1);
    arb_sub(j_lower, j_lower, tmp, prec);

    arb_set(j_upper, alpha);
    arb_mul_2exp_si(j_upper, j_upper, -1);
    arb_sub(j_upper, j_upper, tmp, prec);

    arb_get_lbound_arf(lb, j_lower, prec);
    arb_get_ubound_arf(ub, j_upper, prec);
    arf_get_fmpz(jmin_z, lb, ARF_RND_CEIL);
    arf_get_fmpz(jmax_z, ub, ARF_RND_FLOOR);

    if (fmpz_cmp(jmax_z, jmin_z) < 0)
    {
        sing = (ml_sing_t *) malloc(sizeof(ml_sing_t));
        if (!sing) flint_abort();
        ml_sing_init(&sing[0]);
        acb_zero(sing[0].s);
        arb_zero(sing[0].phi);
        sing[0].is_origin = 1;
        *count_out = 1;
        goto cleanup;
    }

    jmin = fmpz_get_si(jmin_z);
    jmax = fmpz_get_si(jmax_z);
    n_poles = (jmax - jmin + 1);

    sing = (ml_sing_t *) malloc((1 + n_poles) * sizeof(ml_sing_t));
    if (!sing) flint_abort();

    for (i = 0; i < 1 + n_poles; i++)
        ml_sing_init(&sing[i]);

    acb_zero(sing[0].s);
    arb_zero(sing[0].phi);
    sing[0].is_origin = 1;

    acb_abs(abs_lambda, lambda, prec);
    arb_inv(inv_alpha, alpha, prec);
    arb_pow(radius, abs_lambda, inv_alpha, prec);

    for (i = 0; i < n_poles; i++)
    {
        slong j = jmin + i;
        arb_mul_si(tmp, two_pi, j, prec);
        arb_add(arg, theta, tmp, prec);
        arb_div(arg, arg, alpha, prec);
        ml_exp_i_theta(sing[1+i].s, arg, prec);
        acb_mul_arb(sing[1+i].s, sing[1+i].s, radius, prec);
        ml_phi(sing[1+i].phi, sing[1+i].s, prec);
        sing[1+i].is_origin = 0;
    }

    qsort(sing, (size_t)(1 + n_poles), sizeof(ml_sing_t), ml_cmp_phi_qsort);
    *count_out = 1 + n_poles;

cleanup:
    arb_clear(theta); arb_clear(pi); arb_clear(two_pi); arb_clear(tmp);
    arb_clear(j_lower); arb_clear(j_upper); arb_clear(abs_lambda);
    arb_clear(inv_alpha); arb_clear(radius); arb_clear(arg);
    arf_clear(lb); arf_clear(ub);
    fmpz_clear(jmin_z); fmpz_clear(jmax_z);
    return sing;
}

/* ======================== Series Method ======================== */

static void ml_series(acb_t out, const acb_t z, const arb_t alpha,
                      const arb_t beta, slong prec)
{
    acb_t sum, term, zpow;
    arb_t akb, gam;
    mag_t tol, mterm;
    slong k;

    acb_init(sum); acb_init(term); acb_init(zpow);
    arb_init(akb); arb_init(gam);
    mag_init(tol); mag_init(mterm);

    mag_set_ui_2exp_si(tol, 1, -prec);

    arb_gamma(gam, beta, prec);
    arb_inv(gam, gam, prec);
    acb_set_arb(sum, gam);
    acb_set(zpow, z);

    for (k = 1; k < 200000; k++)
    {
        arb_mul_si(akb, alpha, k, prec);
        arb_add(akb, akb, beta, prec);
        arb_gamma(gam, akb, prec);
        acb_div_arb(term, zpow, gam, prec);
        acb_get_mag(mterm, term);
        if (mag_cmp(mterm, tol) < 0) break;
        acb_add(sum, sum, term, prec);
        acb_mul(zpow, zpow, z, prec);
    }

    acb_set(out, sum);
    acb_clear(sum); acb_clear(term); acb_clear(zpow);
    arb_clear(akb); arb_clear(gam);
    mag_clear(tol); mag_clear(mterm);
}

/* ======================== Asymptotic Method ======================== */

static void ml_asymptotic(acb_t out, const acb_t z, const arb_t alpha,
			                            const arb_t beta, slong prec)
{

       acb_t sum, z1a, expz1a, leading, zma, powterm, term, prev_sum;
       arb_t inva, one, one_minus_beta, expo, betam, rg;
       mag_t tol, mterm, mprev;
       slong k;

       acb_init(sum); acb_init(z1a); acb_init(expz1a); acb_init(leading);
       acb_init(zma); acb_init(powterm); acb_init(term); acb_init(prev_sum);
       arb_init(inva); arb_init(one); arb_init(one_minus_beta);
       arb_init(expo); arb_init(betam); arb_init(rg);
       mag_init(tol); mag_init(mterm); mag_init(mprev);

       mag_set_ui_2exp_si(tol, 1, -prec);
       arb_one(one);
       arb_inv(inva, alpha, prec);

       acb_pow_arb(z1a, z, inva, prec);
       acb_exp(expz1a, z1a, prec);

       arb_sub(one_minus_beta, one, beta, prec);
       arb_mul(expo, one_minus_beta, inva, prec);
       acb_pow_arb(leading, z, expo, prec);
       acb_mul(leading, leading, expz1a, prec);
       acb_mul_arb(leading, leading, inva, prec);

       acb_set(sum, leading);

       arb_neg(expo, alpha);
       acb_pow_arb(zma, z, expo, prec);
       acb_set(powterm, zma);

       mag_inf(mprev);

       for (k = 1; k < 2000; k++)
     {

	        arb_mul_si(betam, alpha, k, prec);
	        arb_sub(betam, beta, betam, prec);
	        arb_rgamma(rg, betam, prec);
	        acb_mul_arb(term, powterm, rg, prec);
	        acb_neg(term, term);
	        acb_get_mag(mterm, term);

	        /* Stop if terms start increasing (asymptotic divergence) */
	        if (mag_cmp(mterm, mprev) > 0)
	              break;

	        if (mag_cmp(mterm, tol) < 0) break;

	        acb_add(sum, sum, term, prec);
	        acb_mul(powterm, powterm, zma, prec);
	        mag_set(mprev, mterm);
     }


       acb_set(out, sum);

       acb_clear(sum); acb_clear(z1a); acb_clear(expz1a); acb_clear(leading);
       acb_clear(zma); acb_clear(powterm); acb_clear(term); acb_clear(prev_sum);
       arb_clear(inva); arb_clear(one); arb_clear(one_minus_beta);
       arb_clear(expo); arb_clear(betam); arb_clear(rg);
       mag_clear(tol); mag_clear(mterm); mag_clear(mprev);
}



/* ======================== OPC Method ======================== */

static void ml_parabola(acb_t z, const arb_t mu, const arb_t u, slong prec)
{
    acb_t w;
    acb_init(w);
    acb_set_arb(w, u);
    acb_mul_onei(w, w);
    acb_add_ui(w, w, 1, prec);
    acb_sqr(z, w, prec);
    acb_mul_arb(z, z, mu, prec);
    acb_clear(w);
}

static void ml_parabola_deriv(acb_t zp, const arb_t mu, const arb_t u, slong prec)
{
    acb_t w;
    acb_init(w);
    acb_onei(w);
    acb_sub_arb(w, w, u, prec);
    acb_mul_arb(zp, w, mu, prec);
    acb_mul_2exp_si(zp, zp, 1);
    acb_clear(w);
}

static void ml_g(acb_t out, const arb_t u, const arb_t mu, const arb_t t,
                 const acb_t lambda, const arb_t alpha, const arb_t beta, slong prec)
{
    acb_t z, zp, expzt, za, zab, num, den;
    arb_t a_minus_b;

    acb_init(z); acb_init(zp); acb_init(expzt); acb_init(za);
    acb_init(zab); acb_init(num); acb_init(den);
    arb_init(a_minus_b);

    ml_parabola(z, mu, u, prec);
    ml_parabola_deriv(zp, mu, u, prec);
    acb_mul_arb(expzt, z, t, prec);
    acb_exp(expzt, expzt, prec);
    acb_pow_arb(za, z, alpha, prec);
    arb_sub(a_minus_b, alpha, beta, prec);
    acb_pow_arb(zab, z, a_minus_b, prec);
    acb_sub(den, za, lambda, prec);
    acb_mul(num, expzt, zab, prec);
    acb_mul(num, num, zp, prec);
    acb_div(out, num, den, prec);

    acb_clear(z); acb_clear(zp); acb_clear(expzt); acb_clear(za);
    acb_clear(zab); acb_clear(num); acb_clear(den);
    arb_clear(a_minus_b);
}

static void ml_residue(acb_t out, const acb_t s, const arb_t t,
                       const arb_t alpha, const arb_t beta, slong prec)
{
    acb_t p, e;
    arb_t one, one_minus_beta;

    acb_init(p); acb_init(e);
    arb_init(one); arb_init(one_minus_beta);

    arb_one(one);
    arb_sub(one_minus_beta, one, beta, prec);
    acb_pow_arb(p, s, one_minus_beta, prec);
    acb_mul_arb(e, s, t, prec);
    acb_exp(e, e, prec);
    acb_mul(out, p, e, prec);
    acb_div_arb(out, out, alpha, prec);

    acb_clear(p); acb_clear(e);
    arb_clear(one); arb_clear(one_minus_beta);
}

static int ml_region_params_bounded(ml_region_t *R, const arb_t phiL,
                                   const arb_t phiR, const arb_t t,
                                   const arb_t eps, slong prec)
{
    arb_t sqrtL, sqrtR, d, s, fmin, fmax, ftar, f;
    arb_t eps_bar, logeps, w, one, two, two_pi;
    arb_t A, denom, tmp1, tmp2, Nh;

    arb_init(sqrtL); arb_init(sqrtR); arb_init(d); arb_init(s);
    arb_init(fmin); arb_init(fmax); arb_init(ftar); arb_init(f);
    arb_init(eps_bar); arb_init(logeps); arb_init(w);
    arb_init(one); arb_init(two); arb_init(two_pi);
    arb_init(A); arb_init(denom); arb_init(tmp1); arb_init(tmp2); arb_init(Nh);

    arb_one(one);
    arb_set_si(two, 2);

    if (arb_le(phiR, phiL)) goto fail;

    arb_sqrt(sqrtL, phiL, prec);
    arb_sqrt(sqrtR, phiR, prec);
    arb_sub(d, sqrtR, sqrtL, prec);
    if (arb_is_zero(d) || arb_contains_zero(d)) goto fail;

    arb_add(s, sqrtR, sqrtL, prec);
    arb_div(fmin, s, d, prec);
    arb_set_d(fmax, 10.0);
    arb_set_d(ftar, 5.0);
    if (arb_gt(fmin, fmax)) goto fail;

    arb_set(f, ftar);
    if (arb_lt(f, fmin)) arb_set(f, fmin);

    arb_div(eps_bar, eps, f, prec);
    arb_log(logeps, eps_bar, prec);
    if (arb_is_zero(logeps) || arb_contains_zero(logeps)) goto fail;

    arb_mul(tmp1, phiR, t, prec);
    arb_div(w, tmp1, logeps, prec);
    arb_neg(w, w);

    arb_add(tmp1, one, w, prec);
    arb_mul(A, tmp1, sqrtL, prec);
    arb_add(A, A, sqrtR, prec);

    arb_add(denom, two, w, prec);
    if (arb_is_zero(denom) || arb_contains_zero(denom)) goto fail;

    arb_sqr(tmp1, A, prec);
    arb_div(R->mu, tmp1, denom, prec);

    arb_const_pi(two_pi, prec);
    arb_mul_2exp_si(two_pi, two_pi, 1);
    arb_div(tmp1, two_pi, logeps, prec);
    arb_neg(tmp1, tmp1);
    arb_mul(tmp1, tmp1, d, prec);
    arb_div(R->h, tmp1, A, prec);

    arb_mul(tmp1, t, R->mu, prec);
    arb_div(tmp2, logeps, tmp1, prec);
    arb_neg(tmp2, tmp2);
    arb_add(tmp2, tmp2, one, prec);
    arb_sqrt(tmp2, tmp2, prec);
    arb_div(Nh, tmp2, R->h, prec);
    R->N = ml_ceil_ub_slong(Nh, prec) + 1;
    if (R->N < 8) R->N = 8;

    arb_set(R->phi_left, phiL);
    arb_set(R->phi_right, phiR);

    arb_clear(sqrtL); arb_clear(sqrtR); arb_clear(d); arb_clear(s);
    arb_clear(fmin); arb_clear(fmax); arb_clear(ftar); arb_clear(f);
    arb_clear(eps_bar); arb_clear(logeps); arb_clear(w);
    arb_clear(one); arb_clear(two); arb_clear(two_pi);
    arb_clear(A); arb_clear(denom); arb_clear(tmp1); arb_clear(tmp2); arb_clear(Nh);
    return 1;

fail:
    arb_clear(sqrtL); arb_clear(sqrtR); arb_clear(d); arb_clear(s);
    arb_clear(fmin); arb_clear(fmax); arb_clear(ftar); arb_clear(f);
    arb_clear(eps_bar); arb_clear(logeps); arb_clear(w);
    arb_clear(one); arb_clear(two); arb_clear(two_pi);
    arb_clear(A); arb_clear(denom); arb_clear(tmp1); arb_clear(tmp2); arb_clear(Nh);
    return 0;
}

static int ml_opc_mid(acb_t out, const acb_t lambda, const arb_t alpha,
                      const arb_t beta, const arb_t eps, slong prec)
{
    ml_sing_t *sing = NULL;
    slong ns = 0, J, j, best_j, best_N;
    arb_t t;
    acb_t integral, residues, tmpc, gval;
    arb_t u, two_pi;
    ml_region_t R;

    arb_init(t);
    arb_one(t);

    sing = ml_find_singularities(&ns, lambda, alpha, prec);
    if (!sing || ns < 1) return 0;

    J = ns - 1;
    if (J < 0) J = 0;

    best_j = -1;
    best_N = (slong) ML_SLONG_MAX;

    for (j = 0; j <= J - 1; j++)
    {
        ml_region_init(&R);
        if (ml_region_params_bounded(&R, sing[j].phi, sing[j+1].phi, t, eps, prec))
        {
            if (R.N > 0 && R.N < best_N)
            {
                best_N = R.N;
                best_j = j;
            }
        }
        ml_region_clear(&R);
    }

    if (best_j < 0)
    {
        for (j = 0; j < ns; j++) ml_sing_clear(&sing[j]);
        free(sing);
        arb_clear(t);
        return 0;
    }

    ml_region_init(&R);
    if (!ml_region_params_bounded(&R, sing[best_j].phi, sing[best_j+1].phi, t, eps, prec))
    {
        ml_region_clear(&R);
        for (j = 0; j < ns; j++) ml_sing_clear(&sing[j]);
        free(sing);
        arb_clear(t);
        return 0;
    }
    R.region_index = best_j;

    acb_init(residues); acb_zero(residues); acb_init(tmpc);

    for (j = best_j + 1; j <= J; j++)
    {
        if (!sing[j].is_origin)
        {
            ml_residue(tmpc, sing[j].s, t, alpha, beta, prec);
            acb_add(residues, residues, tmpc, prec);
        }
    }

    acb_init(integral); acb_zero(integral); acb_init(gval);
    arb_init(u); arb_init(two_pi);

    for (slong k = -R.N; k <= R.N; k++)
    {
        arb_set_si(u, k);
        arb_mul(u, u, R.h, prec);
        ml_g(gval, u, R.mu, t, lambda, alpha, beta, prec);
        if (k == -R.N || k == R.N) acb_mul_2exp_si(gval, gval, -1);
        acb_add(integral, integral, gval, prec);
    }

    acb_mul_arb(integral, integral, R.h, prec);
    arb_const_pi(two_pi, prec);
    arb_mul_2exp_si(two_pi, two_pi, 1);
    acb_div_arb(integral, integral, two_pi, prec);
    acb_div_onei(integral, integral);
    acb_add(out, residues, integral, prec);

    acb_clear(integral); acb_clear(residues); acb_clear(tmpc); acb_clear(gval);
    arb_clear(u); arb_clear(two_pi);
    ml_region_clear(&R);

    for (j = 0; j < ns; j++) ml_sing_clear(&sing[j]);
    free(sing);
    arb_clear(t);
    return 1;
}

/* ======================== Public API ======================== */

void acb_mittag_leffler_E(acb_t out, const acb_t z, const arb_t alpha,
                          const arb_t beta, double eps_d, slong prec)
{
    arb_t eps, absz, series_thr, asymp_thr, gam;

    arb_init(eps); arb_init(absz); arb_init(series_thr);
    arb_init(asymp_thr); arb_init(gam);

    arb_set_d(eps, eps_d);
    ml_default_thresholds(series_thr, asymp_thr, prec);

    if (acb_is_zero(z))
    {
        arb_gamma(gam, beta, prec);
        arb_inv(gam, gam, prec);
        acb_set_arb(out, gam);
        goto done;
    }

    if (arb_is_one(alpha) && arb_is_one(beta))
    {
        acb_exp(out, z, prec);
        goto done;
    }

    acb_abs(absz, z, prec);

    if (arb_lt(absz, series_thr))
    {
        ml_series(out, z, alpha, beta, prec);
    }
    else if (arb_gt(absz, asymp_thr))
    {
        ml_asymptotic(out, z, alpha, beta, prec);
    }
    else
    {
        if (!ml_opc_mid(out, z, alpha, beta, eps, prec))
            ml_series(out, z, alpha, beta, prec);
    }

done:
    arb_clear(eps); arb_clear(absz); arb_clear(series_thr);
    arb_clear(asymp_thr); arb_clear(gam);
}

/* ======================== Unit Tests ======================== */

static int ml_test_case(const char *name, const acb_t z, const arb_t alpha,
                        const arb_t beta, const char *ref_re, const char *ref_im,
                        const char *regime, slong prec)
{
    acb_t computed, reference, diff;
    arb_t abs_ref, abs_diff, rel_err, threshold;
    int pass;

    acb_init(computed); acb_init(reference); acb_init(diff);
    arb_init(abs_ref); arb_init(abs_diff); arb_init(rel_err); arb_init(threshold);

    acb_mittag_leffler_E(computed, z, alpha, beta, 1e-30, prec);

    arb_set_str(acb_realref(reference), ref_re, prec);
    if (ref_im)
        arb_set_str(acb_imagref(reference), ref_im, prec);
    else
        arb_zero(acb_imagref(reference));

    acb_sub(diff, computed, reference, prec);
    acb_abs(abs_diff, diff, prec);
    acb_abs(abs_ref, reference, prec);
    arb_div(rel_err, abs_diff, abs_ref, prec);

    arb_set_d(threshold, 1e-10);
    pass = arb_lt(rel_err, threshold);

    flint_printf("%-25s [%-6s] ", name, regime);
    if (pass)
        flint_printf("✓");
    else
        flint_printf("✗");
    flint_printf("\n");
    
    flint_printf("  COMPUTED: ");
    acb_printn(computed, 50, 0);
    flint_printf("\n");
    
    flint_printf("  EXPECTED: ");
    acb_printn(reference, 50, 0);
    flint_printf("\n");
    
    flint_printf("  REL_ERR:  ");
    arb_printn(rel_err, 8, 0);
    flint_printf("\n\n");

    acb_clear(computed); acb_clear(reference); acb_clear(diff);
    arb_clear(abs_ref); arb_clear(abs_diff); arb_clear(rel_err); arb_clear(threshold);

    return pass;
}

static int ml_test_suite(slong prec)
{
    acb_t z;
    arb_t alpha, beta;
    int p[7], all_pass;

    acb_init(z); arb_init(alpha); arb_init(beta);

    flint_printf("Mittag-Leffler Unit Tests (prec=%wd)\n", prec);
    flint_printf("=================================================================\n\n");

    acb_set_d(z, 2.0);
    arb_set_d(alpha, 1.0);
    arb_set_d(beta, 1.0);
    p[0] = ml_test_case("E_{1,1}(2)=exp(2)", z, alpha, beta,
                        "7.38905609893065022723042746057500781318031557055184",
                        NULL, "EXACT", prec);

    acb_set_d(z, 0.5);
    arb_set_d(alpha, 0.5);
    arb_set_d(beta, 1.0);
    p[1] = ml_test_case("E_{0.5,1}(0.5)", z, alpha, beta,
                        "1.95236048918255709327604771344113097989025533929729",
                        NULL, "SERIES", prec);

    acb_set_d_d(z, 1.0, 2.0);
    arb_set_d(alpha, 0.75);
    arb_set_d(beta, 1.0);
    p[2] = ml_test_case("E_{0.75,1}(1+2i)", z, alpha, beta,
                        "-1.77907846767872389383612752627817765934829853095525",
                        "0.469523860598082854105627054628179570206756657890045", "OPC", prec);

    acb_set_d(z, -5.0);
    arb_set_d(alpha, 0.9);
    arb_set_d(beta, 1.0);
    p[3] = ml_test_case("E_{0.9,1}(-5)", z, alpha, beta,
                        "0.0344313248040984239050519203835136271364300445527947",
                        NULL, "OPC", prec);

    acb_set_d(z, 0.2);
    arb_set_d(alpha, 0.8);
    arb_set_d(beta, 2.0);
    p[4] = ml_test_case("E_{0.8,2.0}(0.2)", z, alpha, beta,
                        "1.13089927806695873973568898522901730914067280660639",
                        NULL, "SERIES", prec);

    acb_set_d_d(z, 2.0, -1.0);
    arb_set_d(alpha, 0.6);
    arb_set_d(beta, 0.7);
    p[5] = ml_test_case("E_{0.6,0.7}(2-i)", z, alpha, beta,
                        "-37.4116018597121515696040295713280847950300111812654",
                        "-9.16300059339639907168482885486509334350868636492137", "OPC", prec);

    acb_set_d(z, 80.0);
    arb_set_d(alpha, 0.8);
    arb_set_d(beta, 0.5);
    p[6] = ml_test_case("E_{0.8,0.5}(80)", z, alpha, beta,
                        "1.5624895724995698520447059186214666773711524048400570782409e+105",
                        NULL, "ASYMP", prec);

    all_pass = p[0] && p[1] && p[2] && p[3] && p[4] && p[5] && p[6];

    flint_printf("=================================================================\n");
    flint_printf("Result: %d/7 tests passed", p[0]+p[1]+p[2]+p[3]+p[4]+p[5]+p[6]);
    if (all_pass) flint_printf(" ✓\n"); else flint_printf(" ✗\n");

    acb_clear(z); arb_clear(alpha); arb_clear(beta);
    return all_pass;
}

/* ======================== Main ======================== */

int main(int argc, char **argv)
{
    if (argc > 1 && strcmp(argv[1], "test") == 0)
    {
        return ml_test_suite(256) ? 0 : 1;
    }

    acb_t z, val;
    arb_t alpha, beta;
    slong prec = 256;

    acb_init(z); acb_init(val);
    arb_init(alpha); arb_init(beta);

    acb_set_d_d(z, 1.0, 2.0);
    arb_set_d(alpha, 0.75);
    arb_set_d(beta, 1.0);

    acb_mittag_leffler_E(val, z, alpha, beta, 1e-30, prec);

    flint_printf("E_{0.75,1}(1+2i) = ");
    acb_printn(val, 30, 0);
    flint_printf("\n");

    acb_clear(z); acb_clear(val);
    arb_clear(alpha); arb_clear(beta);

    flint_cleanup();
    return 0;
}
