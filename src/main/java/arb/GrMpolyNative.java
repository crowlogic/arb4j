package arb;

import static java.lang.foreign.ValueLayout.ADDRESS;
import static java.lang.foreign.ValueLayout.JAVA_BYTE;
import static java.lang.foreign.ValueLayout.JAVA_INT;
import static java.lang.foreign.ValueLayout.JAVA_LONG;
import java.lang.foreign.Arena;
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.Linker;
import java.lang.foreign.MemoryLayout;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SymbolLookup;
import java.lang.invoke.MethodHandle;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
final class GrMpolyNative
{
  static final int GR_SUCCESS = 0;
  static final int T_TRUE     = 0;

  static final MemoryLayout GR_CTX_LAYOUT = MemoryLayout.structLayout(MemoryLayout.sequenceLayout(48,
                                                                                                   JAVA_BYTE)
                                                                                  .withName("data"),
                                                                      JAVA_LONG.withName("which_ring"),
                                                                      JAVA_LONG.withName("sizeof_elem"),
                                                                      ADDRESS.withName("methods"),
                                                                      JAVA_LONG.withName("size_limit"));

  static final MemoryLayout GR_MPOLY_LAYOUT = MemoryLayout.structLayout(ADDRESS.withName("coeffs"),
                                                                        ADDRESS.withName("exps"),
                                                                        JAVA_LONG.withName("length"),
                                                                        JAVA_LONG.withName("bits"),
                                                                        JAVA_LONG.withName("coeffs_alloc"),
                                                                        JAVA_LONG.withName("exps_alloc"));

  private static final Linker       LINKER = Linker.nativeLinker();
  private static final SymbolLookup LOOKUP;

  private static final MethodHandle GR_CTX_INIT_REAL_ARB;
  private static final MethodHandle GR_CTX_INIT_COMPLEX_ACB;
  private static final MethodHandle GR_CTX_CLEAR;
  private static final MethodHandle GR_MPOLY_CTX_INIT;
  private static final MethodHandle GR_MPOLY_CTX_CLEAR;
  private static final MethodHandle GR_MPOLY_CTX_SET_GEN_NAMES;
  private static final MethodHandle GR_MPOLY_INIT;
  private static final MethodHandle GR_MPOLY_CLEAR;
  private static final MethodHandle GR_SET_STR;
  private static final MethodHandle GR_GET_STR;
  private static final MethodHandle FLINT_FREE;
  private static final MethodHandle GR_MPOLY_SET;
  private static final MethodHandle GR_MPOLY_SET_SI;
  private static final MethodHandle GR_MPOLY_ZERO;
  private static final MethodHandle GR_MPOLY_ONE;
  private static final MethodHandle GR_MPOLY_GEN;
  private static final MethodHandle GR_MPOLY_IS_ZERO;
  private static final MethodHandle GR_MPOLY_IS_ONE;
  private static final MethodHandle GR_MPOLY_IS_GEN;
  private static final MethodHandle GR_MPOLY_EQUAL;
  private static final MethodHandle GR_MPOLY_ADD;
  private static final MethodHandle GR_MPOLY_SUB;
  private static final MethodHandle GR_MPOLY_MUL;
  private static final MethodHandle GR_MPOLY_SET_COEFF_SI_UI;
  private static final MethodHandle GR_MPOLY_SET_COEFF_SCALAR_UI;
  private static final MethodHandle GR_MPOLY_GET_COEFF_SCALAR_UI;
  private static final MethodHandle GR_MPOLY_NEG;
  private static final MethodHandle GR_MPOLY_LENGTH;
  private static final MethodHandle GR_MPOLY_MUL_SCALAR;
  private static final MethodHandle GR_MPOLY_MUL_SI;

