
%wrapper %{
#include <flint/fmpq.h>
#include <flint/fmpq_poly.h>
#include <flint/fmpz_poly.h>
#include <flint/fmpz_poly_q.h>
#include <flint/fexpr.h>

extern int errorNumber();

JNIEnv* env;

jlong bufferAddress (jobject buffer);

void arb_add_error_ulp(arb_t x, slong n);

void arb_pow_si(arb_t res, const arb_t x, slong y, slong prec);

typedef arb_ptr* arb_vec;

jboolean unmapAndCloseFile( int fd, jlong pointer, int size );

jlong openOrCreateMemoryMappedFile(jobject path, int *fd, int bytes);

int errorNumber();

void *allocate(size_t size)
{
  void *ptr = malloc(size);
  return ptr;
}

void *callocate(size_t m, size_t size)
{
  void *ptr = calloc(m,size);

  return ptr;
}

void *reallocate(void *ptr, size_t size)
{

  void *newptr = realloc(ptr,size);
  return newptr;
}

void deallocate(void *ptr)
{
  free(ptr);
}

jint JNI_OnLoad (JavaVM *vm, void *reserved)
{
  if ((*vm)->GetEnv(vm, (void**) &env, JNI_VERSION_10) != JNI_OK)
  {
    printf("GetEnv failed trying to load arb\n");
    fflush(stdout);
    return -1;
  }

  //__flint_set_memory_functions(&allocate, &callocate, &reallocate, &deallocate);

  return JNI_VERSION_10;
}


%}