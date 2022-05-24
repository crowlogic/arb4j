
%wrapper %{
#include <jni.h>

extern JNIEnv* env;
extern jclass realClass;
extern jclass complexClass;
extern jclass realFunctionClass;
extern jclass complexFunctionClass;
extern jmethodID realFunctionEvaluationMethod;
extern jmethodID complexFunctionEvaluationMethod;
extern jfieldID realCPtrField;
extern jfieldID complexCPtrField;

JNIEnv *env;

void *allocate(size_t size)
{
  return malloc(size);
}

void *callocate(size_t m, size_t size)
{
  return calloc(m, size);
}

void *reallocate(void *ptr, size_t size)
{
  return realloc(ptr,size);
}

void deallocate(void *ptr)
{
  free(ptr);
}


jint
JNI_OnLoad (JavaVM *vm, void *reserved)
{
  __flint_set_memory_functions(&allocate, &callocate, &reallocate, &deallocate );

  if ((*vm)->GetEnv(vm, (void**) &env, JNI_VERSION_10) != JNI_OK)
  {
    printf("GetEnv failed trying to load arb\n");
    fflush(stdout);
    return -1;
  }


  return JNI_VERSION_10;
}


%}