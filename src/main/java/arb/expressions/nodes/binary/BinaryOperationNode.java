package arb.expressions.nodes.binary;

import static arb.utensils.Utensils.indent;

import java.io.File;
import java.util.*;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.functions.Function;

/**
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 * @author Stephen Crowley ©2024-2025
 */
@SuppressWarnings("unchecked")
public abstract class BinaryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                         Node<D, R, F>
{
  public boolean isConstant()
  {
    return (left == null || left.isConstant()) && (right == null || right.isConstant());
  }
}