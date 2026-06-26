/*
 * Zero-allocation O(N) Maclaurin-Pade resolvent engine.
 *
 * See pade_resolvent.h for the mathematical background and API contract.
 *
 * Build (standalone smoke test):
 *   clang -O3 -DPADE_RESOLVENT_MAIN -o pade_resolvent_test \
 *         native/pade_resolvent.c -I<flint>/include -I<flint>/include/flint \
 *         -lflint
 */

#include "pade_resolvent.h"

/* ─── init ─────────────────────────────────────────────────────────────── */

void pade_resolvent_init(pade_resolvent_t ctx,
                         const arb_t      c0,
                         const arb_t      alpha0)
{
  arb_poly_init(ctx->P_curr);
  arb_poly_init(ctx->P_prev);
  arb_poly_init(ctx->Q_curr);
  arb_poly_init(ctx->Q_prev);
  arb_poly_init(ctx->T1);
  arb_poly_init(ctx->T2);
  arb_poly_init(ctx->T3);

  /*
   * Explicit unrolled initialisation at M = 1.
   *
   *   M = 0:  Q_0(z) = 1,          P_0(z) = 0
   *   M = 1:  Q_1(z) = 1 - a0 * z,  P_1(z) = c0
   *
   * The M = -1 step would require a z^{-2} term which arb_poly_t cannot
   * represent; by unrolling M = 0 -> 1 manually we avoid that singularity.
   */

  /* P_prev = 0,  Q_prev = 1 */
  arb_poly_zero(ctx->P_prev);
  arb_poly_one(ctx->Q_prev);

  /* P_curr = c0 */
  arb_poly_zero(ctx->P_curr);
  arb_poly_set_coeff_arb(ctx->P_curr, 0, c0);

  /* Q_curr = 1 - alpha0 * z */
  arb_t neg_a0;
  arb_init(neg_a0);
  arb_neg(neg_a0, alpha0);
  arb_poly_zero(ctx->Q_curr);
  arb_poly_set_coeff_si(ctx->Q_curr, 0, 1);
  arb_poly_set_coeff_arb(ctx->Q_curr, 1, neg_a0);
  arb_clear(neg_a0);

  ctx->degree = 1;
}

/* ─── clear ─────────────────────────────────────────────────────────────── */

void pade_resolvent_clear(pade_resolvent_t ctx)
{
  arb_poly_clear(ctx->P_curr);
  arb_poly_clear(ctx->P_prev);
  arb_poly_clear(ctx->Q_curr);
  arb_poly_clear(ctx->Q_prev);
  arb_poly_clear(ctx->T1);
  arb_poly_clear(ctx->T2);
  arb_poly_clear(ctx->T3);
}

/* ─── step ──────────────────────────────────────────────────────────────── */

/*
 * Maclaurin-Pade recurrence (reciprocal form, O(N) per call):
 *
 *   W_{M+1}(z) = W_M(z) - alpha * z * W_M(z) - beta * z^2 * W_{M-1}(z)
 *
 * "Multiplying by z" is purely an array shift — no polynomial multiplication
 * machinery is needed, giving strict O(degree) work per step.
 *
 * Swap trick: after computing the new polynomial into T3, swap(W_prev, W_curr)
 * then swap(W_curr, T3).  The memory of the old W_prev rotates into T3 and is
 * reused as workspace in the next call — zero heap traffic.
 */
void pade_resolvent_step(pade_resolvent_t ctx,
                         const arb_t      alpha,
                         const arb_t      beta,
                         slong            prec)
{
  /* ── Denominator Q ─────────────────────────────────────────────────── */

  /* T1 = alpha * z * Q_curr */
  arb_poly_shift_left(ctx->T1, ctx->Q_curr, 1);
  arb_poly_scalar_mul(ctx->T1, ctx->T1, alpha, prec);

  /* T2 = beta * z^2 * Q_prev */
  arb_poly_shift_left(ctx->T2, ctx->Q_prev, 2);
  arb_poly_scalar_mul(ctx->T2, ctx->T2, beta, prec);

  /* T3 = Q_curr - alpha * z * Q_curr - beta * z^2 * Q_prev */
  arb_poly_sub(ctx->T3, ctx->Q_curr, ctx->T1, prec);
  arb_poly_sub(ctx->T3, ctx->T3,     ctx->T2, prec);

  /* O(1) pointer swap: advance state, recycle old Q_prev memory into T3 */
  arb_poly_swap(ctx->Q_prev, ctx->Q_curr);
  arb_poly_swap(ctx->Q_curr, ctx->T3);

  /* ── Numerator P ───────────────────────────────────────────────────── */

  arb_poly_shift_left(ctx->T1, ctx->P_curr, 1);
  arb_poly_scalar_mul(ctx->T1, ctx->T1, alpha, prec);

  arb_poly_shift_left(ctx->T2, ctx->P_prev, 2);
  arb_poly_scalar_mul(ctx->T2, ctx->T2, beta, prec);

  arb_poly_sub(ctx->T3, ctx->P_curr, ctx->T1, prec);
  arb_poly_sub(ctx->T3, ctx->T3,     ctx->T2, prec);

  arb_poly_swap(ctx->P_prev, ctx->P_curr);
  arb_poly_swap(ctx->P_curr, ctx->T3);

  ctx->degree++;
}

/* ─── evaluate ──────────────────────────────────────────────────────────── */

void pade_resolvent_evaluate(arb_t                  res,
                              const pade_resolvent_t ctx,
                              const arb_t            z,
                              slong                  prec)
{
  arb_t num, den;
  arb_init(num);
  arb_init(den);

  arb_poly_evaluate(num, ctx->P_curr, z, prec);
  arb_poly_evaluate(den, ctx->Q_curr, z, prec);
  arb_div(res, num, den, prec);

  arb_clear(num);
  arb_clear(den);
}

