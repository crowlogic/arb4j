#include <acb.h>

#include <jni.h>
#include <unistd.h>

jlong bufferAddress (jobject buffer);


void arb_add_error_ulp(arb_t x, slong n);

 void
arb_pow_si(arb_t res, const arb_t x, slong y, slong prec);

typedef arb_ptr* arb_vec;

jboolean unmapAndCloseFile( int fd, jlong pointer, int size );

jlong openOrCreateMemoryMappedFile(jobject path, int *fd, int bytes);

int errorNumber();

void  color_function(double * R, double * G, double * B, const acb_t z, int mode);

void nthHardyZero( arb_t res, int n, slong prec );

void acb_calc_gl_node(arb_t x, arb_t w, slong i, slong k, slong prec);
