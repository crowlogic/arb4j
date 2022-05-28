%header %{
#include <map>
%}

%wrapper %{

JNIEnv* env;

jint JNI_OnLoad (JavaVM *vm, void *reserved)
{
  if (vm->GetEnv((void**) &env, JNI_VERSION_10) != JNI_OK)
  {
    printf("GetEnv failed trying to load arb\n");
    fflush(stdout);
    return -1;
  }

//  __flint_set_memory_functions(&allocate, &callocate, &reallocate, &deallocate);

  return JNI_VERSION_10;
}
%}