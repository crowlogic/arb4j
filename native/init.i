
%wrapper %{
#include <jni.h>

#include <jni.h>

JNIEnv* env;

jclass heapClass;
jmethodID allocateMethod;
jmethodID callocateMethod;
jmethodID reallocateMethod;
jmethodID deallocateMethod;

void *allocate(size_t size)
{
  void *ptr = malloc(size);
// printf("fucking allocated %i bytes at 0x%x\n", size, ptr );
  //env->CallStaticVoidMethod( heapClass, allocateMethod, (jlong)ptr, (jlong)size);
  return ptr;
}

void *callocate(size_t m, size_t size)
{
  void *ptr = calloc(m,size);
  //env->CallStaticVoidMethod(heapClass,callocateMethod,ptr,m,size);
   //  printf("fucking callocated size=%i at 0x%x\n", size, ptr );
 
  return ptr;
}

void *reallocate(void *ptr, size_t size)
{
  void *newptr = realloc(ptr,size);
 // env->CallStaticVoidMethod(heapClass,reallocateMethod,(jlong)ptr, (jlong)newptr, (jlong)size);
   // printf("fucking reallocated size=%i at 0x%x\n", size, ptr );
 
  return newptr;
}

void deallocate(void *ptr)
{
  free(ptr);
 // printf("fucking freed 0x%x\n", ptr );
  //env->CallStaticVoidMethod(heapClass,deallocateMethod,(jlong)ptr);
}

jint JNI_OnLoad (JavaVM *vm, void *reserved)
{
  if (vm->GetEnv((void**) &env, JNI_VERSION_10) != JNI_OK)
  {
    printf("GetEnv failed trying to load arb\n");
    fflush(stdout);
    return -1;
  }

  if ( ! ( heapClass = env->FindClass( "arb/Heap" ) ) )
  {
    env->FatalError( "Failed to find the heap tracking class arb.Heap\n");
  }

                   allocateMethod = env->GetStaticMethodID( heapClass, "malloc",  "(JJ)V"),
                  callocateMethod = env->GetStaticMethodID( heapClass, "calloc",  "(JJ)V"),
                 reallocateMethod = env->GetStaticMethodID( heapClass, "realloc", "(JJJ)V"),
                 deallocateMethod = env->GetStaticMethodID( heapClass, "free",    "(J)V");

  if ( !allocateMethod || !callocateMethod || !reallocateMethod || !deallocateMethod )
  {
    printf("hmm alloc=0x%x calloc=0x%x realloc=0x%x dealloc=0x%x\n", allocateMethod, callocateMethod, reallocateMethod, deallocate );
    env->FatalError( "Failed to find the at least one of the methods in arb.Heap\n");
  }
 // __flint_set_memory_functions(&allocate, &callocate, &reallocate, &deallocate);

  return JNI_VERSION_10;
}
%}