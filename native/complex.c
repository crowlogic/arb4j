#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <flint/fmpz.h>
#include <mpfr.h>
#include <flint/flint.h>
#include <arf.h>
#include <arb.h>
#include <acb.h>
#include <acb_calc.h>
#include <acb_elliptic.h>
#include <acb_poly.h>
#include <acb_dirichlet.h>
#include <dirichlet.h>
#include <acb_modular.h>
#include <sys/mman.h>

#include "color.h"
#ifndef size_t
#define size_t long unsigned int
#endif

extern JNIEnv *env;

int errorNumber()
{
  return errno;
}

jlong
openOrCreateMemoryMappedFile (jobject path, int *fd, int bytes)
{
  char *filename = (char*) 0;

  if (path)
  {
    filename = (char*) (*env)->GetStringUTFChars(env, path, 0);
    if (!filename)
    {
      fprintf(stderr, "GetStringUTFChars failed\n");
      return 0;
    }
  }

  int retval = 0;

  printf("Need to open %s\n ", filename);
  (*fd) = open( filename, O_RDWR | O_CREAT, 0666 );
  if ( (*fd) == -1 )
  {
    fprintf(stderr, "Failed to open %s\n", filename );
  }
  else
  {
    printf("Opened %s was assigned fd=%d\n", filename, (*fd) );
    if ( ftruncate((*fd), bytes ) != 0 )
    {
      fprintf(stderr, "ftruncate %s size %d failed with errno=%d\n", filename, bytes, errno );
      close((*fd));
    }
    retval = (jlong)mmap(0, bytes, PROT_READ | PROT_WRITE, MAP_SHARED, (*fd), 0);
    printf("Mapped %d bytes of %s to 0x%x\n", bytes, filename, retval );
  }

  (*env)->ReleaseStringUTFChars(env, path, filename);
  return retval;
}

jlong
bufferAddress (jobject buffer)
{
  return (jlong) (*env)->GetDirectBufferAddress(env, buffer);
}







int
f_lemniscate (acb_ptr res, const acb_t z, void *param, slong order, slong prec)
{
  if (order > 1)
    flint_abort(); /* Would be needed for Taylor method. */

  //res=(√2*I*Cos[t])/(I + Sin[t])
  acb_t a, numerator, divisor;
  acb_init(a);
  acb_init(numerator);
  acb_init(divisor);

  acb_cos(a, z, prec);
  acb_mul_si(numerator, a, 2, prec);
  acb_sin(a, z, prec);
  acb_mul_onei(divisor, a);
  acb_neg(divisor, divisor);
  acb_add_ui(divisor, divisor, 1, prec);
  acb_div(res, numerator, divisor, prec);

  acb_clear(a);
  acb_clear(numerator);
  acb_clear(divisor);

  return 0;
}

int
f_lemniscate_derivative (acb_ptr res, const acb_t z, void *param, slong order, slong prec)
{
  // numerator=2*(Sin[z]-I)
  // denominator=(Sin[z]+I)^2
  acb_t a, numerator, denominator;
  acb_init(a);
  acb_init(numerator);
  acb_init(denominator);
  acb_sin(a, z, prec);
  acb_set(numerator, a);
  arb_sub_ui(acb_imagref(numerator), acb_imagref(numerator), 1, prec);
  acb_mul_ui(numerator, numerator, 2, prec);
  acb_set(denominator, a);
  arb_add_ui(acb_imagref(denominator), acb_imagref(denominator), 1, prec);
  acb_pow_ui(denominator, denominator, 2, prec);
  acb_div(res, numerator, denominator, prec);
  acb_clear(a);
  acb_clear(numerator);
  acb_clear(denominator);
  return 0;
}

int
f_lemniscate_derivative_abs (acb_ptr res, const acb_t z, void *param, slong order, slong prec)
{
  int status = f_lemniscate_derivative(res, z, param, order, prec);
  if (status == 0)
  {
    acb_abs(acb_realref(res), res, prec);
    arb_zero(acb_imagref(res));
  }
  return status;
}

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL
Java_arblib_arblibJNI_Complex_1real_1set (JNIEnv *jenv, jclass jcls, jlong jarg1, jobject jarg1_, jlong jarg2,
                                          jobject jarg2_)
{
  acb_struct *arg1 = (acb_struct*) 0;
  arb_struct *arg2 = (arb_struct*) 0;

  (void) jenv;
  (void) jcls;
  (void) jarg1_;
  (void) jarg2_;
  arg1 = *(acb_struct**) &jarg1;
  arg2 = *(arb_struct**) &jarg2;
  if (arg1)
    (arg1)->real = *arg2;
}

JNIEXPORT jlong JNICALL
Java_arblib_arblibJNI_Complex_1real_1get (JNIEnv *jenv, jclass jcls, jlong jarg1, jobject jarg1_)
{
  jlong jresult = 0;
  acb_struct *arg1 = (acb_struct*) 0;
  arb_struct *result = 0;

  (void) jenv;
  (void) jcls;
  (void) jarg1_;
  arg1 = *(acb_struct**) &jarg1;
  result = (arb_struct*) &((arg1)->real);
  *(arb_struct**) &jresult = result;
  return jresult;
}

JNIEXPORT void JNICALL
Java_arblib_arblibJNI_Complex_1imag_1set (JNIEnv *jenv, jclass jcls, jlong jarg1, jobject jarg1_, jlong jarg2,
                                          jobject jarg2_)
{
  acb_struct *arg1 = (acb_struct*) 0;
  arb_struct *arg2 = (arb_struct*) 0;

  (void) jenv;
  (void) jcls;
  (void) jarg1_;
  (void) jarg2_;
  arg1 = *(acb_struct**) &jarg1;
  arg2 = *(arb_struct**) &jarg2;
  if (arg1)
    (arg1)->imag = *arg2;
}

#ifdef __cplusplus
}
#endif

