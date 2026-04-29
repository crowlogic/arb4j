package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies that a single {@link Context} can simultaneously bind the same
 * identifier on its variables and functions sides without collision.
 *
 * <p>
 * Concretely: a {@link Real} named {@code r} can live in
 * {@link Context#variables} while a {@link RealFunction} also named {@code r}
 * lives in {@link Context#functions}. Each expression body references one or
 * the other; the compiler emits a single public field named {@code r} typed
 * for whichever side was referenced. The reflective injectors must check the
 * field's declared type before assigning, so that the wrong-side injector
 * silently skips instead of throwing {@link IllegalArgumentException}.
 *
 * @see Context#injectVariableReferences
 * @see Context#injectFunctionReferences
 */
public class ContextNamespaceCoexistenceTest extends
                                             TestCase
{
  /**
   * One Context, two bindings of {@code r}: a Real value and a RealFunction.
   * Compile two expressions referencing each side and verify both evaluate.
   */
  public void testSameNameCoexistsAcrossVariablesAndFunctions()
  {
    try ( Context context = new Context(Real.named("r").set("0.5", 128)))
    {
      // A function ALSO named r — different namespace.
      RealFunction.express("r:x➔x+1", context);

      // Expression that references r as a Real (the variables-side binding).
      var asValue = RealFunction.express("v:x➔x*r", context);

      // Expression that references r as a function (the functions-side binding).
      var asFunc  = RealFunction.express("f:x➔r(x)", context);

      assertEquals("v with r=0.5: v(4) = 4 * 0.5 = 2.0", 2.0, asValue.eval(4.0), 1e-15);
      assertEquals("f with r:x➔x+1: f(4) = 4 + 1 = 5.0", 5.0, asFunc.eval(4.0), 1e-15);
    }
  }

  /**
   * After compiling expressions that bind both r-as-Real and r-as-Function,
   * mutating the Real and re-evaluating must reflect the new value — proving
   * the variables-side injection took effect and was not shadowed by the
   * functions-side r.
   */
  public void testVariableSideRespondsToMutationDespiteFunctionSideName()
  {
    Real r = Real.named("r").set("0.5", 128);
    try ( Context context = new Context(r))
    {
      RealFunction.express("r:x➔x+1", context);
      var v = RealFunction.express("v:x➔x*r", context);

      assertEquals(2.0, v.eval(4.0), 1e-15);
      r.set("0.25", 128);
      assertEquals("after r←0.25: v(4) = 4*0.25 = 1.0", 1.0, v.eval(4.0), 1e-15);
    }
  }

  /**
   * Order independence: registering the function-side r BEFORE compiling the
   * variable-side reference must work, and vice versa.
   */
  public void testRegistrationOrderIndependent()
  {
    // Function first.
    try ( Context context = new Context(Real.named("r").set("0.5", 128)))
    {
      RealFunction.express("r:x➔x+1", context);
      var v = RealFunction.express("v:x➔x*r", context);
      assertEquals(2.0, v.eval(4.0), 1e-15);
    }

    // Variable expression first, function second, then re-evaluate.
    try ( Context context = new Context(Real.named("r").set("0.5", 128)))
    {
      var v = RealFunction.express("v:x➔x*r", context);
      RealFunction.express("r:x➔x+1", context);
      var f = RealFunction.express("f:x➔r(x)", context);
      assertEquals(2.0, v.eval(4.0), 1e-15);
      assertEquals(5.0, f.eval(4.0), 1e-15);
    }
  }
}
