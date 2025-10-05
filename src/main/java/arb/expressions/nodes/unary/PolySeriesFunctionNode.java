package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.scalarType;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.RealPolynomial;
import arb.arblib;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * 
 * TODO: modify this to use intermediate variables that will be part of the
 * object rather than local variables
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
abstract class PolySeriesFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                     FunctionNode<D, C, F>
{
  private static final String ACB_ONE                = "acb_one";
  private static final String ACB_POLY_CLEAR         = "acb_poly_clear";
  private static final String ACB_POLY_FIT_LENGTH    = "acb_poly_fit_length";
  private static final String ACB_POLY_GET_COEFF_ACB = "acb_poly_get_coeff_acb";
  private static final String ACB_POLY_INIT          = "acb_poly_init";
  private static final String ACB_POLY_SET_COEFF_ACB = "acb_poly_set_coeff_acb";
  private static final String ARB_COMPLEX            = Type.getInternalName(Complex.class);
  private static final String ARB_COMPLEX_POLYNOMIAL =
                                                     Type.getInternalName(ComplexPolynomial.class);
  private static final String ARB_ONE                = "arb_one";
  private static final String ARB_POLY_CLEAR         = "arb_poly_clear";
  private static final String ARB_POLY_FIT_LENGTH    = "arb_poly_fit_length";
  private static final String ARB_POLY_GET_COEFF_ARB = "arb_poly_get_coeff_arb";
  private static final String ARB_POLY_INIT          = "arb_poly_init";
  private static final String ARB_POLY_SET_COEFF_ARB = "arb_poly_set_coeff_arb";
  private static final String ARB_REAL               = Type.getInternalName(Real.class);
  private static final String ARB_REAL_POLYNOMIAL    = Type.getInternalName(RealPolynomial.class);
  private static final String ARG_POLY               = "arg";
  private static final String INIT                   = "<init>";
  private static int          nextLocal              = 20;
  private static final String RESULT_POLY            = "resultPoly";
  private static final String VOID_NOARG_SIGNATURE   = "()V";

