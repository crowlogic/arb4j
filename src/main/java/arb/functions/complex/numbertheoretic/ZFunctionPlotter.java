package arb.functions.complex.numbertheoretic;

import arb.utensils.ShellFunctions;

public class ZFunctionPlotter
{

  public static void main(String[] args)
  {

//    ShellFunctions.plot(primaryStage, 0, 125, func.asRealToComplexFunction().realPart());
    ZVarianceStructure zvs = new ZVarianceStructure();
    ShellFunctions.plot(0, 42, zvs);

  }
}
