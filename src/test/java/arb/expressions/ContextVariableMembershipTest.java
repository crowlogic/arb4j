package arb.expressions;

import arb.Integer;
import arb.Real;
import junit.framework.TestCase;

/**
 * Coverage for #1156: every variable registered in a {@link Context} maintains
 * the list of {@link Context}s it is a member of — it is recorded via
 * {@link arb.Named#registerContext(Context)} upon being added to a Context and
 * removes itself from every registered Context when its
 * {@link AutoCloseable#close()} method is called, so that closed variables
 * never remain registered in a Context.
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ContextVariableMembershipTest extends
                                           TestCase
{

  public void testRegistrationRecordsContextMembership()
  {
    try ( Context context = new Context())
    {
      Real x = new Real().setName("x");
      context.registerVariable(x);
      assertEquals(1, x.getRegisteredContexts().size());
      assertSame(context, x.getRegisteredContexts().get(0));
      assertSame(x, context.getVariable("x"));
    }
  }

  public void testCloseRemovesVariableFromContext()
  {
    try ( Context context = new Context())
    {
      Real x = new Real().setName("x");
      context.registerVariable(x);
      x.close();
      assertNull(context.getVariable("x"));
      assertTrue(x.getRegisteredContexts().isEmpty());
    }
  }

  public void testCloseRemovesVariableFromEveryRegisteredContext()
  {
    try ( Context first = new Context(); Context second = new Context())
    {
      Integer n = new Integer().setName("n");
      first.registerVariable(n);
      second.registerVariable(n);
      assertEquals(2, n.getRegisteredContexts().size());
      n.close();
      assertNull(first.getVariable("n"));
      assertNull(second.getVariable("n"));
      assertTrue(n.getRegisteredContexts().isEmpty());
    }
  }

  public void testContextCloseClearsMembershipsWithoutConcurrentModification()
  {
    Real    x       = new Real().setName("x");
    Integer n       = new Integer().setName("n");
    Context context = new Context();
    context.registerVariable(x);
    context.registerVariable(n);
    context.close();
    assertTrue(x.getRegisteredContexts().isEmpty());
    assertTrue(n.getRegisteredContexts().isEmpty());
  }

  public void testVariablesPassedToConstructorAreRegistered()
  {
    Real x = new Real().setName("x");
    try ( Context context = new Context(x))
    {
      assertEquals(1, x.getRegisteredContexts().size());
      assertSame(context, x.getRegisteredContexts().get(0));
    }
    assertTrue(x.getRegisteredContexts().isEmpty());
  }
}
