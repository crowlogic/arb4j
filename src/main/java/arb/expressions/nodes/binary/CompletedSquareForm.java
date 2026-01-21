package arb.expressions.nodes.binary;

import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Classifies the form after completing the square. Result = coefficient *
 * arcsin/arcsinh/arccosh(argument)
 */
class CompletedSquareForm<D, R, F extends Function<? extends D, ? extends R>>
{
  enum FunctionType
  {
   ARCSIN, // ∫ 1/√(a² - u²) du
   ARCSINH, // ∫ 1/√(u² + a²) du
   ARCCOSH // ∫ 1/√(u² - a²) du
  }

  final FunctionType  type;
  final Node<D, R, F> coefficient; // 1/√|a| typically
  final Node<D, R, F> argument;    // the u inside the function
  final Node<D, R, F> scale;       // scaling factor for argument

  CompletedSquareForm(FunctionType type,
                      Node<D, R, F> coefficient,
                      Node<D, R, F> argument,
                      Node<D, R, F> scale)
  {
    this.type        = type;
    this.coefficient = coefficient;
    this.argument    = argument;
    this.scale       = scale;
  }
}