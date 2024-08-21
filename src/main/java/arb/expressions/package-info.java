/**
 * The arb.expression package provides classes and interfaces for representing,
 * transforming, and evaluating mathematical expressions. It's currently
 * designed to handle {@link arb.Real} numbered expressions, but future updates
 * will have expanded functionality to handle holomorphic functions as well.
 * 
 * <p>
 * The package primarily revolves around the {@link arb.expressions.Expression}
 * class which generates {@link arb.functions.Function} implementations
 * on-the-fly very quickly by using an expression tree to parse String
 * representations of formulae with each node in the tree being an instance of
 * {@link arb.expressions.nodes.Node}. This flexible structure allows for
 * parsing and and executing many expressions, with support for
 * {@link arb.expressions.nodes.LiteralConstantNode},
 * {@link arb.expressions.nodes.VariableNode}s,
 * {@link arb.expressions.nodes.binary.BinaryOperationNode}s, and
 * {@link arb.expressions.nodes.unary.UnaryOperationNode}s such as
 * {@link arb.expressions.nodes.unary.WhenNode} and the related
 * {@link arb.expressions.nodes.ElseNode} node as well as
 * {@link arb.expressions.nodes.nary.NAryOperationNode}s like
 * {@link arb.expressions.nodes.nary.ProductNode} and
 * {@link arb.expressions.nodes.nary.SumNode}
 *
 * <p>
 * The {@link arb.expressions.Expression} class uses the objectweb ASM library
 * to generate bytecode for the mathematical expression it represents. It
 * dynamically creates a class that implements the
 * {@link arb.functions.Function} interface or any interface that extends it,
 * with each instance of the class representing a specific mathematical
 * expression.
 *
 * <p>
 * The {@link arb.expressions.Expression} class also provides methods for
 * instantiating these dynamically created classes, injecting variables into
 * their instances, and invoking their methods to evaluate the mathematical
 * expressions they represent.
 *
 * <p>
 * The package also includes a suite of unit tests to ensure the correctness of
 * the expression parsing, transformation, evaluation, and bytecode generation
 * features.
 *
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
package arb.expressions;
