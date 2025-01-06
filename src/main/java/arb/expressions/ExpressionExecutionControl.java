package arb.expressions;

import java.util.Map;

import arb.Real;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import arb.utensils.Utensils;
import jdk.jshell.spi.ExecutionControl;
import jdk.jshell.spi.ExecutionEnv;

/**
 * A JShell ExecutionControl for a REPL-style interface
 */
class ExpressionExecutionControl implements
                           ExecutionControl
{
  private final ExecutionEnv env;
  private final Context      context;

  public ExpressionExecutionControl(ExecutionEnv env, Map<String, String> parameters)
  {
    this.env     = env;
    this.context = new Context();
    System.err.println("Initialized context: " + context);
  }

  @Override
  public String invoke(String className,
                       String methodName) throws RunException, EngineTerminationException, InternalException
  {
    System.err.println("Processing: " + className);
    try
    {
      if (className.contains("->") || className.contains("➔"))
      {
        // This is a function definition like "f:x->sin(x)"
        var expression =
                       Function.parse(null, className, context, Real.class, Real.class, RealFunction.class, null, null);
        System.err.println("Parsed function definition: " + expression);

        // Compile and instantiate the function
        var instance = expression.compile().instantiate();

        // Store in context
        if (expression.functionName != null)
        {
          context.registerFunctionMapping(expression.functionName, instance, Real.class, Real.class);
          System.err.println("Registered function: " + expression.functionName);
        }

        return "Defined " + expression.toString();
      }
      else
      {
        // This is a function evaluation like "f(2)" or direct expression
        // Try to find existing function first
        String funcName = className.split("[\\(\\s]")[0];
        var    mapping  = context.functions.get(funcName);

        if (mapping != null)
        {
          // Parse argument
          String argStr = className.substring(className.indexOf('(') + 1, className.indexOf(')'));

          var    result = ((RealFunction) mapping.instance).evaluate(new Real().set(argStr, 128), 1, 128, new Real());
          System.err.println("Evaluated " + funcName + "(" + argStr + ") = " + result);
          return result.toString();
        }
        else
        {
          // Treat as direct expression
          var expression = Function.parse(null,
                                          className,
                                          context,
                                          Real.class,
                                          Real.class,
                                          RealFunction.class,
                                          null,
                                          null);
          System.err.println("Parsed direct expression: " + expression);

          var instance = expression.compile().instantiate();
          var result   = instance.evaluate(new Real().set(1), 1, 128, new Real());
          System.err.println("Result: " + result);
          return result.toString();
        }
      }
    }
    catch (Exception e)
    {
      System.err.println("Failed: " + e.getMessage());
      Utensils.throwOrWrap(e);
      return null;
    }
  }

  @Override
  public void
         load(ClassBytecodes[] cbcs) throws ClassInstallException, NotImplementedException, EngineTerminationException
  {
    System.err.println("Load called with " + cbcs.length + " classes");
  }

  @Override
  public void redefine(ClassBytecodes[] cbcs) throws ClassInstallException,
                                              NotImplementedException,
                                              EngineTerminationException
  {
    System.err.println("Redefine called with " + cbcs.length + " classes");
  }

  @Override
  public String varValue(String className,
                         String varName) throws RunException, EngineTerminationException, InternalException
  {
    System.err.println("varValue called: " + className + "." + varName);
    return null;
  }

  @Override
  public void addToClasspath(String path) throws EngineTerminationException, InternalException
  {
    System.err.println("Add to classpath: " + path);
  }

  @Override
  public void stop() throws EngineTerminationException, InternalException
  {
    System.err.println("Stop called");
  }

  @Override
  public Object extensionCommand(String command,
                                 Object arg) throws RunException, EngineTerminationException, InternalException
  {
    System.err.println("Extension command: " + command);
    return null;
  }

  @Override
  public void close()
  {
    System.err.println("Close called");
  }
}