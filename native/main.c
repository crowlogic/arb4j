#include <stdio.h>
#include "flint/flint.h"
#include "flint/arb.h"
#include "pade_resolvent.h"
#include "riccati_spectral_engine.h"

int main(void)
{
  slong target_bits  = 256;
  slong working_prec = target_bits + 128;

  arb_t a, b, c_coeff, alpha_order;
  arb_init(a);
  arb_init(b);
  arb_init(c_coeff);
  arb_init(alpha_order);

  arb_set_d(a, 1.0);
  arb_set_d(b, -1.0);
  arb_set_d(c_coeff, -0.5);
  arb_set_d(alpha_order, 0.5);

  arb_t t, current_z, result;
  arb_init(t);
  arb_init(current_z);
  arb_init(result);
  arb_set_d(t, 2.5);
  arb_pow(current_z, t, alpha_order, working_prec);

  int precision_met = 0;

  while (!precision_met)
  {
    spectral_engine_t engine;
    spectral_engine_init(engine, a, b, c_coeff, alpha_order);

    pade_resolvent_t resolvent;
    arb_t            alpha, beta;
    arb_init(alpha);
    arb_init(beta);

    spectral_engine_next_jacobi(alpha, beta, engine, working_prec);

    arb_t c0;
    arb_init(c0);
    arb_poly_get_coeff_arb(c0, engine->u, 1);
    pade_resolvent_init(resolvent, c0, alpha);
    arb_clear(c0);

    pade_resolvent_set_debug(resolvent, 0);

    slong M = 2;
    while (1)
    {
      spectral_engine_next_jacobi(alpha, beta, engine, working_prec);
      pade_resolvent_step(resolvent, alpha, beta, working_prec);

      if (arb_rel_accuracy_bits(resolvent->Q_curr->coeffs + resolvent->degree) < 16)
      {
        flint_printf("[!] Loss of significance detected at M = %wd.\n", M);
        break;
      }

      if (M % 10 == 0)
      {
        pade_resolvent_evaluate(result, resolvent, current_z, working_prec);
        arb_mul(result, result, current_z, working_prec);

        slong valid_bits = arb_rel_accuracy_bits(result);
        if (valid_bits >= target_bits)
        {
          precision_met = 1;
          flint_printf("\n>>> Target reached at M = %wd: %wd bits.\n", M, valid_bits);
          break;
        }
      }
      M++;
    }

    if (!precision_met)
    {
      working_prec = (working_prec * 3) / 2;
      flint_printf("Scaling precision to %wd bits and restarting...\n", working_prec);
    }

    arb_clear(alpha);
    arb_clear(beta);
    pade_resolvent_clear(resolvent);
    spectral_engine_clear(engine);
  }

  flint_printf("\nGlobal target output [y(t)]: ");
  arb_printn(result, target_bits / 3.3219, 0);
  flint_printf("\n\n");

  arb_clear(a);
  arb_clear(b);
  arb_clear(c_coeff);
  arb_clear(alpha_order);
  arb_clear(t);
  arb_clear(current_z);
  arb_clear(result);

  return 0;
}
