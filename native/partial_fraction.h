/*
 * Generic partial-fraction decomposition for complex-ball polynomials.
 *
 * Part of the arb4j library. Decomposes a rational function P/Q over the
 * complex numbers into a polynomial part plus a sum of simple poles:
 *
 *   P(v)/Q(v) = quotient(v) + sum_j residue[j] / (v - pole[j])
 *
 * The implementation uses Euclidean division, root isolation, and the
 * Heaviside cover-up formula. Poles are assumed simple (generic case).
 */

#ifndef ARB4J_PARTIAL_FRACTION_H
#define ARB4J_PARTIAL_FRACTION_H

#include <flint/acb_poly.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Result container. Arrays poles and residues are heap-allocated and
 * owned by the caller after a successful decomposition. */
typedef struct
{
  acb_poly_t quotient;
  acb_ptr    poles;
  acb_ptr    residues;
  slong      n;
} arb4j_partial_fraction_t;

void arb4j_partial_fraction_init(arb4j_partial_fraction_t *pf);
void arb4j_partial_fraction_clear(arb4j_partial_fraction_t *pf);

/* Decompose P/Q. Returns the number of poles on success (>=0), or a
 * negative value on failure. quotient, poles and residues are written
 * into *pf. */
int arb4j_partial_fraction_decompose(arb4j_partial_fraction_t *pf,
                                     const acb_poly_t P,
                                     const acb_poly_t Q,
                                     slong prec);

/* Convenience: evaluate the decomposed rational function at z. */
void arb4j_partial_fraction_evaluate(acb_t res,
                                     const arb4j_partial_fraction_t *pf,
                                     const acb_t z,
                                     slong prec);

/* Accessor for the i-th pole/residue (0 <= i < pf->n). */
void arb4j_partial_fraction_get_pole(acb_t res,
                                     const arb4j_partial_fraction_t *pf,
                                     slong i);

void arb4j_partial_fraction_get_residue(acb_t res,
                                        const arb4j_partial_fraction_t *pf,
                                        slong i);

#ifdef __cplusplus
}
#endif

#endif /* ARB4J_PARTIAL_FRACTION_H */
