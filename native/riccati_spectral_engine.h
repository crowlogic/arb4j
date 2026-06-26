#ifndef RICCATI_SPECTRAL_ENGINE_H
#define RICCATI_SPECTRAL_ENGINE_H

#include "flint/flint.h"
#include "flint/arb.h"
#include "flint/arb_poly.h"

typedef struct {
    arb_poly_t u;              /* Infinite array for Puiseux moments */
    arb_poly_t alpha_arr;      /* Infinite array for Jacobi alphas */
    arb_poly_t beta_arr;       /* Infinite array for Jacobi betas */
    
    arb_poly_struct *sigma;    /* Dynamically scaling 2D Chebyshev map */
    slong sigma_alloc;         /* Tracks geometric row capacity */
    
    slong u_count;          
    slong mca_M;            
    arb_t a, b, c, alpha;   
} spectral_engine_struct;

typedef spectral_engine_struct spectral_engine_t[1];

#ifdef __cplusplus
extern "C" {
#endif

/* NO CAPACITY LIMITS: The engine initializes minimally and scales itself geometrically */
void spectral_engine_init(spectral_engine_t eng, const arb_t a, const arb_t b, const arb_t c, const arb_t alpha);
void spectral_engine_clear(spectral_engine_t eng);
void spectral_engine_next_jacobi(arb_t alpha_out, arb_t beta_out, spectral_engine_t eng, slong prec);

#ifdef __cplusplus
}
#endif

#endif
