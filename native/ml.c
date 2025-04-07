#include <flint/flint.h>
#include <flint/acb.h>
#include <flint/arb.h>
#include <flint/acb_calc.h>
#include <flint/arf.h>
#include <flint/mag.h>

/* Error handling */
#define ML_SUCCESS 0
#define ML_INVALID_PARAM 1

/* Helper functions declarations */
static int ml_series(acb_t res, const arb_t alpha, const arb_t beta, const acb_t z,
                   const slong prec, const arb_t k0);
static void ml_asymptotic(acb_t res, const arb_t alpha, const arb_t beta, const acb_t z,
                        const slong prec);
static int ml_integral_representation(acb_t res, const arb_t alpha, const arb_t beta,
                                    const acb_t z, const slong prec);
static int K_integrand(acb_t res, const acb_t chi, void *param, slong order,
                     slong prec);
static int P_integrand(acb_t res, const acb_t phi, void *param, slong order,
                     slong prec);
static void set_integration_params(acb_calc_integrate_opt_t options);

/* Main Mittag-Leffler function implementation */
int mittag_leffler(acb_t res, const arb_t alpha, const arb_t beta, const acb_t z,
                 const slong prec) {
    if (!arb_is_positive(alpha)) return ML_INVALID_PARAM;

    arb_t mag_z, threshold, alpha_pi, arg_z_abs, rho, one;
    acb_t z_norm;
    int status = ML_SUCCESS;

    /* Initialize temporary variables */
    arb_init(mag_z);
    arb_init(threshold);
    arb_init(alpha_pi);
    arb_init(arg_z_abs);
    arb_init(rho);
    arb_init(one);
    acb_init(z_norm);

    /* Initialize one value */
    arb_one(one);
    
    /* Set tolerance ρ = machine epsilon */
    arb_set_ui(rho, 1);
    arb_mul_2exp_si(rho, rho, -prec);

    /* Calculate |z| */
    acb_abs(mag_z, z, prec);

    /* Calculate threshold: 10 + 5α */
    arb_mul_ui(threshold, alpha, 5, prec);
    arb_add_ui(threshold, threshold, 10, prec);

    /* Calculate απ and |arg(z)| */
    arb_const_pi(alpha_pi, prec);
    arb_mul(alpha_pi, alpha_pi, alpha, prec);
    acb_arg(arg_z_abs, z, prec);
    arb_abs(arg_z_abs, arg_z_abs);

    /* Algorithm decision tree */
    if (arb_lt(mag_z, threshold)) {
        /* Series expansion */
        arb_t k0;
        arb_init(k0);
        arb_neg(k0, rho);
        arb_log(k0, k0, prec);
        arb_div(k0, k0, mag_z, prec);
        arb_floor(k0, k0, prec);

        status = ml_series(res, alpha, beta, z, prec, k0);
        arb_clear(k0);
    } else {
        /* Integral representation */
        status = ml_integral_representation(res, alpha, beta, z, prec);
    }

    /* Cleanup */
    arb_clear(mag_z);
    arb_clear(threshold);
    arb_clear(alpha_pi);
    arb_clear(arg_z_abs);
    arb_clear(rho);
    arb_clear(one);
    acb_clear(z_norm);

    return status;
}

/* Series expansion implementation */
static int ml_series(acb_t res, const arb_t alpha, const arb_t beta, const acb_t z,
                   const slong prec, const arb_t k0) {
    acb_t term, sum, z_pow, gamma_arg_c;
    arb_t gamma_arg, tol;
    slong k, max_k;

    acb_init(term);
    acb_init(sum);
    acb_init(z_pow);
    acb_init(gamma_arg_c);
    arb_init(gamma_arg);
    arb_init(tol);

    /* Set convergence tolerance */
    arb_set_ui(tol, 1);
    arb_mul_2exp_si(tol, tol, -prec);

    /* Maximum iterations from k0 */
    max_k = arf_get_si(arb_midref(k0), ARF_RND_CEIL);
    max_k = FLINT_MAX(max_k, 100);

    acb_zero(sum);
    acb_one(z_pow);

    for (k = 0; k <= max_k; k++) {
        /* Compute Γ(αk + β) */
        arb_mul_ui(gamma_arg, alpha, k, prec);
        arb_add(gamma_arg, gamma_arg, beta, prec);

        /* term = z^k / Γ(αk + β) */
        acb_set_arb(gamma_arg_c, gamma_arg);
        acb_rgamma(term, gamma_arg_c, prec);
        acb_mul(term, term, z_pow, prec);
        acb_add(sum, sum, term, prec);

        /* Update z_pow *= z */
        if (k < max_k) acb_mul(z_pow, z_pow, z, prec);

        /* Check convergence */
        acb_abs(gamma_arg, term, prec);
        if (arb_lt(gamma_arg, tol)) break;
    }

    acb_set(res, sum);

    /* Cleanup */
    acb_clear(term);
    acb_clear(sum);
    acb_clear(z_pow);
    acb_clear(gamma_arg_c);
    arb_clear(gamma_arg);
    arb_clear(tol);

    return ML_SUCCESS;
}

