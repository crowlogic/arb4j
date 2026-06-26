#include "riccati_spectral_engine.h"

static void generate_next_puiseux_moment(spectral_engine_t eng, slong prec)
{
  slong k = eng->u_count;
  arb_t u_k;
  arb_init(u_k);

  if (k == 1)
  {
    arb_t arg, gamma_val;
    arb_init(arg);
    arb_init(gamma_val);
    arb_add_ui(arg, eng->alpha, 1, prec);
    arb_gamma(gamma_val, arg, prec);
    arb_div(u_k, eng->a, gamma_val, prec);
    arb_clear(arg);
    arb_clear(gamma_val);
  }
  else
  {
    arb_t sum, temp, num, den, arg;
    arb_init(sum);
    arb_init(temp);
    arb_init(num);
    arb_init(den);
    arb_init(arg);
    arb_zero(sum);

    if (!arb_is_zero(eng->c) && k > 2)
    {
      arb_t u_j, u_km1mj;
      arb_init(u_j);
      arb_init(u_km1mj);
      for (slong j = 1; j <= k - 2; j++)
      {
        arb_poly_get_coeff_arb(u_j, eng->u, j);
        arb_poly_get_coeff_arb(u_km1mj, eng->u, k - 1 - j);
        arb_mul(temp, u_j, u_km1mj, prec);
        arb_add(sum, sum, temp, prec);
      }
      arb_mul(sum, sum, eng->c, prec);
      arb_clear(u_j);
      arb_clear(u_km1mj);
    }

    arb_t u_km1;
    arb_init(u_km1);
    arb_poly_get_coeff_arb(u_km1, eng->u, k - 1);
    arb_mul(temp, eng->b, u_km1, prec);
    arb_add(sum, sum, temp, prec);
    arb_clear(u_km1);

    arb_mul_ui(arg, eng->alpha, k - 1, prec);
    arb_add_ui(arg, arg, 1, prec);
    arb_gamma(num, arg, prec);

    arb_mul_ui(arg, eng->alpha, k, prec);
    arb_add_ui(arg, arg, 1, prec);
    arb_gamma(den, arg, prec);

    arb_mul(u_k, sum, num, prec);
    arb_div(u_k, u_k, den, prec);

    arb_clear(sum);
    arb_clear(temp);
    arb_clear(num);
    arb_clear(den);
    arb_clear(arg);
  }

  arb_poly_set_coeff_arb(eng->u, k, u_k);
  eng->u_count++;
  arb_clear(u_k);
}

void spectral_engine_init(spectral_engine_t eng,
                          const arb_t       a,
                          const arb_t       b,
                          const arb_t       c,
                          const arb_t       alpha)
{
  arb_init(eng->a);
  arb_set(eng->a, a);
  arb_init(eng->b);
  arb_set(eng->b, b);
  arb_init(eng->c);
  arb_set(eng->c, c);
  arb_init(eng->alpha);
  arb_set(eng->alpha, alpha);

  arb_poly_init(eng->u);
  arb_poly_init(eng->alpha_arr);
  arb_poly_init(eng->beta_arr);

  eng->sigma_alloc = 16;
  eng->sigma       = (arb_poly_struct *) flint_malloc(eng->sigma_alloc * sizeof(arb_poly_struct));
  for (slong i = 0; i < eng->sigma_alloc; i++)
  {
    arb_poly_init(eng->sigma + i);
  }

  eng->u_count = 1;
  eng->mca_M   = 0;
}

void spectral_engine_clear(spectral_engine_t eng)
{
  arb_clear(eng->a);
  arb_clear(eng->b);
  arb_clear(eng->c);
  arb_clear(eng->alpha);
  arb_poly_clear(eng->u);
  arb_poly_clear(eng->alpha_arr);
  arb_poly_clear(eng->beta_arr);
  for (slong i = 0; i < eng->sigma_alloc; i++)
  {
    arb_poly_clear(eng->sigma + i);
  }
  flint_free(eng->sigma);
}

