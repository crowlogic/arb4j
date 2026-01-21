package arb.expressions.nodes.binary;

import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Represents extracted quadratic coefficients: ax² + bx + c
 */
class QuadraticCoefficients<D, R, F extends Function<? extends D, ? extends R>>
{
  final Node<D, R, F>         a;       // coefficient of x²
  final Node<D, R, F>         b;       // coefficient of x
  final Node<D, R, F>         c;       // constant term
  final VariableNode<D, R, F> variable;

  QuadraticCoefficients(Node<D, R, F> a,
                        Node<D, R, F> b,
                        Node<D, R, F> c,
                        VariableNode<D, R, F> variable)
  {
    this.a        = a;
    this.b        = b;
    this.c        = c;
    this.variable = variable;
  }
}