#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <flint/fmpz.h>
#include <flint/fmpz_poly.h>
#include <mpfr.h>
#include <flint/flint.h>
#include <flint/fmpq.h>
#include <flint/fmpq_poly.h>
#include <flint/qqbar.h>
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
#include <jni.h>

#ifndef size_t

#define size_t long unsigned int
#endif

extern JNIEnv *env;


int errorNumber()
{
  return errno;
}

void
arb_pow_si(arb_t res, const arb_t x, slong y, slong prec)
{
   arb_t a;
   arb_init(a);
   arb_set_si(a, y);
   arb_pow(res, x, a, prec);
   arb_clear(a);
}

jlong
bufferAddress (jobject buffer)
{
  return (jlong) (*env)->GetDirectBufferAddress(env, buffer);
}

#ifdef __cplusplus
extern "C" {
#endif

 void
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

 jlong
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

 void
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

