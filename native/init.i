%header %{
#include <map>
%}

%wrapper %{

JNIEnv* env;

jclass heapClass;
jmethodID allocateMethod;
jmethodID callocateMethod;
jmethodID reallocateMethod;
jmethodID deallocateMethod;
std::map<void*,size_t> allocations;

void printStackTrace(JNIEnv *env) 
{
    jclass cls = env->FindClass("java/lang/Exception");
    if (cls != NULL) 
    {
        jmethodID constructor = env->GetMethodID(cls, "<init>", "()V");
        if(constructor != NULL) 
        {
            jobject exc = env->NewObject(cls, constructor);
            if(exc != NULL)
             {
                jmethodID printStackTrace = env->GetMethodID(cls, "printStackTrace", "()V");
                if(printStackTrace != NULL) 
                {
                    env->CallObjectMethod(exc, printStackTrace);
                } 
            } 
            env->DeleteLocalRef(exc);
        } 
    } 
    /* free the local ref */
    env->DeleteLocalRef(cls);
}

void *allocate(size_t size)
{
  void *ptr = malloc(size);
	//  use Thread#getStackTrace
	allocations[ptr] = size;
  return ptr;
}

void *callocate(size_t m, size_t size)
{
  void *ptr = calloc(m,size);
  for ( int i = 0; i < m; i++ )
  {
    allocations[ptr+i] = size;
  }

  return ptr;
}

void *reallocate(void *ptr, size_t size)
{
  if ( allocations.erase(ptr) == 0 )
  {
   char msg[300];
   sprintf(msg,"Tried to reallocate pointer 0x%p which  hasn't been allocated\n", ptr );   
   env->FatalError( msg );
  }
  void *newptr = realloc(ptr,size);
  allocations[newptr] = size;

  return newptr;
}

void deallocate(void *ptr)
{
  if ( allocations.erase(ptr) == 0 )
  {
   char msg[300];
   sprintf(msg,"Tried to free pointer 0x%p which  hasn't been allocated\n", ptr );   
   env->FatalError( msg );
  }
  
  free(ptr);
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
    env->FatalError( "Failed to find the at least one of the methods in arb.Heap\n");
  }
 // __flint_set_memory_functions(&allocate, &callocate, &reallocate, &deallocate);

  return JNI_VERSION_10;
}
%}