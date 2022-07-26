package arb.algebraic.expressions;

import java.util.Map;

public abstract class ExpressionCompiler<F extends arb.functions.Function<?, ?>> implements
                                        java.util.function.Function<String, F>
{
  public ExpressionParser      parser = new ExpressionParser();
  public Map<String, Function> functions;
  public Map<String, Variable> variables;

  public ExpressionCompiler()
  {

  }

  public F compile(String expression)
  {
    Expression expressed = parser.parse(expression, variables, functions);
    assert false : " parsed " + expression
                  + " TODO: assemble a class that implements F with objectweb asm then return that";
    return (F) null;
  }
}
