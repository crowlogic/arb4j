#include <acb.h>

#include <jni.h>

typedef arb_ptr* arb_vec;

void  color_function(double * R, double * G, double * B, const acb_t z, int mode);

void nthHardyZero( arb_t res, int n, slong prec );

void acb_calc_gl_node(arb_t x, arb_t w, slong i, slong k, slong prec);
