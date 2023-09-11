package arb.functions.complex.numbertheoretic;

import arb.utensils.ShellFunctions;

public class ZStructurePlotter
{

  public static void main(String[] args)
  {

//    ShellFunctions.plot(primaryStage, 0, 125, func.asRealToComplexFunction().realPart());
    ZStructureFunction zvs = new ZStructureFunction();
    ShellFunctions.plot(0, 42, zvs);

  }
}
