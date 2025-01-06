package arb.expressions;

import java.util.Map;

import jdk.jshell.spi.ExecutionControl;
import jdk.jshell.spi.ExecutionControlProvider;
import jdk.jshell.spi.ExecutionEnv;

public class ExpressionExecutionControlProvider implements
                                                ExecutionControlProvider
{

  @Override
  public String name()
  {
    return "arb-expression";
  }

  @Override
  public ExecutionControl generate(ExecutionEnv env, Map<String, String> parameters) throws Throwable
  {
    System.err.println("Creating ArbExpressionControl");
    return new ExpressionExecutionControl(env,
                                          parameters);
  }
}
