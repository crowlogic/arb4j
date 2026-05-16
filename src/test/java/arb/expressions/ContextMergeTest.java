package arb.expressions;

import arb.Real;
import arb.exceptions.CompilerException;
import arb.expressions.Context.ConflictPolicy;
import junit.framework.TestCase;

/**
 * Coverage for {@link Context#mergeFrom(Context, ConflictPolicy)} per the
 * acceptance criteria in #1024.
 *
 * <ul>
 * <li>identical bindings coalesce silently</li>
 * <li>{@link ConflictPolicy#PREFER_THIS} keeps the existing instance; under
 *     {@link ConflictPolicy#PREFER_OTHER} adopts the incoming one</li>
 * <li>clashes under {@link ConflictPolicy#ERROR} throw
 *     {@link CompilerException}</li>
 * <li>{@link ConflictPolicy#RENAME_INCOMING} is intentionally not yet implemented
 *     and surfaces {@link UnsupportedOperationException} pointing at the #1024
 *     follow-up. The follow-up must rename through the AST, never by string
 *     manipulation of expression source.</li>
 * <li>variable-namespace and function-namespace clashes are both handled per
 *     policy</li>
 * <li>null Context is a no-op</li>
 * </ul>
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ContextMergeTest extends
                              TestCase
{

  public void testNullArgumentIsNoOp()
  {
    Context thisCtx = new Context();
    Real    p       = new Real();
    p.setName("p");
    thisCtx.registerVariable(p);

    thisCtx.mergeFrom(null, ConflictPolicy.ERROR);
    assertSame("existing variable untouched", p, thisCtx.getVariable("p"));
  }

  public void testImportNewVariable()
  {
    Context thisCtx  = new Context();
    Context otherCtx = new Context();
    Real    p        = new Real();
    p.setName("p");
    otherCtx.registerVariable(p);

    thisCtx.mergeFrom(otherCtx, ConflictPolicy.ERROR);
    assertSame("p now bound in this", p, thisCtx.getVariable("p"));
  }

  public void testCoalesceIdenticalVariable()
  {
    Real p = new Real();
    p.setName("p");
    Context thisCtx  = new Context();
    Context otherCtx = new Context();
    thisCtx.registerVariable(p);
    otherCtx.registerVariable(p);

    thisCtx.mergeFrom(otherCtx, ConflictPolicy.ERROR);
    assertSame("p still the same instance", p, thisCtx.getVariable("p"));
  }

  public void testVariableClashErrorThrows()
  {
    Real pThis = new Real();
    pThis.setName("p");
    Real pOther = new Real();
    pOther.setName("p");
    Context thisCtx  = new Context();
    Context otherCtx = new Context();
    thisCtx.registerVariable(pThis);
    otherCtx.registerVariable(pOther);

    try
    {
      thisCtx.mergeFrom(otherCtx, ConflictPolicy.ERROR);
      fail("expected CompilerException on variable clash under ERROR policy");
    }
    catch (CompilerException expected)
    {
      assertTrue("message names the conflicting variable", expected.getMessage().contains("'p'"));
    }
    assertSame("this still holds its own p", pThis, thisCtx.getVariable("p"));
  }

  public void testVariableClashPreferThisKeepsExisting()
  {
    Real pThis = new Real();
    pThis.setName("p");
    Real pOther = new Real();
    pOther.setName("p");
    Context thisCtx  = new Context();
    Context otherCtx = new Context();
    thisCtx.registerVariable(pThis);
    otherCtx.registerVariable(pOther);

    thisCtx.mergeFrom(otherCtx, ConflictPolicy.PREFER_THIS);
    assertSame("this kept its own p", pThis, thisCtx.getVariable("p"));
  }

  public void testVariableClashPreferOtherOverwrites()
  {
    Real pThis = new Real();
    pThis.setName("p");
    Real pOther = new Real();
    pOther.setName("p");
    Context thisCtx  = new Context();
    Context otherCtx = new Context();
    thisCtx.registerVariable(pThis);
    otherCtx.registerVariable(pOther);

    thisCtx.mergeFrom(otherCtx, ConflictPolicy.PREFER_OTHER);
    assertSame("this adopted the incoming p", pOther, thisCtx.getVariable("p"));
  }

  public void testVariableClashRenameIncomingUnsupported()
  {
    Real pThis = new Real();
    pThis.setName("p");
    Real pOther = new Real();
    pOther.setName("p");
    Context thisCtx  = new Context();
    Context otherCtx = new Context();
    thisCtx.registerVariable(pThis);
    otherCtx.registerVariable(pOther);

    try
    {
      thisCtx.mergeFrom(otherCtx, ConflictPolicy.RENAME_INCOMING);
      fail("expected UnsupportedOperationException for RENAME_INCOMING follow-up");
    }
    catch (UnsupportedOperationException expected)
    {
      assertTrue("message references #1024", expected.getMessage().contains("#1024"));
    }
  }

  public void testFunctionClashErrorThrows()
  {
    Context thisCtx  = new Context();
    Context otherCtx = new Context();
    thisCtx.declare("f", java.lang.Object.class, arb.Real.class, arb.functions.real.RealFunction.class);
    otherCtx.declare("f", java.lang.Object.class, arb.Real.class, arb.functions.real.RealFunction.class);

    try
    {
      thisCtx.mergeFrom(otherCtx, ConflictPolicy.ERROR);
      fail("expected CompilerException on function clash under ERROR policy");
    }
    catch (CompilerException expected)
    {
      assertTrue("message names the conflicting function", expected.getMessage().contains("'f'"));
    }
  }

  public void testLegacySingleArgDelegatesToError()
  {
    Real pThis = new Real();
    pThis.setName("p");
    Real pOther = new Real();
    pOther.setName("p");
    Context thisCtx  = new Context();
    Context otherCtx = new Context();
    thisCtx.registerVariable(pThis);
    otherCtx.registerVariable(pOther);

    try
    {
      thisCtx.mergeFrom(otherCtx);
      fail("expected CompilerException — legacy mergeFrom is ERROR semantics");
    }
    catch (CompilerException expected)
    {
      // ok
    }
  }
}