  private static void newPoly(MethodVisitor mv, boolean cx)
  {
    String cls = cx ? ARB_COMPLEX_POLYNOMIAL : ARB_REAL_POLYNOMIAL;
    Compiler.constructNewObject(mv, cls);
    Compiler.duplicateTopOfTheStack(mv);
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, cls, INIT, VOID_NOARG_SIGNATURE, false);
  }

  protected static void pushInt(MethodVisitor mv, int v)
  {
    mv.visitLdcInsn(v);
  }

  protected int derivativeOrder = 0;

  protected PolySeriesFunctionNode(String name, Expression<D, C, F> expr)
  {
    super(name,
          expr.resolve(),
          expr.require(')'));
  }

  protected PolySeriesFunctionNode(String name,
                                   Expression<D, C, F> expr,
                                   Node<D, C, F> arg,
                                   int order)
  {
    super(name,
          arg,
          expr);
    this.derivativeOrder = Math.max(0, order);
  }

  protected void assignArgumentToElementOfPolynomial(MethodVisitor mv,
                                                     final Class<?> S,
                                                     final boolean isComplex,
                                                     Class<?> polynomialClass,
                                                     int argSlot)
  {
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, 0);
    arg.generate(mv, S);
    invokePolySetCoeffMethod(mv, S, isComplex, polynomialClass);
  }

  protected int assignOneToElementOfPolynomial(MethodVisitor mv,
                                               final Class<?> S,
                                               final boolean isComplex,
                                               Class<?> polynomialClass,
                                               int argSlot)
  {
    int oneSlot = putOneInSlot(mv, isComplex);
    assignOneToElementOfPolynomial(mv, S, isComplex, polynomialClass, argSlot, oneSlot);
    return oneSlot;
  }

  protected void assignOneToElementOfPolynomial(MethodVisitor mv,
                                                final Class<?> S,
                                                final boolean isComplex,
                                                Class<?> polynomialClass,
                                                int argSlot,
                                                int oneSlot)
  {
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, 1);
    mv.visitVarInsn(Opcodes.ALOAD, oneSlot);
    invokePolySetCoeffMethod(mv, S, isComplex, polynomialClass);
  }

  public void call(MethodVisitor mv,
                   boolean isComplex,
                   int n,
                   String realFunctionName,
                   String complexFunctionName)
  {
    Class<?> polyClass = isComplex ? ComplexPolynomial.class : RealPolynomial.class;
    pushInt(mv, n);
    loadBitsParameterOntoStack(mv);

    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? complexFunctionName : realFunctionName,
                       Void.class,
                       polyClass, // res
                       polyClass, // arg
                       int.class,
                       int.class);
  }

  public void call(MethodVisitor mv,
                   Class<?> S,
                   boolean complex,
                   int n,
                   int oneSlot,
                   String complexFunctionName,
                   String realFunctionName)
  {
    Class<?> polyClass = complex ? ComplexPolynomial.class : RealPolynomial.class;
    mv.visitVarInsn(Opcodes.ALOAD, oneSlot);
    pushInt(mv, 0);
    pushInt(mv, n);
    loadBitsParameterOntoStack(mv);
    invokeStaticMethod(mv,
                       arblib.class,
                       complex ? complexFunctionName : realFunctionName,
                       Void.class,
                       polyClass, // res
                       polyClass, // arg
                       S,
                       int.class,
                       int.class,
                       int.class);
  }

  protected void clearPolynomials(MethodVisitor mv,
                                  final boolean isComplex,
                                  Class<?> polynomialClass,
                                  int resSlot,
                                  int argSlot)
  {
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    invokeClearPolyMethod(mv, isComplex, polynomialClass);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    invokeClearPolyMethod(mv, isComplex, polynomialClass);
  }

  protected int createAndIninitializePolynomial(MethodVisitor mv,
                                                final boolean isComplex,
                                                Class<?> polynomialClass)
  {
    newPoly(mv, isComplex);
    int argSlot = nextLocal++;
    mv.visitVarInsn(Opcodes.ASTORE, argSlot);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_INIT : ARB_POLY_INIT,
                       Void.class,
                       polynomialClass);
    return argSlot;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    final Class<?> S               = scalarType(resultType);
    final boolean  isComplex       = Complex.class.equals(S);
    final int      n               = Math.max(1, derivativeOrder + 1);
    final int      order           = derivativeOrder;

    int            outSlot         = loadOutputVariableOntoElementOfOutputPolynomial(mv, S);

    Class<?>       polynomialClass =
                                   registerIntermediatePolynomialVariablesIfNotAlreadyRegistered(isComplex);

    int            resSlot         =
                           createAndIninitializePolynomial(mv, isComplex, polynomialClass);

    int            argSlot         =
                           createAndIninitializePolynomial(mv, isComplex, polynomialClass);

    setPolynomialLength(mv, isComplex, n, polynomialClass, argSlot);

    assignArgumentToElementOfPolynomial(mv, S, isComplex, polynomialClass, argSlot);

    int oneSlot = assignOneToElementOfPolynomial(mv, S, isComplex, polynomialClass, argSlot);

    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushSeriesCallParamsAndInvoke(mv, S, isComplex, n, oneSlot);

    getScalarResult(mv, S, isComplex, order, outSlot, polynomialClass, resSlot);

    clearPolynomials(mv, isComplex, polynomialClass, resSlot, argSlot);

    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    generatedType = S;

    return mv;
  }

  protected void getScalarResult(MethodVisitor mv,
                                 final Class<?> S,
                                 final boolean isComplex,
                                 final int order,
                                 int outSlot,
                                 Class<?> polynomialClass,
                                 int resSlot)
  {
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    mv.visitVarInsn(Opcodes.ALOAD, resSlot);
    pushInt(mv, order);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_GET_COEFF_ACB : ARB_POLY_GET_COEFF_ARB,
                       Void.class,
                       S,
                       polynomialClass,
                       int.class);
  }

  protected void invokeClearPolyMethod(MethodVisitor mv,
                                       final boolean isComplex,
                                       Class<?> polynomialClass)
  {
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_CLEAR : ARB_POLY_CLEAR,
                       Void.class,
                       polynomialClass);
  }

  protected void invokePolySetCoeffMethod(MethodVisitor mv,
                                          final Class<?> S,
                                          final boolean isComplex,
                                          Class<?> polynomialClass)
  {
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_SET_COEFF_ACB : ARB_POLY_SET_COEFF_ARB,
                       Void.class,
                       polynomialClass,
                       int.class,
                       S);
  }

  /**
   * Local: outScalar, resPoly, argPoly, oneScalar
   * 
   * @param mv
   * @param S
   * @return
   */
  protected int loadOutputVariableOntoElementOfOutputPolynomial(MethodVisitor mv, final Class<?> S)
  {
    loadOutputVariableOntoStack(mv, S);
    int outSlot = nextLocal++;
    mv.visitVarInsn(Opcodes.ASTORE, outSlot);
    return outSlot;
  }

  protected abstract PolySeriesFunctionNode<D, C, F> makeWithOrder(int order);

  protected abstract void pushSeriesCallParamsAndInvoke(MethodVisitor mv,
                                                        Class<?> S,
                                                        boolean cx,
                                                        int n,
                                                        int oneSlot);

  protected int putOneInSlot(MethodVisitor mv, final boolean isComplex)
  {
    // Allocate + prepare a temp variable for 1
    int    oneSlot = nextLocal++;
    String type    = isComplex ? ARB_COMPLEX : ARB_REAL;
    Compiler.constructNewObject(mv, type);
    Compiler.duplicateTopOfTheStack(mv);
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, type, INIT, VOID_NOARG_SIGNATURE, false);
    Compiler.duplicateTopOfTheStack(mv);
    mv.visitVarInsn(Opcodes.ASTORE, oneSlot);
    invokeOneMethod(mv, isComplex);
    return oneSlot;
  }

  protected void invokeOneMethod(MethodVisitor mv, final boolean isComplex)
  {
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_ONE : ARB_ONE,
                       Void.class,
                       isComplex ? Complex.class : Real.class);
  }

  public Class<?>
         registerIntermediatePolynomialVariablesIfNotAlreadyRegistered(final boolean isComplex)
  {
    Class<?> polynomialClass = isComplex ? ComplexPolynomial.class : RealPolynomial.class;

    if (!expression.hasIntermediateVariable(RESULT_POLY))
    {
      expression.registerIntermediateVariable(RESULT_POLY, polynomialClass, true);
    }
    if (!expression.hasIntermediateVariable(ARG_POLY))
    {
      expression.registerIntermediateVariable(ARG_POLY, polynomialClass, true);
    }
    return polynomialClass;
  }

  protected void setPolynomialLength(MethodVisitor mv,
                                     final boolean isComplex,
                                     final int n,
                                     Class<?> polynomialClass,
                                     int argSlot)
  {
    mv.visitVarInsn(Opcodes.ALOAD, argSlot);
    pushInt(mv, n);
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? ACB_POLY_FIT_LENGTH : ARB_POLY_FIT_LENGTH,
                       Void.class,
                       polynomialClass,
                       int.class);
  }
}
