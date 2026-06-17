/*
 * Generic partial-fraction decomposition for complex-ball polynomials.
 *
 * Decomposes P/Q = quotient + sum_j residue[j]/(v - pole[j]).
 * Uses Euclidean division, acb_poly_find_roots for pole isolation,
 * and the Heaviside cover-up formula for residues.
 */

#include "partial_fraction.h"

void arb4j_partial_fraction_init(arb4j_partial_fraction_t *pf)
{
  acb_poly_init(pf->quotient);
  pf->poles = NULL;
  pf->residues = NULL;
  pf->n = 0;
}

void arb4j_partial_fraction_clear(arb4j_partial_fraction_t *pf)
{
  if (pf == NULL)
    return;
  acb_poly_clear(pf->quotient);
  if (pf->poles != NULL)
    _acb_vec_clear(pf->poles, pf->n);
  if (pf->residues != NULL)
    _acb_vec_clear(pf->residues, pf->n);
  pf->poles = NULL;
  pf->residues = NULL;
  pf->n = 0;
}

int arb4j_partial_fraction_decompose(arb4j_partial_fraction_t *pf,
                                     const acb_poly_t P,
                                     const acb_poly_t Q,
                                     slong prec)
{
  slong degQ;
  acb_poly_t R, Qder;
  acb_t q0;
  acb_ptr roots;
  slong i;

  if (pf == NULL)
    return -1;

  arb4j_partial_fraction_clear(pf);
  arb4j_partial_fraction_init(pf);

  degQ = acb_poly_degree(Q);
  if (degQ <= 0)
  {
    acb_poly_set(pf->quotient, P);
    pf->n = 0;
    return 0;
  }

  acb_poly_init(R);
  acb_poly_init(Qder);
  acb_init(q0);

  /* Euclidean division: P = quotient*Q + R, deg(R) < deg(Q) */
  acb_poly_divrem(pf->quotient, R, P, Q, prec);

  /* Isolate poles (roots of Q). */
  roots = _acb_vec_init(degQ);
  if (acb_poly_find_roots(roots, Q, NULL, 0, prec) != degQ)
  {
    _acb_vec_clear(roots, degQ);
    acb_poly_clear(R);
    acb_poly_clear(Qder);
    acb_clear(q0);
    return -2;
  }

  /* Derivative of denominator for the cover-up formula. */
  acb_poly_derivative(Qder, Q, prec);

  pf->poles = _acb_vec_init(degQ);
  pf->residues = _acb_vec_init(degQ);
  pf->n = degQ;

  for (i = 0; i < degQ; i++)
  {
    acb_set(pf->poles + i, roots + i);
    acb_poly_evaluate(pf->residues + i, R, roots + i, prec);
    acb_poly_evaluate(q0, Qder, roots + i, prec);
    acb_div(pf->residues + i, pf->residues + i, q0, prec);
  }

  _acb_vec_clear(roots, degQ);
  acb_poly_clear(R);
  acb_poly_clear(Qder);
  acb_clear(q0);

  return (int) pf->n;
}

void arb4j_partial_fraction_evaluate(acb_t res,
                                     const arb4j_partial_fraction_t *pf,
                                     const acb_t z,
                                     slong prec)
{
  slong i;
  acb_t t, s;
  acb_init(t);
  acb_init(s);

  acb_poly_evaluate(res, pf->quotient, z, prec);

  for (i = 0; i < pf->n; i++)
  {
    acb_sub(t, z, pf->poles + i, prec);
    acb_div(s, pf->residues + i, t, prec);
    acb_add(res, res, s, prec);
  }

  acb_clear(t);
  acb_clear(s);
}

void arb4j_partial_fraction_get_pole(acb_t res,
                                     const arb4j_partial_fraction_t *pf,
                                     slong i)
{
  if (pf != NULL && i >= 0 && i < pf->n)
    acb_set(res, pf->poles + i);
  else
    acb_zero(res);
}

void arb4j_partial_fraction_get_residue(acb_t res,
                                        const arb4j_partial_fraction_t *pf,
                                        slong i)
{
  if (pf != NULL && i >= 0 && i < pf->n)
    acb_set(res, pf->residues + i);
  else
    acb_zero(res);
}
