#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <flint/fmpz.h>
#include <flint/fmpz_poly.h>
#include <flint/fexpr.h>
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
#include <sys/select.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <regex.h>
#include <ctype.h>
#include <locale.h>
#include <stdarg.h>
#include <X11/Xlib.h>
#include <X11/X.h>
#include <unistd.h>
#include <wchar.h>

typedef unsigned long Window;

typedef struct charcodemap {
  wchar_t key; /** the letter for this key, like 'a' */
  KeyCode code; /** the keycode that this key is on */
  KeySym symbol; /** the symbol representing this key */
  int group; /** the keyboard group that has this key in it */
  int modmask; /** the modifiers to apply when sending this key */
   /** if this key need to be bound at runtime because it does not
    * exist in the current keymap, this will be set to 1. */
  int needs_binding;
} charcodemap_t;
// Define the xdo_t structure
typedef struct {
    Display *xdpy;
    char *display_name;
    charcodemap_t *charcodes;
    int charcodes_len;
    XModifierKeymap *modmap;
    KeySym *keymap;
    int keycode_high;
    int keycode_low;
    int keysyms_per_keycode;
    int close_display_when_freed;
    int quiet;
    int debug;
    int features_mask;
} xdo_struct;



#ifndef size_t

#define size_t long unsigned int
#endif

typedef unsigned long Window;

extern JNIEnv *env;


int xdo_activate_window(const xdo_struct *xdo, Window wid) {
  int ret = 0;
  long desktop = 0;
  XEvent xev;
  XWindowAttributes wattr;

  memset(&xev, 0, sizeof(xev));
  xev.type = ClientMessage;
  xev.xclient.display = xdo->xdpy;
  xev.xclient.window = wid;
  xev.xclient.message_type = XInternAtom(xdo->xdpy, "_NET_ACTIVE_WINDOW", False);
  xev.xclient.format = 32;
  xev.xclient.data.l[0] = 2L; /* 2 == Message from a window pager */
  xev.xclient.data.l[1] = CurrentTime;

  XGetWindowAttributes(xdo->xdpy, wid, &wattr);
  ret = XSendEvent(xdo->xdpy, wattr.screen->root, False,
                   SubstructureNotifyMask | SubstructureRedirectMask,
                   &xev);
  XFlush(xdo->xdpy);

  /* XXX: XSendEvent returns 0 on conversion failure, nonzero otherwise.
   * Manpage says it will only generate BadWindow or BadValue errors */
  return ret != 0;
}

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

