/**
 *
 * The arb.expression package provides classes and interfaces for representing,
 * transforming, and evaluating mathematical expressions. It's currently
 * designed to handle {@link arb.Real} numbered expressions, but future updates
 * will have expanded functionality to handle holomorphic functions as well.
 *
 * <h1>PRIORITIES</h1>
 * <ul>
 * <li>support symbolic constants such as π #219</li>
 * <li>expression compiler: integer-valued literal-constants should map to
 * integer-versions of arblib calls if they exist #222</li>
 * <li>Complex types</li>
 * <li>Mixed Real -> Complex and Complex -> Real types</li>
 * <li>Other Fields like the Field of Rationals, which will require swig
 * mappings for the corresponding flint structures...</li>
 * </ul>
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
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
package arb.expressions;
