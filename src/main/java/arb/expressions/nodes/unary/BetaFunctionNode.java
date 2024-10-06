package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

public class BetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             FunctionCallNode<D, C, F>
{

  private final Node<D, C, F>       x;
  private final Node<D, C, F>       y;
  private final Expression<D, C, F> definition;

  public BetaFunctionNode(Expression<D, C, F> expression)
  {
    super("Beta",
          null,
          expression);

    x = expression.resolve();
    expression.require(',');
    y = expression.resolve();
    expression.require(')');

    Context context = new Context();
    context.registerVariable("x", expression.newCoDomainInstance());
    context.registerVariable("y", expression.newCoDomainInstance());

    definition = Function.compile(expression.domainType,
                                  expression.coDomainType,
                                  expression.functionClass,
                                  "Γ(x)*Γ(y)/Γ(x+y)",
                                  context);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    x.generate(mv, resultType);
    expression.loadFieldOntoStack(mv, "x", resultType);
    expression.putField(mv, "x", resultType);

    y.generate(mv, resultType);
    expression.loadFieldOntoStack(mv, "y", resultType);
    expression.putField(mv, "y", resultType);

    definition.rootNode.generate(mv, resultType);
    return mv;
  }
}