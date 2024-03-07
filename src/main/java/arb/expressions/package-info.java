/**
 * The arb.expression package provides classes and interfaces for representing,
 * transforming, and evaluating mathematical expressions. It's currently
 * designed to handle {@link arb.Real} numbered expressions, but future updates
 * will have expanded functionality to handle holomorphic functions as well.
 * 
 * <p>
 * The package primarily revolves around the {@link arb.expressions.Expression}
 * class which implements the {@link arb.functions.real.RealFunction} interface.
 * It uses an expression tree to represent mathematical expressions, with each
 * node in the tree being an instance of {@link arb.expressions.nodes.Node}.
 * This class structure allows for parsing and manipulating complex expressions,
 * with support for constants, variables, binary operations, unary operations,
 * and function calls.
 *
 * <p>
 * The {@link arb.expressions.Expression} class uses the objectweb ASM library
 * to generate bytecode for the mathematical expression it represents. It
 * dynamically creates a class that implements the
 * {@link arb.functions.real.RealFunction} interface, with each instance of the
 * class representing a specific mathematical expression.
 *
 * <p>
 * The {@link arb.expressions.Expression} class also provides methods for
 * instantiating these dynamically created classes, injecting variables into
 * their instances, and invoking their methods to evaluate the mathematical
 * expressions they represent.
 *
 * <p>
 * Although the current implementation only supports the
 * {@link arb.functions.real.RealFunction} interface, future updates will add
 * support for the ComplexFunction interface, extending the functionality of
 * this package to handle complex number expressions.
 *
 * <p>
 * The package also includes a suite of unit tests to ensure the correctness of
 * the expression parsing, transformation, evaluation, and bytecode generation
 * features.
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
package arb.expressions;