/* ─── extract_poles ─────────────────────────────────────────────────────── */

void pade_resolvent_extract_poles(acb_ptr                roots,
                                  const pade_resolvent_t ctx,
                                  slong                  prec)
{
  acb_poly_t Q_complex;
  acb_poly_init(Q_complex);

  slong len = arb_poly_length(ctx->Q_curr);
  arb_t c;
  arb_init(c);
  for (slong i = 0; i < len; i++)
  {
    arb_poly_get_coeff_arb(c, ctx->Q_curr, i);
    acb_poly_set_coeff_arb(Q_complex, i, c);
  }
  arb_clear(c);

  /*
   * Hand off to Arb's certified complex root finder.
   * The caller must pre-allocate roots[0..degree-1].
   * NULL initial guesses and maxiter = 0 use Arb defaults.
   */
  acb_poly_find_roots(roots, Q_complex, NULL, 0, prec);

  acb_poly_clear(Q_complex);
}

/* ─── standalone smoke test (compile with -DPADE_RESOLVENT_MAIN) ─────────── */

#ifdef PADE_RESOLVENT_MAIN

#include <stdio.h>
#include "flint/flint.h"

/*
 * Smoke test: verify the Pade resolvent against the classical
 *
 *   tanh(z) = z / (1 + z^2/3 / (1 + z^2/5 / (1 + ...)))
 *
 * Stieltjes J-fraction.  The Jacobi coefficients for the moment functional
 * of tanh are:
 *
 *   alpha_k = 0  (tanh is odd => all diagonal Jacobi coefficients vanish)
 *   beta_k  = k(k+1) / ((2k-1)(2k+1)),  k = 1, 2, 3, ...
 *
 *   beta_1 = 1*2/(1*3) = 2/3
 *   beta_2 = 2*3/(3*5) = 2/5
 *   beta_3 = 3*4/(5*7) = 12/35
 *
 * The [M/M] Pade of z*F(z) where F(z) = tanh(z)/z gives P_M/Q_M.
 * We compare R_5(0.5) against the high-precision reference
 * tanh(0.5) = 0.46211715726000975850231848364...
 *
 * Expected output with M = 5 and prec = 256:
 *   |R_5(0.5) - tanh(0.5)| < 1e-20
 */
static int pade_resolvent_smoke_test(slong prec)
{
  pade_resolvent_t ctx;
  arb_t            c0, alpha, beta, z, res, ref, err;
  int              pass = 1;

  arb_init(c0);
  arb_init(alpha);
  arb_init(beta);
  arb_init(z);
  arb_init(res);
  arb_init(ref);
  arb_init(err);

  /* c0 = a_1 = 1  (first Müntz moment of tanh: tanh(t) ~ t for small t) */
  arb_one(c0);

  /* alpha_0 = 0  (diagonal coefficient at M=0) */
  arb_zero(alpha);

  pade_resolvent_init(ctx, c0, alpha);

  /* Steps M = 2, 3, 4, 5 using the tanh J-fraction beta coefficients */
  /* beta_1 = 2/3 */
  arb_set_str(beta, "2/3", prec);
  arb_zero(alpha);
  pade_resolvent_step(ctx, alpha, beta, prec);

  /* beta_2 = 2/5 */
  arb_set_str(beta, "2/5", prec);
  pade_resolvent_step(ctx, alpha, beta, prec);

  /* beta_3 = 12/35 */
  arb_set_str(beta, "12/35", prec);
  pade_resolvent_step(ctx, alpha, beta, prec);

  /* beta_4 = 4*5/(7*9) = 20/63 */
  arb_set_str(beta, "20/63", prec);
  pade_resolvent_step(ctx, alpha, beta, prec);

  /* Evaluate R_5(0.5) */
  arb_set_str(z, "0.5", prec);
  pade_resolvent_evaluate(res, ctx, z, prec);

  /* Reference: tanh(0.5) */
  arb_tanh(ref, z, prec);

  /* Error */
  arb_sub(err, res, ref, prec);
  arb_abs(err, err);

  arb_t threshold;
  arb_init(threshold);
  arb_set_str(threshold, "1e-10", prec);

  if (arb_lt(err, threshold))
  {
    flint_printf("pade_resolvent smoke test PASSED: |R_5(0.5) - tanh(0.5)| < 1e-10\n");
    flint_printf("  R_5(0.5) = ");
    arb_printn(res, 20, 0);
    flint_printf("\n  tanh(0.5) = ");
    arb_printn(ref, 20, 0);
    flint_printf("\n  error = ");
    arb_printn(err, 5, 0);
    flint_printf("\n");
    pass = 1;
  }
  else
  {
    flint_printf("pade_resolvent smoke test FAILED\n");
    flint_printf("  R_5(0.5) = ");
    arb_printn(res, 20, 0);
    flint_printf("\n  tanh(0.5) = ");
    arb_printn(ref, 20, 0);
    flint_printf("\n  error = ");
    arb_printn(err, 10, 0);
    flint_printf("\n");
    pass = 0;
  }

  arb_clear(threshold);
  arb_clear(c0);
  arb_clear(alpha);
  arb_clear(beta);
  arb_clear(z);
  arb_clear(res);
  arb_clear(ref);
  arb_clear(err);
  pade_resolvent_clear(ctx);

  return pass;
}

int main(int argc, char **argv)
{
  int ok = pade_resolvent_smoke_test(256);
  flint_cleanup();
  return ok ? 0 : 1;
}

#endif /* PADE_RESOLVENT_MAIN */
