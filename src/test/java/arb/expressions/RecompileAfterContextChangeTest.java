package arb.expressions;

import arb.Complex;
import arb.Integer;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

/**
 * Regression test for the {@code IllegalArgumentException "Can not set X field
 * ... to X"} thrown from {@link Context#injectFunctionReferences} after a
 * context variable is mutated and the containing expression is recompiled with
 * a fresh {@link ExpressionClassLoader}.
 * <p>
 * Scenario: the user types an expression whose body contains a sub-expression
 * that the parser promotes to its own generated operand class (for instance a
 * {@code pFq} argument sub-expression). On first compile,
 * {@link Expression#registerSubexpression} calls
 * {@link Context#registerFunctionMapping} with {@code replace=true}, creating
 * a {@link FunctionMapping} whose {@code instance} is the freshly-instantiated
 * arg-function. The user then changes a context variable (e.g. an
 * {@link Integer}) and clicks Evaluate again, which in the Expressor UI
 * calls {@code Function.parseAndCompile(..., context.resetClassLoader())}.
 * A new classloader defines a new arg-function class. Before the fix,
 * {@code registerFunctionMapping} on the already-registered name silently
 * kept the old mapping (and with it the old {@code instance} typed under the
 * discarded loader), so {@code injectFunctionReferences} later tried to
 * {@link java.lang.reflect.Field#set} a field of the new class to an instance
 * of the old class with the same FQN — two distinct {@link Class} objects from
 * different classloaders — and the JVM threw
 * {@code IllegalArgumentException}. After the fix, {@code replace=true}
 * actually overwrites the mapping's instance/expression/functionClass so the
 * second injection matches the regenerated field type.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class RecompileAfterContextChangeTest extends
                                              TestCase
{
  public void testInjectReferencesAfterResetClassLoaderAndRecompile()
  {
    Context context = new Context(Integer.named("m").set(3));

    String  body    =
                 "y➔-I*(pFq([1,m,-m],[1/2],-((1/2)*I)/y)*exp(I*(π*m+y))-pFq([1,m,-m],[1/2],((1/2)*I)/y)*exp(I*(2*π*m-y)))*(4*m^2-1)*(-1)^(-m)/((4*m^2-2)*y*π)";

    Expression<Complex, Complex, ComplexFunction> expr =
                                                       Function.parseAndCompile(Complex.class,
                                                                                Complex.class,
                                                                                ComplexFunction.class,
                                                                                body,
                                                                                context);

    ComplexFunction                               f1   = expr.instantiate();
    context.injectReferences(f1);
    assertNotNull(f1.toString());

    Integer                                       m    = context.getVariable("m");
    m.set(4);

    // Simulate what ExpressionTreeView.compileExpression does when the
    // text-box string differs from the normalized expr.getExpression(): it
    // recompiles the outer expression in a fresh ExpressionClassLoader while
    // reusing the same Context (which still holds the stale subexpression
    // FunctionMapping entries).
    Expression<Complex, Complex, ComplexFunction> expr2 =
                                                        Function.parseAndCompile(Complex.class,
                                                                                 Complex.class,
                                                                                 ComplexFunction.class,
                                                                                 body,
                                                                                 context.resetClassLoader());

    // Before the fix this call threw
    //   java.lang.IllegalArgumentException: Can not set <subclass> field
    //   <outerclass>.<subfield> to <subclass>
    // because the outer field's declared type was loaded by the NEW
    // ExpressionClassLoader while the sub-mapping's cached instance was
    // still typed by the OLD loader.
    ComplexFunction f2 = expr2.instantiate();
    context.injectReferences(f2);
    assertNotNull(f2.toString());
  }
}