  static
  {
    NativeLibraryLoader.load("arblib");
    LOOKUP                     = SymbolLookup.loaderLookup();
    GR_CTX_INIT_REAL_ARB       = downcall("gr_ctx_init_real_arb",
                                    FunctionDescriptor.ofVoid(ADDRESS,
                                                              JAVA_LONG));
    GR_CTX_INIT_COMPLEX_ACB    = downcall("gr_ctx_init_complex_acb",
                                    FunctionDescriptor.ofVoid(ADDRESS,
                                                              JAVA_LONG));
    GR_CTX_CLEAR               = downcall("gr_ctx_clear",
                                    FunctionDescriptor.ofVoid(ADDRESS));
    GR_MPOLY_CTX_INIT          = downcall("gr_mpoly_ctx_init",
                                    FunctionDescriptor.ofVoid(ADDRESS,
                                                              ADDRESS,
                                                              JAVA_LONG,
                                                              JAVA_INT));
    GR_MPOLY_CTX_CLEAR         = downcall("gr_mpoly_ctx_clear",
                                    FunctionDescriptor.ofVoid(ADDRESS));
    GR_MPOLY_CTX_SET_GEN_NAMES = downcall("gr_mpoly_ctx_set_gen_names",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_INIT              = downcall("gr_mpoly_init",
                                    FunctionDescriptor.ofVoid(ADDRESS,
                                                              ADDRESS));
    GR_MPOLY_CLEAR             = downcall("gr_mpoly_clear",
                                    FunctionDescriptor.ofVoid(ADDRESS,
                                                              ADDRESS));
    GR_SET_STR                 = downcall("gr_set_str",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_GET_STR                 = downcall("gr_get_str",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS));
    FLINT_FREE                 = downcall("flint_free",
                                    FunctionDescriptor.ofVoid(ADDRESS));
    GR_MPOLY_SET               = downcall("gr_mpoly_set",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_SET_SI            = downcall("gr_mpoly_set_si",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          JAVA_LONG,
                                                          ADDRESS));
    GR_MPOLY_ZERO              = downcall("gr_mpoly_zero",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_ONE               = downcall("gr_mpoly_one",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_GEN               = downcall("gr_mpoly_gen",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          JAVA_LONG,
                                                          ADDRESS));
    GR_MPOLY_IS_ZERO           = downcall("gr_mpoly_is_zero",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_IS_ONE            = downcall("gr_mpoly_is_one",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_IS_GEN            = downcall("gr_mpoly_is_gen",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          JAVA_LONG,
                                                          ADDRESS));
    GR_MPOLY_EQUAL             = downcall("gr_mpoly_equal",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_ADD               = downcall("gr_mpoly_add",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_SUB               = downcall("gr_mpoly_sub",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_MUL               = downcall("gr_mpoly_mul",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_SET_COEFF_SI_UI   = downcall("gr_mpoly_set_coeff_si_ui",
                                    FunctionDescriptor.of(JAVA_INT,
                                                          ADDRESS,
                                                          JAVA_LONG,
                                                          ADDRESS,
                                                          ADDRESS));
    GR_MPOLY_SET_COEFF_SCALAR_UI = downcall("gr_mpoly_set_coeff_scalar_ui",
                                      FunctionDescriptor.of(JAVA_INT,
                                                            ADDRESS,
                                                            ADDRESS,
                                                            ADDRESS,
                                                            ADDRESS));
    GR_MPOLY_GET_COEFF_SCALAR_UI = downcall("gr_mpoly_get_coeff_scalar_ui",
                                       FunctionDescriptor.of(JAVA_INT,
                                                             ADDRESS,
                                                             ADDRESS,
                                                             ADDRESS,
                                                             ADDRESS));
    GR_MPOLY_NEG             = downcall("gr_mpoly_neg",
                                   FunctionDescriptor.of(JAVA_INT,
                                                         ADDRESS,
                                                         ADDRESS,
                                                         ADDRESS));
    GR_MPOLY_LENGTH          = downcall("gr_mpoly_length",
                                   FunctionDescriptor.of(JAVA_LONG,
                                                         ADDRESS,
                                                         ADDRESS));
    GR_MPOLY_MUL_SCALAR      = downcall("gr_mpoly_mul_scalar",
                                   FunctionDescriptor.of(JAVA_INT,
                                                         ADDRESS,
                                                         ADDRESS,
                                                         ADDRESS,
                                                         ADDRESS));
    GR_MPOLY_MUL_SI          = downcall("gr_mpoly_mul_si",
                                   FunctionDescriptor.of(JAVA_INT,
                                                         ADDRESS,
                                                         ADDRESS,
                                                         JAVA_LONG,
                                                         ADDRESS));
  }

  private GrMpolyNative()
  {
  }

  private static MethodHandle downcall(String symbol, FunctionDescriptor descriptor)
  {
    return LINKER.downcallHandle(LOOKUP.find(symbol)
                                       .orElseThrow(() -> new UnsatisfiedLinkError(symbol)),
                                 descriptor);
  }

  static void initRealBase(MemorySegment baseContext, int bits)
  {
    invokeVoid(GR_CTX_INIT_REAL_ARB,
               baseContext,
               (long) bits);
  }

  static void initComplexBase(MemorySegment baseContext, int bits)
  {
    invokeVoid(GR_CTX_INIT_COMPLEX_ACB,
               baseContext,
               (long) bits);
  }

  static void clearBaseContext(MemorySegment baseContext)
  {
    invokeVoid(GR_CTX_CLEAR,
               baseContext);
  }

  static void initPolynomialContext(MemorySegment polynomialContext,
                                    MemorySegment baseContext,
                                    int nvars,
                                    MultivariateOrder order)
  {
    invokeVoid(GR_MPOLY_CTX_INIT,
               polynomialContext,
               baseContext,
               (long) nvars,
               order.nativeValue);
  }

  static void clearPolynomialContext(MemorySegment polynomialContext)
  {
    invokeVoid(GR_MPOLY_CTX_CLEAR,
               polynomialContext);
  }

  static void setGeneratorNames(MemorySegment polynomialContext, String[] names)
  {
    try (Arena arena = Arena.ofConfined())
    {
      MemorySegment pointers = arena.allocate(ADDRESS,
                                             names.length);
      for (int i = 0; i < names.length; i++)
      {
        pointers.setAtIndex(ADDRESS,
                            i,
                            arena.allocateFrom(names[i]));
      }
      check((int) GR_MPOLY_CTX_SET_GEN_NAMES.invoke(polynomialContext,
                                                    pointers));
    }
    catch (Throwable throwable)
    {
      throw rethrow(throwable);
    }
  }

  static void initPolynomial(MemorySegment polynomial, MemorySegment polynomialContext)
  {
    invokeVoid(GR_MPOLY_INIT,
               polynomial,
               polynomialContext);
  }

  static void clearPolynomial(MemorySegment polynomial, MemorySegment polynomialContext)
  {
    invokeVoid(GR_MPOLY_CLEAR,
               polynomial,
               polynomialContext);
  }

  static void set(MemorySegment destination, MemorySegment source, MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_SET,
              destination,
              source,
              polynomialContext);
  }

  static void set(MemorySegment polynomial, long value, MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_SET_SI,
              polynomial,
              value,
              polynomialContext);
  }

  static void zero(MemorySegment polynomial, MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_ZERO,
              polynomial,
              polynomialContext);
  }

  static void one(MemorySegment polynomial, MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_ONE,
              polynomial,
              polynomialContext);
  }

  static void generator(MemorySegment polynomial, int variable, MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_GEN,
              polynomial,
              (long) variable,
              polynomialContext);
  }

  static boolean isZero(MemorySegment polynomial, MemorySegment polynomialContext)
  {
    return invokeTruth(GR_MPOLY_IS_ZERO,
                       polynomial,
                       polynomialContext);
  }

  static boolean isOne(MemorySegment polynomial, MemorySegment polynomialContext)
  {
    return invokeTruth(GR_MPOLY_IS_ONE,
                       polynomial,
                       polynomialContext);
  }

  static boolean isGenerator(MemorySegment polynomial, int variable, MemorySegment polynomialContext)
  {
    return invokeTruth(GR_MPOLY_IS_GEN,
                       polynomial,
                       (long) variable,
                       polynomialContext);
  }

  static boolean equal(MemorySegment left, MemorySegment right, MemorySegment polynomialContext)
  {
    return invokeTruth(GR_MPOLY_EQUAL,
                       left,
                       right,
                       polynomialContext);
  }

  static void add(MemorySegment result,
                  MemorySegment left,
                  MemorySegment right,
                  MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_ADD,
              result,
              left,
              right,
              polynomialContext);
  }

  static void sub(MemorySegment result,
                  MemorySegment left,
                  MemorySegment right,
                  MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_SUB,
              result,
              left,
              right,
              polynomialContext);
  }

