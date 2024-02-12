package arb.expressions.nodes.nary;

import org.objectweb.asm.tree.ClassNode;
import org.objectweb.asm.tree.MethodNode;
import org.objectweb.asm.tree.analysis.AnalyzerException;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.functions.real.NullaryFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class ProductTest extends
                         TestCase
{
  public static void testOneTimesTwoTimesThreeEqualsSix() throws AnalyzerException
  {
    Class<?>    superType   = null;
    Class<?>[]  interfaces  = null;
    byte[]      bytecode    = null;
    ClassNode   classNode   = new ClassNode();
    MethodNode  method      = new MethodNode();


    NullaryFunction<Real> prod = RealNullaryFunction.express("∏k{k=1…3}");
    assertEquals(6.0, prod.evaluate(null,128, new Real()));
  }
}