/* Asymptotic expansion implementation */
static void ml_asymptotic(acb_t res, const arb_t alpha, const arb_t beta, const acb_t z,
                        const slong prec) {
    acb_t z_pow, exp_term;
    arb_t exponent, one;

    acb_init(z_pow);
    acb_init(exp_term);
    arb_init(exponent);
    arb_init(one);

    /* Set one */
    arb_one(one);
    
    /* Compute (1-β)/α */
    arb_sub(exponent, one, beta, prec);
    arb_div(exponent, exponent, alpha, prec);

    /* z^((1-β)/α) */
    acb_pow_arb(z_pow, z, exponent, prec);

    /* exp(z^(1/α)) */
    arb_inv(exponent, alpha, prec);
    acb_pow_arb(exp_term, z, exponent, prec);
    acb_exp(exp_term, exp_term, prec);

    /* Combine terms: (1/α) * z^((1-β)/α) * exp(z^(1/α)) */
    acb_mul(res, z_pow, exp_term, prec);
    acb_div_arb(res, res, alpha, prec);

    /* Cleanup */
    acb_clear(z_pow);
    acb_clear(exp_term);
    arb_clear(exponent);
    arb_clear(one);
}

/* Integral representation implementation */
static int ml_integral_representation(acb_t res, const arb_t alpha, const arb_t beta,
                                    const acb_t z, const slong prec) {
    acb_t K_integral, P_integral, asymptotic_term;
    acb_t zero_c, chi0_c, neg_alpha_pi_c, alpha_pi_c, half_abs_z_c;
    arb_t chi0, alpha_pi, arg_z_abs, abs_z, half_abs_z, one, zero, neg_alpha_pi;
    mag_t tol;
    slong goal;
    int status = ML_SUCCESS;

    acb_init(K_integral);
    acb_init(P_integral);
    acb_init(asymptotic_term);
    acb_init(zero_c);
    acb_init(chi0_c);
    acb_init(neg_alpha_pi_c);
    acb_init(alpha_pi_c);
    acb_init(half_abs_z_c);
    arb_init(chi0);
    arb_init(alpha_pi);
    arb_init(arg_z_abs);
    arb_init(abs_z);
    arb_init(half_abs_z);
    arb_init(one);
    arb_init(zero);
    arb_init(neg_alpha_pi);
    mag_init(tol);

    /* Set constants */
    arb_one(one);
    arb_zero(zero);
    mag_set_ui_2exp_si(tol, 1, -prec); // Set tolerance to 2^(-prec)
    goal = 0; // Default goal for integration

    /* Calculate parameters */
    acb_abs(abs_z, z, prec);
    acb_arg(arg_z_abs, z, prec);
    arb_abs(arg_z_abs, arg_z_abs);
    arb_const_pi(alpha_pi, prec);
    arb_mul(alpha_pi, alpha_pi, alpha, prec);
    arb_neg(neg_alpha_pi, alpha_pi);

    /* Set integration limits */
    arb_add_ui(chi0, abs_z, 1, prec);
    arb_div_ui(chi0, chi0, 2, prec);
    arb_div_ui(half_abs_z, abs_z, 2, prec);

    /* Convert arb_t to acb_t for integration */
    acb_set_arb(zero_c, zero);
    acb_set_arb(chi0_c, chi0);
    acb_set_arb(neg_alpha_pi_c, neg_alpha_pi);
    acb_set_arb(alpha_pi_c, alpha_pi);
    acb_set_arb(half_abs_z_c, half_abs_z);

    /* Parameter structure for integrands */
    struct {
        arb_t alpha;
        arb_t beta;
        acb_t z;
    } param;

    arb_set(param.alpha, alpha);
    arb_set(param.beta, beta);
    acb_set(param.z, z);

    /* Integration options */
    acb_calc_integrate_opt_t opt;
    acb_calc_integrate_opt_init(opt);
    set_integration_params(opt);

    if (arb_ge(arg_z_abs, alpha_pi)) {
        /* Case 1: |arg(z)| ≥ απ */
        if (arb_le(beta, one)) {
            /* Only K integral */
            status |= acb_calc_integrate(K_integral, K_integrand, &param,
                                        zero_c, chi0_c, goal, tol, opt, prec);
            acb_set(res, K_integral);
        } else {
            /* K + P integrals */
            status |= acb_calc_integrate(K_integral, K_integrand, &param,
                                        zero_c, chi0_c, goal, tol, opt, prec);
            status |= acb_calc_integrate(P_integral, P_integrand, &param,
                                        neg_alpha_pi_c, alpha_pi_c, goal, tol, opt, prec);
            acb_add(res, K_integral, P_integral, prec);
        }
    } else {
        /* Case 2: |arg(z)| < απ */
        if (arb_le(beta, one)) {
            /* K integral + asymptotic term */
            status |= acb_calc_integrate(K_integral, K_integrand, &param,
                                        zero_c, chi0_c, goal, tol, opt, prec);
            ml_asymptotic(asymptotic_term, alpha, beta, z, prec);
            acb_add(res, K_integral, asymptotic_term, prec);
        } else {
            /* K integral (from |z|/2) + P integral + asymptotic term */
            status |= acb_calc_integrate(K_integral, K_integrand, &param,
                                        half_abs_z_c, chi0_c, goal, tol, opt, prec);
            status |= acb_calc_integrate(P_integral, P_integrand, &param,
                                        neg_alpha_pi_c, alpha_pi_c, goal, tol, opt, prec);
            ml_asymptotic(asymptotic_term, alpha, beta, z, prec);
            acb_add(res, K_integral, P_integral, prec);
            acb_add(res, res, asymptotic_term, prec);
        }
    }

    /* Cleanup */
    acb_clear(K_integral);
    acb_clear(P_integral);
    acb_clear(asymptotic_term);
    acb_clear(zero_c);
    acb_clear(chi0_c);
    acb_clear(neg_alpha_pi_c);
    acb_clear(alpha_pi_c);
    acb_clear(half_abs_z_c);
    arb_clear(chi0);
    arb_clear(alpha_pi);
    arb_clear(arg_z_abs);
    arb_clear(abs_z);
    arb_clear(half_abs_z);
    arb_clear(one);
    arb_clear(zero);
    arb_clear(neg_alpha_pi);
    mag_clear(tol);
    /* Removed the problematic function call:
    acb_calc_integrate_opt_clear(opt); */

    return status;
}