  static void mul(MemorySegment result,
                  MemorySegment left,
                  MemorySegment right,
                  MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_MUL,
              result,
              left,
              right,
              polynomialContext);
  }

  static void setExpression(MemorySegment polynomial, String expression, MemorySegment polynomialContext)
  {
    try (Arena arena = Arena.ofConfined())
    {
      check((int) GR_SET_STR.invoke(polynomial,
                                    arena.allocateFrom(expression),
                                    polynomialContext));
    }
    catch (Throwable throwable)
    {
      throw rethrow(throwable);
    }
  }

  static String toString(MemorySegment polynomial, MemorySegment polynomialContext)
  {
    try (Arena arena = Arena.ofConfined())
    {
      MemorySegment out = arena.allocate(ADDRESS);
      check((int) GR_GET_STR.invoke(out,
                                    polynomial,
                                    polynomialContext));
      MemorySegment cString = out.get(ADDRESS,
                                      0);
      String        string  = cString.reinterpret(Long.MAX_VALUE)
                                     .getString(0);
      invokeVoid(FLINT_FREE,
                 cString);
      return string;
    }
    catch (Throwable throwable)
    {
      throw rethrow(throwable);
    }
  }

  static void setCoefficient(MemorySegment polynomial,
                             long[] exponents,
                             long coefficient,
                             MemorySegment polynomialContext)
  {
    try (Arena arena = Arena.ofConfined())
    {
      invokeInt(GR_MPOLY_SET_COEFF_SI_UI,
                polynomial,
                coefficient,
                arena.allocateFrom(JAVA_LONG,
                                   exponents),
                polynomialContext);
    }
  }

  static void setCoefficient(MemorySegment polynomial,
                             long[] exponents,
                             long coefficientPointer,
                             MemorySegment polynomialContext,
                             boolean scalar)
  {
    try (Arena arena = Arena.ofConfined())
    {
      invokeInt(GR_MPOLY_SET_COEFF_SCALAR_UI,
                polynomial,
                MemorySegment.ofAddress(coefficientPointer),
                arena.allocateFrom(JAVA_LONG,
                                   exponents),
                polynomialContext);
    }
  }

  static void getCoefficient(long resultPointer,
                             MemorySegment polynomial,
                             long[] exponents,
                             MemorySegment polynomialContext)
  {
    try (Arena arena = Arena.ofConfined())
    {
      invokeInt(GR_MPOLY_GET_COEFF_SCALAR_UI,
                MemorySegment.ofAddress(resultPointer),
                polynomial,
                arena.allocateFrom(JAVA_LONG,
                                   exponents),
                polynomialContext);
    }
  }

  static void neg(MemorySegment result,
                  MemorySegment source,
                  MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_NEG,
              result,
              source,
              polynomialContext);
  }

  static long length(MemorySegment polynomial,
                     MemorySegment polynomialContext)
  {
    try
    {
      return (long) GR_MPOLY_LENGTH.invoke(polynomial,
                                           polynomialContext);
    }
    catch (Throwable throwable)
    {
      throw rethrow(throwable);
    }
  }

  static void mulScalar(MemorySegment result,
                        MemorySegment polynomial,
                        MemorySegment scalar,
                        MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_MUL_SCALAR,
              result,
              polynomial,
              scalar,
              polynomialContext);
  }

  static void mulSi(MemorySegment result,
                    MemorySegment polynomial,
                    long scalar,
                    MemorySegment polynomialContext)
  {
    invokeInt(GR_MPOLY_MUL_SI,
              result,
              polynomial,
              scalar,
              polynomialContext);
  }

  private static void invokeVoid(MethodHandle handle, Object... arguments)
  {
    try
    {
      handle.invokeWithArguments(arguments);
    }
    catch (Throwable throwable)
    {
      throw rethrow(throwable);
    }
  }

  private static void invokeInt(MethodHandle handle, Object... arguments)
  {
    try
    {
      check((int) handle.invokeWithArguments(arguments));
    }
    catch (Throwable throwable)
    {
      throw rethrow(throwable);
    }
  }

  private static boolean invokeTruth(MethodHandle handle, Object... arguments)
  {
    try
    {
      return (int) handle.invokeWithArguments(arguments) == T_TRUE;
    }
    catch (Throwable throwable)
    {
      throw rethrow(throwable);
    }
  }

  private static void check(int status)
  {
    if (status != GR_SUCCESS)
    {
      throw new ArbException("FLINT gr_mpoly operation failed with status " + status);
    }
  }

  private static RuntimeException rethrow(Throwable throwable)
  {
    if (throwable instanceof RuntimeException runtimeException)
    {
      return runtimeException;
    }
    return new RuntimeException(throwable);
  }
}
