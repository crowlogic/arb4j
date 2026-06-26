/*
 * Zero-allocation O(N) Maclaurin-Padé resolvent engine.
 *
 * See pade_resolvent.h for the mathematical background, API contract, and
 * related issue references (#1016, #1021, #1054, #1015, #1011).
 *
 * Build (standalone smoke test):
 *   clang -O3 -DPADE_RESOLVENT_MAIN -o pade_resolvent_test \
 *         native/pade_resolvent.c -I<flint>/include -I<flint>/include/flint \
 *         -lflint
 *
 * Fixes five defects in the prior draft (see commit message for details):
 *   1. Reciprocal domain: (1 - α·z)·W_M not (z - α)·W_M  — avoids 1/z blow-up
 *   2. Zero heap traffic: arb_poly_swap recycles storage; init/clear once only
 *   3. O(N) per step: shift_left + scalar_mul replace FFT poly_mul
 *   4. P_{-1} singularity: M=0→1 unrolled manually in pade_resolvent_init
 *   5. Correct API: arb_poly_scalar_mul (not arb_poly_scalar_mul_arb)
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

  /* Lift the real denominator Q_curr into the complex plane in one shot. */
  acb_poly_set_arb_poly(Q_complex, ctx->Q_curr);

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
 * Smoke test: verify the Padé resolvent against the classical Gauss
 * continued fraction
 *
 *   tanh(z) = z / (1 + z^2/3 / (1 + z^2/5 / (1 + ...)))
 *
 * Dividing through by z and applying the standard equivalence transformation
 * r_k = 1/(2k+1) turns the partial numerators z^2 with denominators (2k+1)
 * into the engine's RECIPROCAL J-fraction normal form
 *
 *   F(z) = tanh(z)/z = c0 / (1 - b1 z^2 / (1 - b2 z^2 / (1 - ...)))
 *
 * whose Jacobi coefficients are
 *
 *   c0       = 1
 *   alpha_k  = 0                      (tanh is odd => zero diagonal)
 *   beta_k   = -1 / ((2k-1)(2k+1)),   k = 1, 2, 3, ...
 *
 *   beta_1 = -1/(1*3) = -1/3
 *   beta_2 = -1/(3*5) = -1/15
 *   beta_3 = -1/(5*7) = -1/35
 *   beta_4 = -1/(7*9) = -1/63
 *
 * The sign is negative because the engine recurrence subtracts beta z^2 while
 * the tanh Gauss fraction adds its partial numerators.  R_M = P_curr/Q_curr is
 * then the [M-1/M] convergent of tanh(z)/z, so we compare R(0.5) against the
 * high-precision reference tanh(0.5)/0.5 = 0.92423431452001951700...
 *
 * Eight steps drive |R(0.5) - tanh(0.5)/0.5| below 1e-15 at prec = 256.
 */
/*
 * Set x = p / q exactly to prec bits.  arb_set_str does NOT parse "p/q"
 * fraction syntax (it returns nonzero and leaves the ball indeterminate),
 * so rational coefficients must be assembled with an explicit division.
 */
static void arb_set_rational_si(arb_t x, slong p, slong q, slong prec)
{
  arb_set_si(x, p);
  arb_div_si(x, x, q, prec);
}

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

  /* c0 = m_0 = 1  (tanh(t)/t -> 1 as t -> 0) */
  arb_one(c0);

  /* alpha_0 = 0  (diagonal coefficient at M=0; tanh is odd) */
  arb_zero(alpha);

  pade_resolvent_init(ctx, c0, alpha);

  /*
   * Advance the J-fraction with the tanh reciprocal coefficients
   *   alpha_k = 0,  beta_k = -1/((2k-1)(2k+1)),  k = 1 .. STEPS.
   */
  arb_zero(alpha);
  const slong STEPS = 8;
  for (slong k = 1; k <= STEPS; k++)
  {
    arb_set_rational_si(beta, -1, (2 * k - 1) * (2 * k + 1), prec);
    pade_resolvent_step(ctx, alpha, beta, prec);
  }

  /* Evaluate R(0.5) */
  arb_set_str(z, "0.5", prec);
  pade_resolvent_evaluate(res, ctx, z, prec);

  /* Reference: tanh(0.5)/0.5 (the function this J-fraction reconstructs) */
  arb_tanh(ref, z, prec);
  arb_div(ref, ref, z, prec);

  /* Error */
  arb_sub(err, res, ref, prec);
  arb_abs(err, err);

  arb_t threshold;
  arb_init(threshold);
  arb_set_str(threshold, "1e-15", prec);

  if (arb_lt(err, threshold))
  {
    flint_printf("pade_resolvent smoke test PASSED: |R(0.5) - tanh(0.5)/0.5| < 1e-15\n");
    flint_printf("  R(0.5)        = ");
    arb_printn(res, 20, 0);
    flint_printf("\n  tanh(0.5)/0.5 = ");
    arb_printn(ref, 20, 0);
    flint_printf("\n  error = ");
    arb_printn(err, 5, 0);
    flint_printf("\n");
    pass = 1;
  }
  else
  {
    flint_printf("pade_resolvent smoke test FAILED\n");
    flint_printf("  R(0.5)        = ");
    arb_printn(res, 20, 0);
    flint_printf("\n  tanh(0.5)/0.5 = ");
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
