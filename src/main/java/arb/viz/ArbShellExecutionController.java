package arb.viz;

import java.util.List;
import java.util.Map;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import jdk.jshell.JShell;
import jdk.jshell.SnippetEvent;
import jdk.jshell.execution.LocalExecutionControlProvider;
import jdk.jshell.spi.ExecutionControl;
import jdk.jshell.spi.ExecutionControlProvider;
import jdk.jshell.spi.ExecutionEnv;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ArbShellExecutionController
{
  public static void main(String[] args)
  {
    JShell shell = JShell.builder().executionEngine(new EnhancedExecutionControlProvider(), null).build();
    List<SnippetEvent> eval = shell.eval("System.out.println(\"Yo\");");
    System.out.println( "eval response: " + eval);
  }

  public static class EnhancedExecutionControlProvider implements
                                                       ExecutionControlProvider
  {
    private final ExecutionControlProvider defaultProvider = new LocalExecutionControlProvider();

    @Override
    public String name()
    {
      return "Math";
    }

    @Override
    public ExecutionControl generate(ExecutionEnv env, Map<String, String> parameters) throws Throwable
    {
      return new MathExecutionControl(defaultProvider.generate(env, parameters));
    }
  }

  static class MathExecutionControl implements
                                    ExecutionControl
  {
    private final ExecutionControl defaultControl;

    public MathExecutionControl(ExecutionControl defaultControl)
    {
      this.defaultControl = defaultControl;
    }

    @Override
    public void load(ClassBytecodes[] cbcs) throws ClassInstallException,
                                            NotImplementedException,
                                            EngineTerminationException
    {
      defaultControl.load(cbcs);
    }

    @Override
    public void redefine(ClassBytecodes[] cbcs) throws ClassInstallException,
                                                NotImplementedException,
                                                EngineTerminationException
    {
      defaultControl.redefine(cbcs);
    }

    @Override
    public String invoke(String className,
                         String methodName) throws RunException, EngineTerminationException, InternalException
    {
      return defaultControl.invoke(className, methodName);
    }

    @Override
    public String varValue(String className,
                           String varName) throws RunException, EngineTerminationException, InternalException
    {
      return defaultControl.varValue(className, varName);
    }

    @Override
    public void stop() throws EngineTerminationException, InternalException
    {
      defaultControl.stop();
    }

    @Override
    public void close()
    {
      defaultControl.close();
    }

    @Override
    public void addToClasspath(String path) throws EngineTerminationException, InternalException
    {
      defaultControl.addToClasspath(path);
    }

    @Override
    public Object extensionCommand(String command,
                                   Object arg) throws RunException, EngineTerminationException, InternalException
    {
      return defaultControl.extensionCommand(command, arg);
    }
  }
}
