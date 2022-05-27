
%wrapper %{
#include <jni.h>

JNIEnv*   env;
jobject   heap;
jmethodID allocateMethod;
jmethodID callocateMethod;
jmethodID reallocateMethod;
jmethodID deallocateMethod;

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
  if ((*vm)->GetEnv(vm, (void**) &env, JNI_VERSION_10) != JNI_OK)
  {
    printf("GetEnv failed trying to load arb\n");
    fflush(stdout);
    return -1;
  }

  jclass                heapClass = (*env)->FindClass(env,   "arb/Heap" );
  jmethodID       heapConstructor = (*env)->GetMethodID(env, heapClass, "<init>",  "()V");
                   allocateMethod = (*env)->GetMethodID(env, heapClass, "malloc",  "(J)J");
                  callocateMethod = (*env)->GetMethodID(env, heapClass, "calloc",  "(JJ)J");
                 reallocateMethod = (*env)->GetMethodID(env, heapClass, "realloc", "(JJ)J");
                 deallocateMethod = (*env)->GetMethodID(env, heapClass, "free",    "(J)V");

  heap = (*env)->NewObject(env,heapClass,heapConstructor);
  if ( !heap )  
  {
    (*env)->FatalError(env, "Failed to instantiate a new Heap instance\n");
  }
    
  __flint_set_memory_functions(&allocate, &callocate, &reallocate, &deallocate);

  return JNI_VERSION_10;
}
%}