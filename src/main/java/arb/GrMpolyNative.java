package arb;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.LongBuffer;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;

/**
 * Pure-Java bridge to FLINT's generic multivariate polynomial ring
 * (<code>gr_mpoly</code>) via the SWIG/JNI symbols exported by
 * {@code libarblib.so} (see {@code native/GrMpoly.i}). No
 * {@code java.lang.foreign} (foreign function interface) is used: every
 * operation is an ordinary {@link arblib} JNI downcall.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
final class GrMpolyNative
{
  static final int GR_SUCCESS = 0;
  static final int T_TRUE     = 0;

  static
  {
    NativeLibraryLoader.load("arblib");
  }

  private GrMpolyNative()
  {
  }

  static GenericRing newContext()
  {
    return arblib.arb4j_ctx_alloc();
  }

  static void freeContext(GenericRing context)
  {
    arblib.arb4j_ctx_free(context);
  }

  static void initRealBase(GenericRing baseContext, int bits)
  {
    arblib.arb4j_ctx_init_real(baseContext, bits);
  }

  static void initComplexBase(GenericRing baseContext, int bits)
  {
    arblib.arb4j_ctx_init_complex(baseContext, bits);
  }

  static void clearBaseContext(GenericRing baseContext)
  {
    arblib.arb4j_ctx_clear(baseContext);
  }

  static void initPolynomialContext(GenericRing polynomialContext,
                                    GenericRing baseContext,
                                    int nvars,
                                    MultivariateOrder order)
  {
    arblib.arb4j_mpoly_ctx_init(polynomialContext, baseContext, nvars, order.nativeValue);
  }

  static void clearPolynomialContext(GenericRing polynomialContext)
  {
    arblib.arb4j_mpoly_ctx_clear(polynomialContext);
  }

  static void setGeneratorNames(GenericRing polynomialContext, String[] names)
  {
    check(arblib.arb4j_mpoly_ctx_set_gen_names(polynomialContext, names));
  }

  static GenericMultivariatePolynomial newPolynomial()
  {
    return arblib.arb4j_mpoly_alloc();
  }

  static void freePolynomial(GenericMultivariatePolynomial polynomial)
  {
    arblib.arb4j_mpoly_free(polynomial);
  }

  static void initPolynomial(GenericMultivariatePolynomial polynomial, GenericRing polynomialContext)
  {
    arblib.arb4j_mpoly_init(polynomial, polynomialContext);
  }

  static void clearPolynomial(GenericMultivariatePolynomial polynomial, GenericRing polynomialContext)
  {
    arblib.arb4j_mpoly_clear(polynomial, polynomialContext);
  }

  static void set(GenericMultivariatePolynomial destination,
                  GenericMultivariatePolynomial source,
                  GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_set(destination, source, polynomialContext));
  }

  static void set(GenericMultivariatePolynomial polynomial, long value, GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_set_si(polynomial, value, polynomialContext));
  }

  static void zero(GenericMultivariatePolynomial polynomial, GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_zero(polynomial, polynomialContext));
  }

  static void one(GenericMultivariatePolynomial polynomial, GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_one(polynomial, polynomialContext));
  }

  static void generator(GenericMultivariatePolynomial polynomial, int variable, GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_gen(polynomial, variable, polynomialContext));
  }

  static boolean isZero(GenericMultivariatePolynomial polynomial, GenericRing polynomialContext)
  {
    return arblib.arb4j_mpoly_is_zero(polynomial, polynomialContext) == T_TRUE;
  }

  static boolean isOne(GenericMultivariatePolynomial polynomial, GenericRing polynomialContext)
  {
    return arblib.arb4j_mpoly_is_one(polynomial, polynomialContext) == T_TRUE;
  }

  static boolean isGenerator(GenericMultivariatePolynomial polynomial, int variable, GenericRing polynomialContext)
  {
    return arblib.arb4j_mpoly_is_gen(polynomial, variable, polynomialContext) == T_TRUE;
  }

  static boolean equal(GenericMultivariatePolynomial left,
                       GenericMultivariatePolynomial right,
                       GenericRing polynomialContext)
  {
    return arblib.arb4j_mpoly_equal(left, right, polynomialContext) == T_TRUE;
  }

  static void add(GenericMultivariatePolynomial result,
                  GenericMultivariatePolynomial left,
                  GenericMultivariatePolynomial right,
                  GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_add(result, left, right, polynomialContext));
  }

  static void sub(GenericMultivariatePolynomial result,
                  GenericMultivariatePolynomial left,
                  GenericMultivariatePolynomial right,
                  GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_sub(result, left, right, polynomialContext));
  }

  static void mul(GenericMultivariatePolynomial result,
                  GenericMultivariatePolynomial left,
                  GenericMultivariatePolynomial right,
                  GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_mul(result, left, right, polynomialContext));
  }

  static void setExpression(GenericMultivariatePolynomial polynomial,
                            String expression,
                            GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_set_str(polynomial, expression, polynomialContext));
  }

  static String toString(GenericMultivariatePolynomial polynomial, GenericRing polynomialContext)
  {
    String string = arblib.arb4j_mpoly_get_str(polynomial, polynomialContext);
    if (string == null)
    {
      throw new ArbException("FLINT gr_mpoly gr_get_str failed");
    }
    return string;
  }

  static void setCoefficient(GenericMultivariatePolynomial polynomial,
                             long[] exponents,
                             long coefficient,
                             GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_set_coeff_si(polynomial, coefficient, buffer(exponents), polynomialContext));
  }

  static void setCoefficient(GenericMultivariatePolynomial polynomial,
                             long[] exponents,
                             Real coefficient,
                             GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_set_coeff_real(polynomial, coefficient, buffer(exponents), polynomialContext));
  }

  static void setCoefficient(GenericMultivariatePolynomial polynomial,
                             long[] exponents,
                             Complex coefficient,
                             GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_set_coeff_complex(polynomial, coefficient, buffer(exponents), polynomialContext));
  }

  static void getCoefficient(Real coefficient,
                             GenericMultivariatePolynomial polynomial,
                             long[] exponents,
                             GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_get_coeff_real(coefficient, polynomial, buffer(exponents), polynomialContext));
  }

  static void getCoefficient(Complex coefficient,
                             GenericMultivariatePolynomial polynomial,
                             long[] exponents,
                             GenericRing polynomialContext)
  {
    check(arblib.arb4j_mpoly_get_coeff_complex(coefficient, polynomial, buffer(exponents), polynomialContext));
  }

  private static LongBuffer buffer(long[] exponents)
  {
    LongBuffer directBuffer = ByteBuffer.allocateDirect(exponents.length * Long.BYTES)
                                        .order(ByteOrder.nativeOrder())
                                        .asLongBuffer();
    directBuffer.put(exponents);
    return directBuffer;
  }

  private static void check(int status)
  {
    if (status != GR_SUCCESS)
    {
      throw new ArbException("FLINT gr_mpoly operation failed with status " + status);
    }
  }
}
