package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import org.objectweb.asm.*;

import arb.*;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
abstract class PolySeriesFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                     FunctionNode<D, C, F>
{
  protected int derivativeOrder = 0;

  protected PolySeriesFunctionNode(String name, Expression<D, C, F> expr)
  {
    super(name,
          expr.resolve(),
          expr.require(')'));
    this.derivativeOrder = 0;
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

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    final Class<?> scalarType = scalarType(resultType);
    final boolean  isComplex  = Complex.class.equals(scalarType);
    final Class<?> polyClass  = isComplex ? ComplexPolynomial.class : RealPolynomial.class;

    int            hSlot      = 5;
    int            outSlot    = 6;
    int            iSlot      = 7;

    // RealPolynomial h = new RealPolynomial(order + derivativeOrder)
    generateNewObjectInstruction(mv, polyClass);
    duplicateTopOfTheStack(mv);
    loadOrderParameter(mv);
    if (derivativeOrder > 0)
    {
      mv.visitLdcInsn(derivativeOrder);
      mv.visitInsn(Opcodes.IADD);
    }
    invokeConstructor(mv, polyClass, int.class);
    mv.visitVarInsn(Opcodes.ASTORE, hSlot);

    // RealPolynomial out = new RealPolynomial(order + derivativeOrder)
    generateNewObjectInstruction(mv, polyClass);
    duplicateTopOfTheStack(mv);
    loadOrderParameter(mv);
    if (derivativeOrder > 0)
    {
      mv.visitLdcInsn(derivativeOrder);
      mv.visitInsn(Opcodes.IADD);
    }
    invokeConstructor(mv, polyClass, int.class);
    mv.visitVarInsn(Opcodes.ASTORE, outSlot);

    // h.fitLength(order + derivativeOrder)
    mv.visitVarInsn(Opcodes.ALOAD, hSlot);
    loadOrderParameter(mv);
    if (derivativeOrder > 0)
    {
      mv.visitLdcInsn(derivativeOrder);
      mv.visitInsn(Opcodes.IADD);
    }
    invokeVirtualMethod(mv, polyClass, "fitLength", polyClass, int.class);
    pop(mv);

    // h.setLength(order + derivativeOrder)
    mv.visitVarInsn(Opcodes.ALOAD, hSlot);
    loadOrderParameter(mv);
    if (derivativeOrder > 0)
    {
      mv.visitLdcInsn(derivativeOrder);
      mv.visitInsn(Opcodes.IADD);
    }
    invokeVirtualMethod(mv, polyClass, "setLength", void.class, int.class);

    // h.get(0).set(t)
    mv.visitVarInsn(Opcodes.ALOAD, hSlot);
    mv.visitInsn(Opcodes.ICONST_0);
    invokeVirtualMethod(mv, polyClass, "get", scalarType, int.class);
    loadInputParameter(mv);
    cast(mv, scalarType);
    invokeVirtualMethod(mv, scalarType, "set", scalarType, scalarType);
    pop(mv);

    // h.get(1).one()
    mv.visitVarInsn(Opcodes.ALOAD, hSlot);
    mv.visitInsn(Opcodes.ICONST_1);
    invokeVirtualMethod(mv, polyClass, "get", scalarType, int.class);
    invokeVirtualMethod(mv, scalarType, "one", scalarType);
    pop(mv);

    // out.fitLength(order + derivativeOrder)
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    loadOrderParameter(mv);
    if (derivativeOrder > 0)
    {
      mv.visitLdcInsn(derivativeOrder);
      mv.visitInsn(Opcodes.IADD);
    }
    invokeVirtualMethod(mv, polyClass, "fitLength", polyClass, int.class);
    pop(mv);

    // out.setLength(order + derivativeOrder)
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    loadOrderParameter(mv);
    if (derivativeOrder > 0)
    {
      mv.visitLdcInsn(derivativeOrder);
      mv.visitInsn(Opcodes.IADD);
    }
    invokeVirtualMethod(mv, polyClass, "setLength", void.class, int.class);

    // arblib.arb_poly_riemann_siegel_theta_series(out, h, order + derivativeOrder,
    // bits)
    invokeSeriesEvaluationFunction(mv, scalarType, isComplex, hSlot, outSlot, polyClass);

    // Copy coefficients from out[derivativeOrder..derivativeOrder+order-1] to
    // result[0..order-1]
    // for (int i = 0; i < order; i++) result[i].set(out.get(derivativeOrder + i))

    Label loopStart = new Label();
    Label loopEnd   = new Label();

    // int i = 0
    mv.visitInsn(Opcodes.ICONST_0);
    mv.visitVarInsn(Opcodes.ISTORE, iSlot);

    // loop condition: i < order
    mv.visitLabel(loopStart);
    mv.visitVarInsn(Opcodes.ILOAD, iSlot);
    loadOrderParameter(mv);
    mv.visitJumpInsn(Opcodes.IF_ICMPGE, loopEnd);

    // result[i].set(out.get(derivativeOrder + i))
    loadResultParameter(mv);
    cast(mv, scalarType);
    mv.visitVarInsn(Opcodes.ILOAD, iSlot);
    invokeVirtualMethod(mv, scalarType, "get", scalarType, int.class);

    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    mv.visitLdcInsn(derivativeOrder);
    mv.visitVarInsn(Opcodes.ILOAD, iSlot);
    mv.visitInsn(Opcodes.IADD);
    invokeVirtualMethod(mv, polyClass, "get", scalarType, int.class);

    invokeVirtualMethod(mv, scalarType, "set", scalarType, scalarType);
    pop(mv);

    // i++
    mv.visitIincInsn(iSlot, 1);
    mv.visitJumpInsn(Opcodes.GOTO, loopStart);

    mv.visitLabel(loopEnd);

    // h.close()
    mv.visitVarInsn(Opcodes.ALOAD, hSlot);
    invokeVirtualMethod(mv, polyClass, "close", void.class);

    // out.close()
    mv.visitVarInsn(Opcodes.ALOAD, outSlot);
    invokeVirtualMethod(mv, polyClass, "close", void.class);

    // return result
    loadResultParameter(mv);
    cast(mv, scalarType);
    generatedType = scalarType;

    return mv;
  }

  protected abstract void invokeSeriesEvaluationFunction(MethodVisitor mv,
                                                         Class<?> scalarType,
                                                         boolean isComplex,
                                                         int hSlot,
                                                         int outSlot,
                                                         Class<?> polyClass);
}
