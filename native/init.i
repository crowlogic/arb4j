
%wrapper %{
#include <jni.h>

#include <jni.h>

JNIEnv* env;
jobject heap;
jmethodID allocateMethod;
jmethodID callocateMethod;
jmethodID reallocateMethod;
jmethodID deallocateMethod;

void *allocate(size_t size)
{
  return (void*) (*env)->CallLongMethod(env, heap, allocateMethod, (jlong)size);
}

void *callocate(size_t m, size_t size)
{
  return (void*)(*env)->CallLongMethod(env,heap,callocateMethod,m,size);
}

void *reallocate(void *ptr, size_t size)
{
  return (void*)(*env)->CallLongMethod(env,heap,reallocateMethod,(jlong)ptr,(jlong)size);
}

void deallocate(void *ptr)
{
  (*env)->CallVoidMethod(env,heap,deallocateMethod,(jlong)ptr);
}

jint JNI_OnLoad (JavaVM *vm, void *reserved)
{
  if ((*vm)->GetEnv(vm, (void**) &env, JNI_VERSION_10) != JNI_OK)
  {
    printf("GetEnv failed trying to load arb\n");
    fflush(stdout);
    return -1;
  }

  jclass             memUtilClass = (*env)->FindClass(env, "org/lwjgl/system/MemoryUtil" );
  jclass                heapClass = (*env)->FindClass(env, "org/lwjgl/system/MemoryUtil$MemoryAllocator" );
  if ( !heapClass )
  {
    (*env)->FatalError(env, "Failed to find the memory allocator class\n");
  }

  jmethodID      heapGetterMethod = (*env)->GetStaticMethodID(env, memUtilClass, "getAllocator", "(Z)Lorg/lwjgl/system/MemoryUtil$MemoryAllocator;");
                   allocateMethod = (*env)->GetMethodID(env, heapClass, "malloc",  "(J)J"),
                  callocateMethod = (*env)->GetMethodID(env, heapClass, "calloc",  "(JJ)J"),
                 reallocateMethod = (*env)->GetMethodID(env, heapClass, "realloc", "(JJ)J"),
                 deallocateMethod = (*env)->GetMethodID(env, heapClass, "free",    "(J)V");

  heap = (*env)->CallStaticObjectMethod( env, memUtilClass, heapGetterMethod, JNI_TRUE );

  if ( !heap )  
  {
    (*env)->FatalError(env, "Failed to instantiate a new Heap instance\n");
  }

  if ( !allocateMethod )
  {
    (*env)->FatalError(env, "Failed to find the allocate method\n");
  }
  //__flint_set_memory_functions(&allocate, &callocate, &reallocate, &deallocate);

  return JNI_VERSION_10;
}
%}