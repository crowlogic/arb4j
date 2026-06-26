#ifndef PADE_RESOLVENT_H
#define PADE_RESOLVENT_H

/*
 * Zero-allocation Maclaurin-Pade resolvent engine.
 *
 * Computes the diagonal [M/M] Pade approximant of the formal Maclaurin series
 * whose Jacobi recurrence coefficients alpha_k, beta_k are supplied
 * one step at a time.  The recurrence is the RECIPROCAL form:
 *
 *   W_{M+1}(z) = (1 - alpha_M * z) * W_M(z) - beta_M * z^2 * W_{M-1}(z)
 *
 * which evaluates the Stieltjes transform expanded near z = 0, matching the
 * Maclaurin series of the local Pade approximant.  (The non-reciprocal
 * recurrence (z - alpha_M) * W_M - beta_M * W_{M-1} computes the Stieltjes
 * transform expanded at z = infinity and would explode the interval bounds.)
 *
 * The struct pulls all temporary workspaces (T1, T2, T3) inside itself so
 * that zero heap allocations occur during the recurrence execution: the swap
 * trick in pade_resolvent_step rotates the underlying dynamic-array memory
 * of old polynomials into T3 for reuse in the next step without ever calling
 * free()/malloc().
 */

#include "flint/flint.h"
#include "flint/arb.h"
#include "flint/arb_poly.h"
#include "flint/acb_poly.h"

typedef struct
{
  arb_poly_t P_curr;
  arb_poly_t P_prev;
  arb_poly_t Q_curr;
  arb_poly_t Q_prev;

  /* Pre-allocated workspaces for O(N) shift-and-subtract logic */
  arb_poly_t T1;
  arb_poly_t T2;
  arb_poly_t T3;

  slong      degree;
} pade_resolvent_struct;

typedef pade_resolvent_struct pade_resolvent_t[1];

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Initialises the Pade table at M = 1 with the first moment c0 and the
 * first Jacobi diagonal coefficient alpha0.
 *
 *   Q_prev = Q_0(z) = 1
 *   P_prev = P_0(z) = 0
 *   Q_curr = Q_1(z) = 1 - alpha0 * z
 *   P_curr = P_1(z) = c0
 */
void pade_resolvent_init(pade_resolvent_t ctx,
                         const arb_t     c0,
                         const arb_t     alpha0);

/*
 * Releases all arb_poly allocations owned by ctx.
 */
void pade_resolvent_clear(pade_resolvent_t ctx);

/*
 * Advances the Pade table by one degree using the O(N) shift-and-subtract
 * Maclaurin recurrence.  No heap allocation occurs; all work is done inside
 * the pre-allocated workspaces T1, T2, T3 with O(1) pointer swaps at the end.
 *
 * After the call: degree is incremented and (P_curr, Q_curr) hold the new
 * [degree/degree] Pade pair, (P_prev, Q_prev) the previous one.
 */
void pade_resolvent_step(pade_resolvent_t ctx,
                         const arb_t      alpha,
                         const arb_t      beta,
                         slong            prec);

/*
 * Evaluates R_M(z) = P_curr(z) / Q_curr(z) at the ball z.
 */
void pade_resolvent_evaluate(arb_t            res,
                              const pade_resolvent_t ctx,
                              const arb_t      z,
                              slong            prec);

/*
 * Finds the complex roots of Q_curr (the poles of R_M).
 * The caller must pre-allocate roots as an array of exactly
 * arb_poly_degree(ctx->Q_curr) acb elements.
 */
void pade_resolvent_extract_poles(acb_ptr                roots,
                                  const pade_resolvent_t ctx,
                                  slong                  prec);

#ifdef __cplusplus
}
#endif

#endif /* PADE_RESOLVENT_H */