void spectral_engine_next_jacobi(arb_t             alpha_out,
                                 arb_t             beta_out,
                                 spectral_engine_t eng,
                                 slong             prec)
{
  slong M = eng->mca_M;

  if (M + 1 >= eng->sigma_alloc)
  {
    slong old_alloc  = eng->sigma_alloc;
    eng->sigma_alloc = 2 * eng->sigma_alloc;
    eng->sigma       = (arb_poly_struct *) flint_realloc(eng->sigma, eng->sigma_alloc * sizeof(arb_poly_struct));
    for (slong i = old_alloc; i < eng->sigma_alloc; i++)
    {
      arb_poly_init(eng->sigma + i);
    }
  }

  slong required_u = (2 * M + 1) + 2;
  while (eng->u_count < required_u)
  {
    generate_next_puiseux_moment(eng, prec);
  }

  arb_t temp_val;
  arb_init(temp_val);
  arb_poly_get_coeff_arb(temp_val, eng->u, 2 * M + 1);
  arb_poly_set_coeff_arb(eng->sigma[0], 2 * M, temp_val);
  arb_poly_get_coeff_arb(temp_val, eng->u, 2 * M + 2);
  arb_poly_set_coeff_arb(eng->sigma[0], 2 * M + 1, temp_val);

  if (M == 0)
  {
    arb_t sig_0_1, sig_0_0;
    arb_init(sig_0_1);
    arb_init(sig_0_0);
    arb_poly_get_coeff_arb(sig_0_1, eng->sigma[0], 1);
    arb_poly_get_coeff_arb(sig_0_0, eng->sigma[0], 0);

    arb_div(alpha_out, sig_0_1, sig_0_0, prec);
    arb_set(beta_out, sig_0_0);

    arb_poly_set_coeff_arb(eng->alpha_arr, 0, alpha_out);
    arb_poly_set_coeff_arb(eng->beta_arr, 0, beta_out);

    arb_clear(sig_0_1);
    arb_clear(sig_0_0);
  }
  else
  {
    arb_t t1, t2, a_prev, b_prev, sig_curr, sig_prev, sig_prev2;
    arb_init(t1);
    arb_init(t2);
    arb_init(a_prev);
    arb_init(b_prev);
    arb_init(sig_curr);
    arb_init(sig_prev);
    arb_init(sig_prev2);

    for (slong k = 1; k <= M; k++)
    {
      for (slong l = 2 * M - k; l <= 2 * M - k + 1; l++)
      {
        arb_poly_get_coeff_arb(a_prev, eng->alpha_arr, k - 1);
        arb_poly_get_coeff_arb(sig_prev, eng->sigma[k - 1], l);
        arb_mul(t1, a_prev, sig_prev, prec);

        if (k > 1)
        {
          arb_poly_get_coeff_arb(b_prev, eng->beta_arr, k - 1);
          arb_poly_get_coeff_arb(sig_prev2, eng->sigma[k - 2], l);
          arb_mul(t2, b_prev, sig_prev2, prec);
        }
        else
        {
          arb_zero(t2);
        }

        arb_poly_get_coeff_arb(sig_curr, eng->sigma[k - 1], l + 1);
        arb_sub(sig_curr, sig_curr, t1, prec);
        arb_sub(sig_curr, sig_curr, t2, prec);
        arb_poly_set_coeff_arb(eng->sigma[k], l, sig_curr);
      }
    }

    arb_poly_get_coeff_arb(sig_curr, eng->sigma[M], M + 1);
    arb_poly_get_coeff_arb(sig_prev, eng->sigma[M], M);
    arb_div(t1, sig_curr, sig_prev, prec);

    arb_poly_get_coeff_arb(sig_curr, eng->sigma[M - 1], M);
    arb_poly_get_coeff_arb(sig_prev2, eng->sigma[M - 1], M - 1);
    arb_div(t2, sig_curr, sig_prev2, prec);

    arb_sub(alpha_out, t1, t2, prec);
    arb_div(beta_out, sig_prev, sig_prev2, prec);

    arb_poly_set_coeff_arb(eng->alpha_arr, M, alpha_out);
    arb_poly_set_coeff_arb(eng->beta_arr, M, beta_out);

    arb_clear(t1);
    arb_clear(t2);
    arb_clear(a_prev);
    arb_clear(b_prev);
    arb_clear(sig_curr);
    arb_clear(sig_prev);
    arb_clear(sig_prev2);
  }

  arb_clear(temp_val);
  eng->mca_M++;
}