/* K integrand implementation */
static int K_integrand(acb_t res, const acb_t chi, void *param, slong order,
                     slong prec) {
    struct {
        arb_t alpha;
        arb_t beta;
        acb_t z;
    } *p = param;
    
    acb_t term1, term2;
    arb_t chi_alpha, abs_z, arg_z, exponent, chi_arb;

    acb_init(term1);
    acb_init(term2);
    arb_init(chi_alpha);
    arb_init(abs_z);
    arb_init(arg_z);
    arb_init(exponent);
    arb_init(chi_arb);

    /* Convert acb_t chi to arb_t */
    acb_get_real(chi_arb, chi);

    /* Compute χ^α */
    arb_pow(chi_alpha, chi_arb, p->alpha, prec);

    /* Compute χ^{α-1} */
    arb_sub_ui(exponent, p->alpha, 1, prec);
    arb_pow(acb_realref(term1), chi_arb, exponent, prec);
    arb_zero(acb_imagref(term1));

    /* Compute exp(-χ^α * |z|) */
    acb_abs(abs_z, p->z, prec);
    arb_mul(acb_realref(term2), chi_alpha, abs_z, prec);
    arb_neg(acb_realref(term2), acb_realref(term2));
    arb_exp(acb_realref(term2), acb_realref(term2), prec);
    arb_zero(acb_imagref(term2));

    /* Compute cos(χ^α * |z| * sin(arg(z))) */
    acb_arg(arg_z, p->z, prec);
    arb_sin(arg_z, arg_z, prec);
    arb_mul(arg_z, arg_z, abs_z, prec);
    arb_mul(arg_z, arg_z, chi_alpha, prec);
    arb_cos(acb_imagref(term2), arg_z, prec);

    /* Combine terms */
    acb_mul_arb(term1, term1, acb_realref(term2), prec);
    acb_mul_arb(term2, term1, acb_imagref(term2), prec);
    acb_set(res, term2);

    /* Cleanup */
    acb_clear(term1);
    acb_clear(term2);
    arb_clear(chi_alpha);
    arb_clear(abs_z);
    arb_clear(arg_z);
    arb_clear(exponent);
    arb_clear(chi_arb);

    return 0;
}

