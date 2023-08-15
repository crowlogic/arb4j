package arb.functions.complex.numbertheoretic;

import arb.utensils.ShellCommands;
import javafx.application.Application;
import javafx.stage.Stage;

public class ZFunctionPlotter extends
                              Application
{

  public static void main(String[] args)
  {
    launch(args);
  }

  @Override
  public void start(Stage stage)
  {
//    ZFunction          func   = new ZFunction();
//    FloatInterval      domain = new FloatInterval(0,
//                                                  1000);
//    try ( EmpiricalVarianceStructure γ = new EmpiricalVarianceStructure(func.asRealToRealFunction(),
//                                                                        domain,
//                                                                        Float.valueOf("0.001", 128)))
//    {
//      plot(stage, domain.left().doubleValue(), domain.right().doubleValue());
//    }
//    ;

//    ShellCommands.plot(primaryStage, 0, 125, func.asRealToComplexFunction().realPart());
    ZVarianceStructure zvs    = new ZVarianceStructure();
    ShellCommands.plot(stage, 0, 42, zvs);

  }
}
