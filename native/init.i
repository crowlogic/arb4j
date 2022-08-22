
%wrapper %{


extern int errorNumber();

JNIEnv* env;

void *allocate(size_t size)
{
  void *ptr = malloc(size);
;
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

jlong bufferAddress(jobject buffer);

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