/* P integrand implementation */
static int P_integrand(acb_t res, const acb_t phi, void *param, slong order,
                     slong prec) {
    struct {
        arb_t alpha;
        arb_t beta;
        acb_t z;
    } *p = param;

    acb_t term;
    arb_t epsilon, phi_scaled, exponent, phi_arb;

    acb_init(term);
    arb_init(epsilon);
    arb_init(phi_scaled);
    arb_init(exponent);
    arb_init(phi_arb);

    /* Convert acb_t phi to arb_t */
    acb_get_real(phi_arb, phi);

    /* Compute ε = |z|/2 */
    acb_abs(epsilon, p->z, prec);
    arb_div_ui(epsilon, epsilon, 2, prec);

    /* Compute φ' = φ/α */
    arb_div(phi_scaled, phi_arb, p->alpha, prec);

    /* Compute ε^{α-1} */
    arb_sub_ui(exponent, p->alpha, 1, prec);
    arb_pow(acb_realref(term), epsilon, exponent, prec);
    arb_zero(acb_imagref(term));

    /* Compute exp(ε * cos(φ')) */
    arb_cos(exponent, phi_scaled, prec);
    arb_mul(exponent, exponent, epsilon, prec);
    arb_exp(exponent, exponent, prec);
    arb_mul(acb_realref(term), acb_realref(term), exponent, prec);

    /* Multiply by cos(ε * sin(φ') - βφ' + |z| * sin(φ'/α)) */
    arb_sin(exponent, phi_scaled, prec);
    arb_mul(exponent, exponent, epsilon, prec);
    arb_mul(phi_scaled, phi_arb, p->beta, prec);
    arb_sub(exponent, exponent, phi_scaled, prec);
    acb_abs(phi_scaled, p->z, prec);
    arb_div(phi_scaled, phi_scaled, p->alpha, prec);
    arb_sin(phi_scaled, phi_scaled, prec);
    arb_add(exponent, exponent, phi_scaled, prec);
    arb_cos(exponent, exponent, prec);
    acb_mul_arb(res, term, exponent, prec);

    /* Cleanup */
    acb_clear(term);
    arb_clear(epsilon);
    arb_clear(phi_scaled);
    arb_clear(exponent);
    arb_clear(phi_arb);

    return 0;
}

/* Integration parameters setup */
static void set_integration_params(acb_calc_integrate_opt_t options) {
    options->eval_limit = 0; // Changed from 1e-10 to avoid type conversion warning
    options->depth_limit = 25;
    options->use_heap = 0;
    options->verbose = 0;
}

/* Example usage */
int main() {

    arb_t alpha, beta;
    acb_t z, result;
    slong prec = 128;

    arb_init(alpha);
    arb_init(beta);
    acb_init(z);
    acb_init(result);

    /* Test case 1: α=0.5, β=1.0, z=1.0+0.5i */
    arb_set_d(alpha, 0.5);
    arb_set_d(beta, 1.0);
    acb_set_d_d(z, 1.0, 0.5);
    mittag_leffler(result, alpha, beta, z, prec);
    printf("E_{0.5,1.0}(1.0+0.5i) = ");
    acb_printn(result, 25, 0); printf("\n\n");

    /* Test case 2: α=1.5, β=0.5, z=-2.0+1.0i */
    arb_set_d(alpha, 1.5);
    arb_set_d(beta, 0.5);
    acb_set_d_d(z, -2.0, 1.0);
    mittag_leffler(result, alpha, beta, z, prec);
    printf("E_{1.5,0.5}(-2.0+1.0i) = ");
    acb_printn(result, 25, 0); printf("\n");

    /* Cleanup */
    arb_clear(alpha);
    arb_clear(beta);
    acb_clear(z);
    acb_clear(result);
    flint_cleanup();

    return 0;
}
