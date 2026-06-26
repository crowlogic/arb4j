#ifndef PADE_RESOLVENT_H
#define PADE_RESOLVENT_H

#include "flint/flint.h"
#include "flint/arb.h"
#include "flint/arb_poly.h"
#include "flint/acb_poly.h"

/* THE SPECTRAL MEASURE RECONSTRUCTOR (MARKOV'S THEOREM)
 * Represents the M-th point discrete Gaussian quadrature of the Stieltjes measure.
 * The T1-T3 workspaces guarantee strictly O(N) operations. FLINT natively handles 
 * geometric capacity doubling under the hood to scale to infinity.
 */
typedef struct {
    arb_poly_t P_curr, P_prev, Q_curr, Q_prev;
    arb_poly_t T1, T2, T3; 
    slong degree;
    
    /* Telemetry flag: 0 = Silent Execution, 1 = Verbose Flush-Locked Output */
    int debug_mode; 
} pade_resolvent_struct;

typedef pade_resolvent_struct pade_resolvent_t[1];

#ifdef __cplusplus
extern "C" {
#endif

void pade_resolvent_init(pade_resolvent_t ctx, const arb_t c0, const arb_t alpha0);
void pade_resolvent_set_debug(pade_resolvent_t ctx, int toggle);
void pade_resolvent_clear(pade_resolvent_t ctx);
void pade_resolvent_step(pade_resolvent_t ctx, const arb_t alpha, const arb_t beta, slong prec);
void pade_resolvent_evaluate(arb_t res, const pade_resolvent_t ctx, const arb_t z, slong prec);
slong pade_resolvent_extract_poles(acb_ptr roots, const pade_resolvent_t ctx, slong maxiter, slong prec);

#ifdef __cplusplus
}
#endif

#endif
