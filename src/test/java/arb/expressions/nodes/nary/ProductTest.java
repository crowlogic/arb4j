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


    NullaryFunction<Real> prod = RealNullaryFunction.express("∏k{k=1..3}");
    assertEquals(6.0, prod.evaluate(128, new Real()));
  }
}
