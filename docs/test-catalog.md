# Test catalog

This catalog covers the current `src/test/java` tree under the requested extraction rule: `@Test` methods and `public void test*` methods in `TestCase` subclasses. The current tree contains 637 unique test methods under that rule.

### ComplexErfcTest.testErfcAtZeroIsOne
**What it does:** Evaluates `erfc(0)` at 128 bits, subtracts `1`, takes the absolute value, and asserts the offset is below `2^-100`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexErfcTest.testErfPlusErfcIsOne
**What it does:** Evaluates `erf(z)` and `erfc(z)` for `z = 0.7 - 1.3i`, adds them, subtracts `1`, takes the norm, and asserts the error is below `2^-150`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexErfcTest.testComplexErfMatchesRealErfOnTheRealAxis
**What it does:** Evaluates complex `erf(0.7 + 0i)` and real `erf(0.7)`, then asserts the real-part difference is below `2^-200` and the imaginary part is below `2^-200`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexFractionTest.testArraySet
**What it does:** Builds a two-entry `ComplexFraction` array from `7⁄8` and `1⁄4+ⅈ` and asserts the formatted vector string is `[(7⁄8)+(0)i, (1⁄4)+(1)i]`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexFractionTest.testArraySetAndBecome
**What it does:** Builds the same two-entry `ComplexFraction` array, asserts its string form, clones it with `become`, asserts the clone matches, checks `Fraction.BYTES == 16`, and resizes the original.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexFractionTest.testSet
**What it does:** Parses `7/8` and `1/4`, verifies they are initially unequal, copies the first into the second, and then asserts equality plus matching numerators and denominators.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexFractionTest.testDiv
**What it does:** Divides `7⁄8+2*ⅈ` by `1⁄4+ⅈ` and asserts the exact result string is `(71⁄34)+(-6⁄17)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexFractionTest.testAdd
**What it does:** Adds `7⁄8+2*ⅈ` and `1⁄4+ⅈ` and asserts the exact result string is `(9⁄8)+(3)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexFractionTest.testSub
**What it does:** Subtracts `1⁄4+ⅈ` from `7⁄8+2*ⅈ` and asserts the exact result string is `(5⁄8)+(1)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexFractionTest.testMul
**What it does:** Multiplies `7⁄8+2*ⅈ` by `1⁄4+ⅈ` and asserts the exact result string is `(-57⁄32)+(11⁄8)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexMultivariatePolynomialTest.testComplexMultivariatePolynomialParsingArithmeticAndCoefficientAccess
**What it does:** Creates a two-variable complex polynomial with coefficients `(1+i)` on `z` and `2` on `w`, squares it, then asserts the original and squared coefficients for `z`, `z^2`, `zw`, and `w^2` match the expected real and imaginary parts.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testComplexRationalLommelPolynomials
**What it does:** Registers `v = 1/2` in a `Context`, compiles two indexed complex-rational sequence definitions for Lommel polynomials, evaluates each at `n = 3`, and asserts both stringify as `(-6*z^2+15)/(z^3) + 0i`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Index access
- Arithmetic and algebraic operator nodes
- Built-in function and special-function nodes

### ComplexRationalFunctionTest.testComplexRationalLommelPolynomialsAsNullary
**What it does:** Compiles a complex-rational nullary expression in a context containing `v = 1/2` and `n = 3`, evaluates it, and asserts the result string is `(-6*z^2+15)/(z^3) + 0i`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes
- Built-in function and special-function nodes

### ComplexRationalFunctionTest.testAddToo
**What it does:** Adds constant complex rational functions `3` and `4` into a preallocated result and asserts the result string is `7 + 0i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testPowers
**What it does:** Compiles the indexed sequence `n➔(½-z/2)ⁿ`, evaluates it at `n = 0, 1, 2, 3, -2`, and asserts the resulting complex rational forms are `1 + 0i`, `(-z+1)/2 + 0i`, `(z^2-2*z+1)/4 + 0i`, `(-z^3+3*z^2-3*z+1)/8 + 0i`, and `4/(z^2-2*z+1) + 0i`.
**Compiler features exercised:**
- Index access
- Arithmetic and algebraic operator nodes
- Context-based symbol resolution and namespace management

### ComplexRationalFunctionTest.testRationalIdentityExpression
**What it does:** Compiles the expression `x` as a complex rational function and asserts it stringifies as `x + 0i`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### ComplexRationalFunctionTest.testXOver2
**What it does:** Compiles the expression `x/2` and asserts it stringifies as `(x)/2 + 0i`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes

### ComplexRationalFunctionTest.testOneHalfMinusXOver2
**What it does:** Compiles the expression `½-x/2` and asserts it stringifies as `(-x+1)/2 + 0i`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Unicode surface syntax and literal parsing
- Arithmetic and algebraic operator nodes

### ComplexRationalFunctionTest.testXToThePowerOfNegativeOne
**What it does:** Compiles `x^(-1)` and asserts it stringifies as `1/(x) + 0i`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes

### ComplexRationalFunctionTest.testXSquaredToThePowerOfNegativeOne
**What it does:** Compiles `(x^2)^(-1)` and asserts it stringifies as `1/(x^2) + 0i`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes

### ComplexRationalFunctionTest.testOneHalfMinusXOver2Squared
**What it does:** Compiles `(½-x/2)^2` and asserts it expands to `(x^2-2*x+1)/4 + 0i`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Unicode surface syntax and literal parsing
- Arithmetic and algebraic operator nodes

### ComplexRationalFunctionTest.testSubToo
**What it does:** Subtracts constant complex rational functions `3` from `10` into a separate result and asserts the result string is `7 + 0i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testMulToo
**What it does:** Multiplies constant complex rational functions `3` and `4` into a preinitialized result and asserts the result string is `12 + 0i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testDivToo
**What it does:** Divides constant complex rational functions `3` by `4` into a preinitialized result and asserts the result string is `3/4 + 0i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testAdditiveIdentity
**What it does:** Calls `additiveIdentity()` on a complex rational function and asserts both the real and imaginary parts become zero.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testMultiplicativeIdentity
**What it does:** Calls `multiplicativeIdentity()` on a complex rational function and asserts the real part becomes one and the imaginary part becomes zero.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testAdd
**What it does:** Adds `1+2i` and `3+4i` and asserts the result string is `4 + 6i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testAddWithNegativeImaginary
**What it does:** Adds `1-2i` and `3+4i` and asserts the result string is `4 + 2i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testAddInteger
**What it does:** Adds the integer `3` to the complex rational value `1+2i` and asserts the result string is `4 + 2i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testSub
**What it does:** Subtracts `2+3i` from `5+7i` and asserts the result string is `3 + 4i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testSubWithNegativeImaginary
**What it does:** Subtracts `2+3i` from `5-7i` and asserts the result string is `3 + (-10)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testMul
**What it does:** Multiplies `1+2i` by `3+4i` and asserts the result string is `-5 + 10i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testMulWithNegativeImaginary
**What it does:** Multiplies `1-2i` by `3+4i` and asserts the result string is `11 + (-2)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testDiv
**What it does:** Divides `1+2i` by `3+4i`, evaluates the real and imaginary rational parts at `x = 0`, and asserts they are exactly `11/25` and `2/25`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testDivWithNegativeImaginary
**What it does:** Divides `1-2i` by `3+4i` and asserts the result string is `-1/5 + (-2/5)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testMulInt
**What it does:** Multiplies `2+3i` by the integer `2` and asserts the result string is `4 + 6i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testDivInt
**What it does:** Divides `4+6i` by the integer `2` and asserts the result string is `2 + 3i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testEvaluate
**What it does:** Sets the real part to `x + 1` and the imaginary part to `x - 1`, evaluates at `x = 2/3`, and asserts the exact result string is `(5⁄3)+(-1⁄3)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testEvaluateWithNegativeRealPart
**What it does:** Sets the real part to `x + 1` and the imaginary part to `1-x`, evaluates at `x = -3/4`, and asserts the exact result string is `(1⁄4)+(7⁄4)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testVerify
**What it does:** Calls `verify()` on a freshly created complex rational function and asserts it returns true.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testToString
**What it does:** Sets a complex rational function to `1+2i` and asserts its string form is `1 + 2i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexRationalFunctionTest.testToStringWithNegativeImaginary
**What it does:** Sets a complex rational function to `1-2i` and asserts its string form is `1 + (-2)i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexTest.testIsNegativeInteger
**What it does:** Starts from `-3`, asserts `Complex.isNegativeInteger` is true there, then changes the value to have a tiny imaginary part, to `-3.01`, to `0`, and to `1`, asserting the predicate is false in each of those cases.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexTest.testLogGamma
**What it does:** Evaluates `logΓ(8.7)` as a complex number, asserts the real part is `9.967761685128642593213111179011761191`, and asserts the imaginary part is zero.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testRaiseIntegerToFractionalPower
**What it does:** Compiles the nullary real expression `2^(1/4)`, evaluates it, and asserts the double value is `1.189207115002721066717499970560475915293`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Fractional calculus

### FractionTest.testAscendingFactorialOfFractionToIntegerWithRealResult
**What it does:** Computes the ascending factorial of `2/3` by `3` into a `Real` and asserts the result is `2.962962962962962962962962962962962962962962962`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testSet
**What it does:** Parses `7/8` and `1/4`, verifies they are unequal, copies the first into the second, and then asserts equality plus matching numerators and denominators.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testNewVector
**What it does:** Allocates a `Fraction` vector of dimension `5` in an `Arena` and asserts `dim()` returns `5`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testVectorElementAccess
**What it does:** Fills a three-element `Fraction` vector with `1⁄2`, `2⁄3`, and `3⁄4` via numerator and denominator accessors and asserts each indexed element string matches.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testVectorToString
**What it does:** Fills a three-element `Fraction` vector with `1⁄2`, `2⁄3`, and `3⁄4` and asserts the vector string is `[1⁄2, 2⁄3, 3⁄4]`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testVectorAddition
**What it does:** Adds two two-element `Fraction` vectors entrywise, `[(1⁄2),(2⁄3)] + [(1⁄3),(1⁄4)]`, and asserts the result string is `[5⁄6, 11⁄12]`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testVectorMultiplication
**What it does:** Multiplies two two-element `Fraction` vectors entrywise, `[(1⁄2),(2⁄3)] * [(1⁄3),(3⁄4)]`, and asserts the result string is `[1⁄6, 1⁄2]`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testVectorSubtraction
**What it does:** Subtracts two two-element `Fraction` vectors entrywise, `[(3⁄4),(5⁄6)] - [(1⁄2),(1⁄3)]`, and asserts the result string is `[1⁄4, 1⁄2]`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testOne
**What it does:** Calls `one()` on a `Fraction` and asserts the string form is `1` and the fraction is reduced.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testZero
**What it does:** Calls `zero()` on a `Fraction` and asserts the string form is `0` and the fraction is reduced.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testMultiplication
**What it does:** Multiplies `1⁄2` by `3⁄4` and asserts the exact result string is `3⁄8`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testDivision
**What it does:** Divides `1⁄2` by `3⁄4` and asserts the exact result string is `2⁄3`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testSubtraction
**What it does:** Subtracts `1⁄2` from `3⁄4` and asserts the exact result string is `1⁄4`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testSubtractionWithUnusedBitsSpecified
**What it does:** Subtracts `1⁄2` from `3⁄4` using the overload that accepts a bits argument and asserts the exact result string is `1⁄4`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testEqualityWithoutReduction
**What it does:** Parses `1⁄2` and `2⁄4` and asserts they are not equal before reduction.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testEqualityWithReduction
**What it does:** Parses `1⁄2` and `2⁄4`, reduces the second value, and asserts the two fractions are then equal.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testEqualityDifferentValues
**What it does:** Parses `1⁄2` and `3⁄4` and asserts they are not equal.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testEqualityWithZero
**What it does:** Parses `0⁄1` and `0⁄5`, reduces the second fraction, and asserts the two zero values compare equal.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testNegativeFractions
**What it does:** Checks that `-1⁄2` is unequal to `1⁄2` and to unreduced `-2⁄4`, then reduces `-2⁄4` and asserts equality, and finally negates the numerator of `3⁄4` and asserts it then equals `-3⁄4`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testAdd
**What it does:** Builds `5/10` and `1/4`, checks reduction status before and after `reduce()`, adds them, and asserts the result numerator and denominator are `3` and `4`.
**Compiler features exercised:** none — tests native arb wrapper only.

### FractionTest.testToAndFromStringAndAddingIntegersToNumeratorAndDenominator
**What it does:** Parses `34⁄23`, asserts the stored numerator and denominator, adds `6` and `7` to them, asserts the unreduced string becomes `40⁄30`, then reduces and asserts the final string is `4⁄3`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testAddRealFromIntegerWithIntegerPolynomialResult
**What it does:** Adds the real value `3.0` to the integer `4` into an `IntegerPolynomial` and asserts the result string is `7`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testIndexedAccess
**What it does:** Parses `7*x+3*x^2`, asserts the normalized string is `3*x^2+7*x`, and asserts coefficients at degrees `1`, `2`, and `0` are `7`, `3`, and `0`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testIdentity
**What it does:** Asserts a new `IntegerPolynomial` starts as `0`, calls `identity()`, and then asserts the string form is `x`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testSet
**What it does:** Parses `4-3*x+4*x^3+2*x^2` and asserts the normalized string is `4*x^3+2*x^2-3*x+4`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testEval
**What it does:** Parses `4-3*x+4*x^3+2*x^2`, evaluates it at `x = 5`, and asserts the integer result is `539`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testAssertSimpleToString
**What it does:** Sets an `IntegerPolynomial` to the constant `3` and asserts its string form is `3`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testAdd
**What it does:** Adds constant integer polynomials `3` and `4` into a result and asserts the result string is `7`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testSub
**What it does:** Subtracts constant integer polynomials `3` from `10` into a result and asserts the result string is `7`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testMul
**What it does:** Multiplies constant integer polynomials `3` and `4` into a result and asserts the result string is `12`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerPolynomialTest.testDiv
**What it does:** Divides constant integer polynomials `3` by `4` into a result and asserts the integer-polynomial quotient string is `0`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testAscendingFactorial
**What it does:** Computes the ascending factorial of integer `3` by `1/2` into a `Real` and asserts the result is `1.6616754852239212756`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testVectorString
**What it does:** Fills a three-element integer vector with `41`, `6`, and `2`, asserts the vector string is `[41 6 2]`, assigns a name, and asserts the displayed values stay the same.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testAddComplexToComplex
**What it does:** Adds integer `3` to complex `4` into a complex result and asserts the result string is `7`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testAddRealToComplex
**What it does:** Adds integer `3` to real `4` into a complex result and asserts the result string is `7`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testAdd
**What it does:** Adds integers `3` and `4` into a third integer and asserts the result string is `7`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testSub
**What it does:** Subtracts `4` from `3` into a result integer and asserts the result string is `-1`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testMul
**What it does:** Multiplies integers `3` and `4` into a result integer and asserts the result string is `12`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testTwoIntsInOneFractionOut
**What it does:** Divides integer `3` by integer `4` into a `Fraction` result and asserts the exact result string is `3⁄4`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testDiv
**What it does:** Divides integer `3` by integer `4` into an integer result and asserts the quotient string is `0`.
**Compiler features exercised:** none — tests native arb wrapper only.

### IntegerTest.testDivRemainder
**What it does:** Divides integer `3` by integer `4` into an integer result with a remainder slot and asserts the quotient is `0` and the remainder is `3`.
**Compiler features exercised:** none — tests native arb wrapper only.

### LinearRegressionTest.testLinearRegression
**What it does:** Performs linear regression on `x = [1,2,3,4,5]` and `y = [6,7,8,9,10]` and asserts the fitted polynomial has slope `1` and intercept `5`.
**Compiler features exercised:** none — tests native arb wrapper only.

### MagnitudeTest.testDoubleSetter
**What it does:** Initializes a `Magnitude` with `arblib.mag_init` and sets it from the double value `6.9` without further assertions.
**Compiler features exercised:** none — tests native arb wrapper only.

### PartitionTest.testPartition
**What it does:** Partitions the interval `[0,10]` into `500` pieces, asserts the stored step overlaps and contains `0.02`, iterates the partition, and asserts it yields exactly `500` values.
**Compiler features exercised:** none — tests native arb wrapper only.

### QuaternionTest.testMultiply
**What it does:** Multiplies two specific quaternions built from real constants and asserts all four resulting components match the expected double values.
**Compiler features exercised:** none — tests native arb wrapper only.

### QuaternionTest.testInverse
**What it does:** Computes the multiplicative inverse of a specific quaternion and asserts all four resulting components match the expected double values.
**Compiler features exercised:** none — tests native arb wrapper only.

### QuaternionTest.testNorm
**What it does:** Computes `norm2` of a specific quaternion and asserts the result is `15.119604401089358`.
**Compiler features exercised:** none — tests native arb wrapper only.

### QuaternionTest.testDivision
**What it does:** Divides one specific quaternion by another and asserts all four resulting components match the expected double values.
**Compiler features exercised:** none — tests native arb wrapper only.

### RationalFunctionTest.testAdd
**What it does:** Adds constant rational functions `3` and `4` into a result and asserts the result string is `7`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RationalFunctionTest.testInitAndToString
**What it does:** Creates a new rational function and asserts its numerator starts as `0` and its denominator starts as `1`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RationalFunctionTest.testPowers
**What it does:** Compiles the indexed sequence `n➔(½-z/2)ⁿ`, evaluates it at `n = 0, 1, 2, 3, -2`, and asserts the resulting rational forms are `1`, `(-z+1)/2`, `(z^2-2*z+1)/4`, `(-z^3+3*z^2-3*z+1)/8`, and `4/(z^2-2*z+1)`.
**Compiler features exercised:**
- Index access
- Arithmetic and algebraic operator nodes
- Context-based symbol resolution and namespace management

### RationalFunctionTest.testRationalIdentityExpression
**What it does:** Compiles the expression `x` as a rational function and asserts it stringifies as `x`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### RationalFunctionTest.testXOver2
**What it does:** Compiles the expression `x/2` and asserts it stringifies as `(x)/2`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes

### RationalFunctionTest.testOneHalfMinusXOver2
**What it does:** Compiles the expression `½-x/2` and asserts it stringifies as `(-x+1)/2`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Unicode surface syntax and literal parsing
- Arithmetic and algebraic operator nodes

### RationalFunctionTest.testXToThePowerOfNegativeOne
**What it does:** Compiles `x^(-1)` and asserts it stringifies as `1/(x)`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes

### RationalFunctionTest.testXSquaredToThePowerOfNegativeOne
**What it does:** Compiles `(x^2)^(-1)` and asserts it stringifies as `1/(x^2)`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes

### RationalFunctionTest.testOneHalfMinusXOver2Squared
**What it does:** Compiles `(½-x/2)^2` and asserts it expands to `(x^2-2*x+1)/4`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Unicode surface syntax and literal parsing
- Arithmetic and algebraic operator nodes

### RationalFunctionTest.testSub
**What it does:** Subtracts constant rational functions `3` from `10` into a result and asserts the result string is `7`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RationalFunctionTest.testMul
**What it does:** Multiplies constant rational functions `3` and `4` into a result and asserts the result string is `12`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RationalFunctionTest.testDiv
**What it does:** Divides constant rational functions `3` by `4` into a result and asserts the result string is `3/4`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testConstructor
**What it does:** Verifies that a `RealDataSet` built over `[-1,1]` with length `100` has the expected name, dimension `2`, data count, allocated x/y value storage, and default symmetric mode.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testGetDataCount
**What it does:** Asserts the dataset reports a data count of `100`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testGetRealValues
**What it does:** Retrieves the x and y `Real` vectors and asserts both are non-null and each has length `100`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testGet
**What it does:** Iterates all stored samples and asserts `get(0,i)` and `get(1,i)` equal the midpoint values in the x and y `Real` rows at every index.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testGetInvalidDimension
**What it does:** Calls `get` with dimensions `-1` and `2`, expects `AssertionError` both times, and asserts the messages mention the offending `dimIndex` values.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testGetInvalidIndex
**What it does:** Calls `get(0, TEST_LENGTH)`, expects an `AssertionError`, and fails if none is thrown.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testGetResolution
**What it does:** Retrieves the dataset resolution into a supplied `Float`, asserts the same object is returned, and asserts its value matches `dataSet.resolution`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testToString
**What it does:** Asserts the dataset string form is exactly `RealDataSet[testDataSet]`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testSetThrowsAssertion
**What it does:** Calls `dataSet.set(null, false)`, expects an `AssertionError`, and asserts the message contains `no can do`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testStructure
**What it does:** Fills the dataset with sample x and `sin(x)` values, builds a structured dataset of size `50`, and asserts the new dataset exists, has dimension `2`, keeps the original resolution, and is named `varianceStructure(RealDataSet[testDataSet],n=50)`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testMultipleDataSets
**What it does:** Creates a second dataset sharing the same domain, asserts its x and y storage are distinct from the first dataset's storage, and asserts the two datasets keep their separate lengths `100` and `50`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testCloseIdempotency
**What it does:** Calls `close()` twice on the dataset to ensure it does not throw, then recreates a cleanup dataset for `tearDown`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testCloseWithNullData
**What it does:** Creates a second dataset named `empty` and calls `close()` on it twice to verify repeated close operations are tolerated.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testSymmetricErrorType
**What it does:** Asserts the x dimension reports `NO_ERROR` and the y dimension reports `SYMMETRIC` error bars.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testAsymmetricErrorType
**What it does:** Creates an asymmetric dataset, asserts the x dimension reports `NO_ERROR`, the y dimension reports `ASYMMETRIC`, and `isAsymmetric()` returns true.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testErrorBarsZeroByDefault
**What it does:** Iterates every sample and asserts positive and negative error values for both dimensions are all zero by default.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testSymmetricErrorRoundTrip
**What it does:** Writes radii `0.25, 1.25, 2.25, 3.25, 4.25` into the first five y-values of a symmetric dataset and asserts both positive and negative reported errors round-trip to those values within a relative tolerance.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealDataSetTest.testAsymmetricErrorRoundTrip
**What it does:** Creates an asymmetric dataset, writes separate positive radii `0.25+i` and negative radii `0.10+i` into the first five complex y-values, and asserts the reported positive and negative errors round-trip within relative tolerances.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixTest.testAssignRow
**What it does:** Builds two equal `4x4` matrices, setting the last row once from literals and once from a `Real` vector, and asserts the matrices compare equal.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixTest.testGetRowAndGet
**What it does:** Fills a `4x4` matrix, asserts row access and element access agree before and after swapping rows `0` and `3` twice, and checks the final indexed element again.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixTest.testChol
**What it does:** Computes the Cholesky factor of a `2x2` correlation matrix with off-diagonal `-0.75`, reconstructs the matrix from the factor, and asserts the reconstruction both contains and overlaps the original matrix.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixTest.testDiagonal
**What it does:** Takes the diagonal view of a `5x5` matrix, writes `1` through `5` into it, and asserts diagonal entries match those values while all off-diagonal entries remain zero.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixTest.testLowerUpperFactorization
**What it does:** Computes an LU factorization with an explicit permutation buffer for a fixed `4x4` matrix, reconstructs the matrix from the extracted lower and upper factors, asserts the Frobenius norm of the difference contains zero and is below `1e-35`, and asserts `get(i,j)` returns the same object as row-based access.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixTest.testDepermutedLowerUpperFactorization
**What it does:** Computes LU factors without an explicit permutation buffer for the same fixed `4x4` matrix, reconstructs the matrix, and asserts the Frobenius norm of the difference contains zero and is below `1e-35`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixTest.testTranspose
**What it does:** Fills a `4x4` matrix, transposes it into a second matrix, and asserts the result matches the expected transpose.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixTest.testMultiplyByScalar
**What it does:** Multiplies a `4x4` matrix by the scalar `2` and asserts the result matches the expected doubled matrix.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMultivariatePolynomialTest.testRealMultivariatePolynomialArithmeticAndCoefficientAccess
**What it does:** Creates generators `x` and `y` in a two-variable real polynomial context, forms `(x+y)^2`, asserts the sum and expanded product strings, and asserts the `xy` coefficient is `2.0`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPartitionTest.testCount
**What it does:** Asserts a partition of `[0,1]` into `5` parts reports `count() == 5`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPartitionTest.testIterator
**What it does:** Iterates the five-point partition of `[0,1]` and asserts the midpoints are approximately `0.1, 0.3, 0.5, 0.7, 0.9` in order.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPartitionTest.testGet
**What it does:** Retrieves partition entries `0` through `4` directly and asserts their midpoints are approximately `0.1, 0.3, 0.5, 0.7, 0.9`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPartitionTest.testIteratorMagnitude
**What it does:** Rebuilds the partition once with error bars enabled and once without them, then asserts each iterated value has radius `halfdt` in the first case and radius `0` in the second case.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPolynomialTest.testIntegralOfSequenceofPolynomialElement
**What it does:** Registers a Jacobi polynomial sequence `P`, compiles the indexed polynomial-sequence definition `wtf:n->int(P(n)(x),x)`, instantiates it, applies it at `n = 3`, and asserts the resulting polynomial string is `0.3125*x⁴ - 0.46875*x²`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation
- Index access
- Functional application and reified function evaluation
- Symbolic integration

### RealPolynomialTest.testSetFraction
**What it does:** Sets a real polynomial from the fraction `10/43` and asserts its constant coefficient is `0.23255813953488372093`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPolynomialTest.testPower
**What it does:** Squares the identity polynomial `x` and asserts the result string is `x²`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPolynomialTest.testIntegral
**What it does:** Builds the polynomial `10 + 5x`, integrates it, and asserts the resulting coefficients correspond to `2.5x² + 10x`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPolynomialTest.testDifferentiateIntegral
**What it does:** Integrates `10 + 5x`, differentiates the integral, and asserts the differentiated coefficients return to `5x + 10` while the integral still holds coefficients `2.5` and `10`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealPolynomialTest.testSetInt
**What it does:** Sets a real polynomial to the constant `10` and asserts its constant coefficient is `10.0`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testPowerToFraction
**What it does:** Raises `-0.57` to the `1/2` power and asserts the resulting `Real` is not finite.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testLogGamma
**What it does:** Evaluates `logΓ(8.7)` as a real number and asserts the result is `9.967761685128642593213111179011761191`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testRisingFactorialLong
**What it does:** Computes the ascending factorial of `6.9` by integer `3` and asserts the result is `485.139`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testRisingFactorialReal
**What it does:** Computes the ascending factorial of `6.9` by real `3` and asserts the result is `485.139`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testAddOneAndOne
**What it does:** Adds `1` to a zero-valued `Real` in place and asserts the result equals `RealConstants.one`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testChoose
**What it does:** Computes `10 choose 6` and asserts the resulting double value is `210.0`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testShift
**What it does:** Builds a length-`10` real vector with entries `0` through `9`, shifts it by `5`, and asserts the shifted view has size `5`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testOneIsExact
**What it does:** Asserts `RealConstants.one` is exact.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testVarianceStructure
**What it does:** Builds a real vector with entries `0` through `9`, computes `structure(5, 128)`, and asserts the first five entries equal the squared values `0^2` through `4^2` within `0.0001`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testAutocorrelationMatchesStatistics
**What it does:** Fills a length-`256` real vector from `sin(0.05*i) + 0.3*cos(0.13*i)`, computes autocorrelation for `32` lags, and asserts every lag matches `Statistics.autocorr` within `1e-12`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testSub
**What it does:** Subtracts `3` and `-3` from separate `Real(5.0)` inputs and asserts the results are approximately `2.0` and `8.0`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testAdd
**What it does:** Adds `3` and `-3` to separate `Real(5.0)` inputs and asserts the results are approximately `8.0` and `2.0`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealTest.testDotProduct
**What it does:** Builds real vectors `[1,2,3]` and `[4,5,6]`, computes their dot product, and asserts it equals `32`.
**Compiler features exercised:** none — tests native arb wrapper only.

### AutofunctionTest.testTwoParameterDeclarationMatchesArrowChain
**What it does:** Parses `n➔t➔n+t` and `(n,t)=n+t`, then asserts both expressions render the same root AST.
**Compiler features exercised:**
- Nested functional declarations

### AutofunctionTest.testSingleParameterDeclarationMatchesArrow
**What it does:** Parses `n➔t➔n+t` and `(n)=t➔n+t`, then asserts both forms produce the same root AST.
**Compiler features exercised:**
- Nested functional declarations

### AutofunctionTest.testNamedDeclarationMatchesAnonymous
**What it does:** Parses `Named(n,t)=n+t` and `(n,t)=n+t`, then asserts the consumed leading name does not change the resulting AST.
**Compiler features exercised:**
- Nested functional declarations

### BesselTargetFlatHoistingTest.testJOfKXIsNotHoisted
**What it does:** Generates the flat Bessel prefactor expression and asserts every `StaticNode` excludes the evaluation variable `x` and excludes any `J(k,x)` call.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### BesselTargetFlatHoistingTest.testExactlyOneCompositeStaticNode
**What it does:** Asserts the flat expression contains exactly one hoisted composite `StaticNode`, and that its delegate contains all four `Γ(...)` calls plus `π` and `j`.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### BesselTargetFlatHoistingTest.testCompositeDependsOnlyOnContextVariables
**What it does:** Asserts the single hoisted composite contains only `j` and `k` variable references, and that each is marked as a context variable and fixed instance data.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Context-based symbol resolution and namespace management

### BesselTargetFlatHoistingTest.testHoistingIsAtFixedPoint
**What it does:** Captures the optimized root text, reruns `replaceConstantNodes()`, and asserts the tree text is unchanged.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### BesselTargetHoistingTest.testJOfKXIsNotHoisted
**What it does:** Generates the nested `j➔k➔x➔...` expression and asserts every hoisted `StaticNode` excludes both the evaluation variable `x` and any `J(k,x)` call.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Nested functional declarations

### BesselTargetHoistingTest.testExactlyOneCompositeStaticNode
**What it does:** Asserts the innermost generated expression contains exactly one composite `StaticNode`, and that it contains all four `Γ(...)` calls plus `π` and `j`.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### BesselTargetHoistingTest.testCompositeDependsOnlyOnBoundParameters
**What it does:** Asserts the single hoisted composite depends only on bound parameters `j` and `k`, and that each referenced variable is marked `upstreamInput` and fixed instance data.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Nested functional declarations

### BoundVariableToStringTest.testBoundUpstreamVariableAppearsInFunctionalToString
**What it does:** Instantiates `n➔t➔J(n,t)`, binds `n=3`, and asserts the resulting inner function renders as `jBesselfunc:t➔J(3,t)`.
**Compiler features exercised:**
- Nested functional declarations

### BoundedVariableParsingTest.testOpenIntervalBounds
**What it does:** Parses `x∈(0,1)➔x²` and asserts the independent-variable bounds are `(0,1)` with both endpoints exclusive.
**Compiler features exercised:**
- Bounded variable metadata

### BoundedVariableParsingTest.testClosedIntervalBounds
**What it does:** Parses `x∈[0,1]➔x²` and asserts the independent-variable bounds are `[0,1]` with both endpoints inclusive.
**Compiler features exercised:**
- Bounded variable metadata

### BoundedVariableParsingTest.testHalfOpenLeftClosedBounds
**What it does:** Parses `x∈[0,1)➔x²` and asserts the lower bound is inclusive and the upper bound is exclusive.
**Compiler features exercised:**
- Bounded variable metadata

### BoundedVariableParsingTest.testHalfOpenRightClosedBounds
**What it does:** Parses `x∈(0,1]➔x²` and asserts the lower bound is exclusive and the upper bound is inclusive.
**Compiler features exercised:**
- Bounded variable metadata

### BoundedVariableParsingTest.testNonTrivialBounds
**What it does:** Parses `t∈(2,7)➔sin(t)` and asserts the stored bounds are `2` and `7`.
**Compiler features exercised:**
- Bounded variable metadata

### BoundedVariableParsingTest.testNoBoundsWithoutMembershipOperator
**What it does:** Parses `x➔x²` and asserts the independent-variable reference has no bounds.
**Compiler features exercised:**
- Bounded variable metadata

### BoundedVariableParsingTest.testBoundedExpressionEvaluatesCorrectly
**What it does:** Compiles `x∈(0,1)➔x²`, evaluates it at `x=0.5`, and asserts the result renders as `0.25`.
**Compiler features exercised:**
- Bounded variable metadata
- Typed expression compilation and codomain promotion

### BoundedVariableParsingTest.testBoundsToString
**What it does:** Parses `x∈(0,1)➔x²` and asserts the stored bounds render as `(0.0, 1.0)`.
**Compiler features exercised:**
- Bounded variable metadata

### BoundedVariableParsingTest.testClosedBoundsToString
**What it does:** Parses `x∈[0,1]➔x²` and asserts the stored bounds render as `[0.0, 1.0]`.
**Compiler features exercised:**
- Bounded variable metadata

### BoundedVariableParsingTest.testIsBounded
**What it does:** Parses bounded and unbounded variants of `x²` and asserts `isBounded()` is true only for the `∈` form.
**Compiler features exercised:**
- Bounded variable metadata

### ContextMergeTest.testNullArgumentIsNoOp
**What it does:** Merges `null` into a context that already contains variable `p` and asserts the original binding is unchanged.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextMergeTest.testImportNewVariable
**What it does:** Merges a second context containing variable `p` into an empty context and asserts `p` is imported.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextMergeTest.testCoalesceIdenticalVariable
**What it does:** Registers the same `Real` instance as `p` in both contexts, merges them, and asserts the binding still points to that same instance.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextMergeTest.testVariableClashErrorThrows
**What it does:** Merges two contexts that each bind a different `p` under `ERROR`, then asserts a `CompilerException` is thrown and names `p`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextMergeTest.testVariableClashPreferThisKeepsExisting
**What it does:** Merges two conflicting `p` bindings under `PREFER_THIS` and asserts the existing binding remains.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextMergeTest.testVariableClashPreferOtherOverwrites
**What it does:** Merges two conflicting `p` bindings under `PREFER_OTHER` and asserts the incoming binding replaces the existing one.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextMergeTest.testVariableClashRenameIncomingUnsupported
**What it does:** Merges two conflicting `p` bindings under `RENAME_INCOMING` and asserts an `UnsupportedOperationException` referencing `#1024` is thrown.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextMergeTest.testFunctionClashErrorThrows
**What it does:** Declares function `f` in two contexts, merges them under `ERROR`, and asserts a `CompilerException` naming `f` is thrown.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextMergeTest.testLegacySingleArgDelegatesToError
**What it does:** Calls the legacy single-argument `mergeFrom` on conflicting `p` bindings and asserts it throws `CompilerException` with `ERROR` semantics.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextNamespaceCoexistenceTest.testSameNameCoexistsAcrossVariablesAndFunctions
**What it does:** Registers both a `Real` named `r` and a `RealFunction` named `r`, then asserts one compiled expression sees `r` as a value and another sees `r` as a function.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextNamespaceCoexistenceTest.testVariableSideRespondsToMutationDespiteFunctionSideName
**What it does:** Compiles `v:x➔x*r` alongside function `r:x➔x+1`, mutates the variable `r` from `0.5` to `0.25`, and asserts reevaluation uses the updated variable value.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextNamespaceCoexistenceTest.testRegistrationOrderIndependent
**What it does:** Asserts the same-name variable/function setup works both when the function is registered before the value expression and when it is registered afterward.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ContextPackageIdentityTest.testUnpackagedContextProducesShortNameClass
**What it does:** Compiles `f:x➔x+1` in a default context and asserts the generated class name is just `f`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Bytecode generation and class loading

### ContextPackageIdentityTest.testPackagedContextProducesQualifiedClass
**What it does:** Compiles `g:x➔x*x` in a packaged context and asserts the generated class name is `arb.test.jacobi.g`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Bytecode generation and class loading

### ContextPackageIdentityTest.testTwoPackagedContextsCoexistWithSameShortName
**What it does:** Compiles two different `h` functions in two package-qualified contexts, asserts the generated classes are different JVM types, and asserts they evaluate to `3` and `6` at `x=3`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Bytecode generation and class loading

### ContextPackageIdentityTest.testPackagedContextNAryOperationCodegen
**What it does:** Compiles `x➔sum(k*x{k=1..10})` in a packaged context and asserts it evaluates to `110` at `x=2`.
**Compiler features exercised:**
- Bytecode generation and class loading
- Summation and product operators

### ContextPackageIdentityTest.testPackagedContextDerivativeCodegen
**What it does:** Compiles `t➔diff(sin(t),t)` in a packaged context and asserts it evaluates to `1` at `t=0`.
**Compiler features exercised:**
- Bytecode generation and class loading
- Symbolic differentiation

### ContextPackageIdentityTest.testPackagedContextNumericalIntegralCodegen
**What it does:** Compiles `a➔nint(t➔t*t, t=0…1)` in a packaged context and asserts the evaluation is approximately `1/3`.
**Compiler features exercised:**
- Bytecode generation and class loading
- Numerical integration

### ContextPackageIdentityTest.testPackagedContextSymbolicIntegralCodegen
**What it does:** Compiles `x➔∫s➔(1+s)ds∈(0,x)` in a packaged context and asserts it evaluates to `4` at `x=2`.
**Compiler features exercised:**
- Bytecode generation and class loading
- Symbolic integration

### ContextPackageIdentityTest.testPackagedContextComplexExpressionCodegen
**What it does:** Compiles `f:z➔z*z+1` as a packaged complex function, asserts the generated class name is package-qualified, and asserts evaluation returns a non-null result.
**Compiler features exercised:**
- Bytecode generation and class loading
- Typed expression compilation and codomain promotion

### ConvergentSumTest.testConvergentInfiniteSum
**What it does:** Compiles `Σk➔(x^k/k!){k=0…∞}`, evaluates it at `x=1`, compares the result with `e`, and asserts the absolute difference is below `1e-18`.
**Compiler features exercised:**
- Summation and product operators
- Arithmetic and algebraic operator nodes

### ConvergentSumTest.testFixedBoundSumUnchanged
**What it does:** Compiles `Σk➔(x^k/k!){k=0…10}`, evaluates it at `x=0`, and asserts the result is `1`.
**Compiler features exercised:**
- Summation and product operators
- Arithmetic and algebraic operator nodes

### ExpressionTest.testBoundUpstreamVariableAppearsInFunctionalToString
**What it does:** Instantiates `n➔t➔J(n,t)`, binds `n=3` through `apply`, and asserts the inner function renders as `jBesselfunc:t➔J(3,t)`.
**Compiler features exercised:**
- Nested functional declarations

### ExpressionTest.testOrderOfOperations
**What it does:** Compiles `(1/2)/y` and `1/(2*y)` as complex rational functions and asserts both evaluate to the same value at `y=2.3`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### ExpressionTest.testConstantFoldingToo
**What it does:** Compiles `f:m->y->-I*(4*3^2-1)*(-1)^(-m)/((4*3^2-2)*y*π)`, binds `m=3`, and asserts the inner function renders with the constant `35/34` arithmetic already folded.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Nested functional declarations

### ExpressionTest.testConstantFolding
**What it does:** Parses `((((-1)^3)-(2*((-1)^2)))-1)`, instantiates it, and asserts both evaluation and expression rendering equal `-4`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes

### ExpressionTest.testInlineContextualFunction
**What it does:** Parses `f:x➔x²` and `g:x➔f(x)+1` in a shared context, inlines `f` into `g`, and asserts `g` renders as `g:x➔(x^2)+1`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### ExpressionTest.testPropagateIndependentVariableCopiesByValue
**What it does:** Evaluates `H:i->i*x` with the same mutable `Integer` first set to `1` and then to `3`, and asserts the previously produced function still gives `2` at `x=2` while the new one gives `6`.
**Compiler features exercised:**
- Bounded variable metadata
- Nested functional declarations

### ExpressionTest.testIntegerToNegativeIntegerPower
**What it does:** Compiles `3^(-3)`, evaluates it, and asserts the result is `1/27`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### ExpressionTest.testDerivative
**What it does:** Compiles `∂x/∂x` in a context containing `x` and asserts the rendered derivative is `1`.
**Compiler features exercised:**
- Symbolic differentiation

### ExpressionTest.testDerivativeToo
**What it does:** Compiles `∂y/∂x` in a context containing `x` and `y` and asserts the rendered derivative is `0`.
**Compiler features exercised:**
- Symbolic differentiation

### ExpressionTest.testRealFunctionDerivative
**What it does:** Compiles `x->∂a*x+b*x²+c*x³/∂x` with `a=2`, `b=4`, and `c=6`, evaluates it at `x=2.3`, and asserts the numeric result is `115.62`.
**Compiler features exercised:**
- Symbolic differentiation
- Context-based symbol resolution and namespace management

### ExpressionTest.testRationalFunctionDerivative
**What it does:** Parses `x->∂a*x+b*x²+c*x³/∂x` as a rational nullary function, asserts the resulting polynomial renders as `18*x^2+8*x+2`, and asserts evaluating that polynomial at `x=2.3` yields `115.62`.
**Compiler features exercised:**
- Symbolic differentiation
- Typed expression compilation and codomain promotion

### ExpressionTest.testBinomialCoefficient
**What it does:** Compiles `binom(5,n)`, evaluates it at `n=3`, and asserts the result is `10`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes

### ExpressionTest.testLogGamma
**What it does:** Compiles `ln⁡Γ(t)`, evaluates it at `t=2.3`, and asserts the result is `0.15418945495963046`.
**Compiler features exercised:**
- Built-in function and special-function nodes

### ExpressionTest.testAbsoluteValue
**What it does:** Compiles `abs(2.3)`, evaluates it, and asserts the result is `2.3`.
**Compiler features exercised:**
- Built-in function and special-function nodes

### ExpressionTest.testImaginary
**What it does:** Compiles the literal `ⅈ`, evaluates it, and asserts the real part is zero, the imaginary part is one, and both components are exact.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing

### ExpressionTest.testVector
**What it does:** Compiles the vector literal `[8,0,8]`, evaluates it, and asserts the three entries are exact `8`, `0`, and `8`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing

### ExpressionTest.testSubstitutionToo
**What it does:** Parses a polynomial-valued sum/product expression `F`, substitutes `z` with `2*z`, and asserts the transformed expression text matches the expected rewritten summand.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Summation and product operators

### ExpressionTest.testSubstitutionToo2
**What it does:** Parses a second polynomial-valued sum/product expression `F`, substitutes `z` with `2*z`, and asserts the transformed expression text matches the expected quotient form.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Summation and product operators

### ExpressionTest.testSubstitution
**What it does:** Parses `2*x²`, substitutes `x` with `½-z/2`, generates the rewritten function, evaluates it at `z=8.08`, and asserts the result is `25.0632`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Bytecode generation and class loading

### ExpressionTest.testIntegralOfAConstant
**What it does:** Compiles `∫x➔1dx∈(2,4)` and asserts evaluation returns `2`.
**Compiler features exercised:**
- Symbolic integration

### ExpressionTest.testRatioOfRisingFactorials
**What it does:** Compiles `n➔(λ*2)₍ₙ₎/(λ+½)₍ₙ₎` with `λ=3.5`, evaluates it at `n=4`, and asserts the result is `6`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Context-based symbol resolution and namespace management

### ExpressionTest.testProductViaFactorial
**What it does:** Compiles `n➔∏k{k=1…n}`, evaluates it at `n=3`, and asserts the result is `6`.
**Compiler features exercised:**
- Summation and product operators

### ExpressionTest.testGammaReal
**What it does:** Compiles `Γ(4.0)`, evaluates it, and asserts the result is `6`.
**Compiler features exercised:**
- Built-in function and special-function nodes

### ExpressionTest.testGamma
**What it does:** Compiles `Γ(4)`, evaluates it, and asserts the result is `6`.
**Compiler features exercised:**
- Built-in function and special-function nodes

### ExpressionTest.testFactorial
**What it does:** Compiles `4!`, evaluates it, and asserts the result is `24`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes

### ExpressionTest.testFactorialToo
**What it does:** Compiles `x!`, evaluates it at `x=4`, and asserts the result is `24`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes

### ExpressionTest.testRisingFactorial
**What it does:** Compiles `x₍₃₎`, evaluates it at `x=5`, and asserts the result is `210`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes

### ExpressionTest.testVariableIndexedByASquareBracketedConstantAndMultipliedByTheDefactoInput
**What it does:** Compiles `α[1]*t` against a vector-valued context variable `α`, sets `α[1]=π`, evaluates at `t=2`, and asserts the result approximately equals `2π`.
**Compiler features exercised:**
- Index access
- Context-based symbol resolution and namespace management

### ExpressionTest.testVariableIndexedByASubscriptAndMultipliedByTheDefactoInput
**What it does:** Compiles `α₁*t` against a vector-valued context variable `α`, sets `α₁=π`, evaluates at `t=2`, and asserts the result approximately equals `2π`.
**Compiler features exercised:**
- Index access
- Context-based symbol resolution and namespace management

### InfinityLiteralTest.testInfinityConstantIsPositiveInfinity
**What it does:** Asserts `RealConstants.infinity` is both infinite and positive.
**Compiler features exercised:** none — tests native arb wrapper only.

### InfinityLiteralTest.testInfinityLiteralCompilesToTheConstant
**What it does:** Compiles the nullary expression `∞`, evaluates it, and asserts the result is positive infinity.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing

### InvalidateCacheTest.testInvalidateStaticCacheResetsStaticPrecision
**What it does:** Evaluates a generated inner function with a hoisted bound-parameter subtree, asserts `staticPrecision` becomes `128`, calls `invalidateCache()`, asserts it resets to `-1`, then reevaluates and asserts it returns to `128`.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### InvalidateCacheTest.testInvalidateStaticCacheProducesSameResultAtSamePrecision
**What it does:** Evaluates the same hoisted function twice at the same precision with an `invalidateCache()` call in between and asserts both results are `20`.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### InvalidateCacheTest.testInvalidateStaticCacheIsNoopWhenNothingHoisted
**What it does:** Calls `invalidateCache()` on `t + t*t`, then evaluates at `t=3` and asserts the result is `12`.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### JetDerivativeOverhaulTest.testJetCoefficientsMatchReference
**What it does:** Evaluates compiled `ϑ(t)` and the hand-coded `RiemannSiegelThetaFunction` at `t=50` to order `5`, then asserts every Taylor coefficient matches.
**Compiler features exercised:**
- Jet nodes and Taylor-series generation

### JetDerivativeOverhaulTest.testJetStateDeduplication
**What it does:** Compiles `ϑ(t)+diff(ϑ(t),t)`, walks the AST, and asserts all `JetNode`s share one `JetState` whose maximum requested coefficient is at least `1`.
**Compiler features exercised:**
- Jet nodes and Taylor-series generation

### JetDerivativeOverhaulTest.testSharedJetTwoConsumers
**What it does:** Evaluates `ϑ(t)+diff(ϑ(t),t)` at `t=50` and asserts the result matches `θ(50)+θ′(50)` computed from the reference series coefficients.
**Compiler features exercised:**
- Jet nodes and Taylor-series generation

### JetDerivativeOverhaulTest.testJetDifferentiationReadsCorrectCoefficient
**What it does:** Evaluates `diff(ϑ(t),t)` at `t=50` and asserts it equals coefficient `1` from the reference theta series.
**Compiler features exercised:**
- Jet nodes and Taylor-series generation

### JetDerivativeOverhaulTest.testTaylorSeriesPathNonJet
**What it does:** Evaluates `t^4` at `t=2` to order `5` and asserts the returned Taylor coefficients are `16, 32, 24, 8, 1`.
**Compiler features exercised:**
- Jet nodes and Taylor-series generation

### JetDerivativeOverhaulTest.testDerivativeCacheExtendsFromHighest
**What it does:** Evaluates `t^5` to orders `3` and `6`, asserts the derivative cache grows from size `3` to `6`, and asserts the second evaluation returns coefficients `1, 5, 10, 10, 5, 1`.
**Compiler features exercised:**
- Jet nodes and Taylor-series generation

### NestedFunctionalFixedPointTest.testThreeIJFactorsCollapseIntoOneComposite
**What it does:** Generates `i➔j➔x➔(i+j)*x*(i*j)*(i-j)` and asserts the innermost expression has exactly one `StaticNode` whose delegate text contains `i+j`, `i-j`, and `i*j`.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Nested functional declarations

### NestedFunctionalFixedPointTest.testXNeverInsideStaticNode
**What it does:** Asserts every hoisted subtree in the innermost expression excludes `x` and contains only variables `i` or `j`.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Nested functional declarations

### NestedFunctionalFixedPointTest.testFixedPointIsIdempotent
**What it does:** Generates the same nested functional twice, counts `StaticNode`s both times, and asserts both runs deterministically produce exactly one static node.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### NodeEqualsNoStackOverflowTest.testNodeEqualsDoesNotOverflow
**What it does:** Parses and compiles the `BUG_EXPR`, inserts every AST node into a `HashSet`, and asserts node collection completes with at least one distinct node.
**Compiler features exercised:**
- Common-subexpression elimination
- Typed expression compilation and codomain promotion

### NodeEqualsNoStackOverflowTest.testRootNodeEqualsBetweenSeparateCompilationsDoesNotOverflow
**What it does:** Compiles `BUG_EXPR` twice, compares the two root nodes with `.equals`, and asserts the comparison terminates and returns false.
**Compiler features exercised:**
- Common-subexpression elimination
- Typed expression compilation and codomain promotion

### NodeEqualsNoStackOverflowTest.testExpressionEqualsDoesNotOverflow
**What it does:** Compiles `BUG_EXPR` twice, asserts `a.equals(b)` is false and `a.equals(a)` is true, then calls `hashCode()` on both expressions.
**Compiler features exercised:**
- Common-subexpression elimination
- Typed expression compilation and codomain promotion

### ParameterInvariantHoistingTest.testParameterInvariantSubtreeIsHoistedToStaticNode
**What it does:** Generates `n➔t➔(n²+1)*sin(t)+(n-1)`, asserts the inner expression contains at least one `StaticNode`, and asserts at least one hoisted delegate text still mentions `n`.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Nested functional declarations

### ParameterInvariantHoistingTest.testParameterInvariantHoistingPreservesResults
**What it does:** Instantiates `n➔t➔(n²+1)*t+(n-1)`, evaluates the bound `n=3` function at `t=2` and `t=5`, invalidating between reused-input calls, then evaluates a fresh `n=4` function at `t=2`, asserting results `22`, `52`, and `37`.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### ParameterInvariantHoistingTest.testEvaluationVariableDoesNotCauseHoisting
**What it does:** Compiles `t + t*t`, evaluates it at `t=3`, and asserts the result is `12`.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### ParserTest.testIsLatinGreekOrSpecial
**What it does:** Asserts `Parser.isIdentifyingCharacter('Γ', false)` and `Parser.isGreekOrBlackLetter('Γ')` both return true.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing

### PolynomialInnerFunctionCacheTest.innerFunctionOnPolynomialCodomainIsValueCached
**What it does:** Evaluates a `RiccatiMuntzPadeFunctional` approximant at `0.5`, then asserts the `IndexCache` counters show the σ-table was exercised at least `100` times but fewer than `10,000` total accesses.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### RealExpressionTest.testConstantSubexpressionFactorization
**What it does:** Compiles `½*10` and asserts evaluation returns `5`.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Typed expression compilation and codomain promotion

### RealExpressionTest.testConstantSubexpressionWithVariable
**What it does:** Compiles `½*10 + t`, evaluates it at `t=1`, and asserts the result is `6`.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Typed expression compilation and codomain promotion

### RealExpressionTest.testCommonSubExpressionReuse
**What it does:** Evaluates both the original and optimized forms of `tanh(log(1+x²))/(1+x²)` at `x=2.3` and asserts both results equal `0.151143929930069`.
**Compiler features exercised:**
- Common-subexpression elimination
- Typed expression compilation and codomain promotion

### RealExpressionTest.testAddThreeConstants
**What it does:** Compiles `69 + 0.42 + 0.58`, evaluates it, and asserts the result rounds up to `70.00`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testVariableIndexedByAConstant
**What it does:** Compiles `v[3]` against a vector-valued context variable `v` and asserts evaluation returns the third stored component `v3`.
**Compiler features exercised:**
- Index access
- Context-based symbol resolution and namespace management

### RealExpressionTest.testAddTwoConstants
**What it does:** Compiles `69 + 0.42`, evaluates it, and asserts the result rounds up to `69.42`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testBesselFunctionVariableIndex
**What it does:** Compiles `t->J(k,t)` with `k=3`, evaluates at `t=1`, and asserts the result matches `0.01956335398266840591890532162175150825451`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Context-based symbol resolution and namespace management

### RealExpressionTest.testBesselFunction
**What it does:** Compiles `J₀(t)`, evaluates at `t=1`, and asserts the result is `0.7651976865579666`.
**Compiler features exercised:**
- Built-in function and special-function nodes

### RealExpressionTest.testNegativeInput
**What it does:** Compiles `-t`, evaluates it at `t=1`, and asserts the result is `-1`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes

### RealExpressionTest.testConstant
**What it does:** Compiles `69.42`, evaluates it, and asserts the result is `69.42`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RealExpressionTest.testHalf
**What it does:** Compiles `½*10`, evaluates it, and asserts the result is `5`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Typed expression compilation and codomain promotion

### RealExpressionTest.testFullyStaticEvaluateWritesResultArgument
**What it does:** Compiles `w:t➔p+q` with context values `p=3` and `q=4`, evaluates into a caller-supplied `Real`, and asserts that object is written with `7`.
**Compiler features exercised:**
- Static hoisting and cache invalidation
- Bytecode generation and class loading

### RealExpressionTest.testDivideConstants
**What it does:** Compiles `42 ÷ 6`, evaluates it, and asserts the result is `7`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testFunctionInvolvingABesselFunction
**What it does:** Compiles `a-b*J0(λ*t)` in the prepared context, evaluates at `t=1`, and asserts the result is `0.23480231344203345`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Context-based symbol resolution and namespace management

### RealExpressionTest.testFunctionOfAConstant
**What it does:** Compiles `tanh(2)`, evaluates it, and asserts the result rounds up to `0.9640275800758169`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testFunctionOfAConstantPlusAConstant
**What it does:** Compiles `tanh(1+1)`, evaluates it, and asserts the result rounds up to `0.9640275800758169`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Arithmetic and algebraic operator nodes

### RealExpressionTest.testFunctionOfInputPlusAConstant
**What it does:** Compiles `tanh(t+1)`, evaluates it at `t=1` and `t=-1`, and asserts the results are `0.9640275800758169` and `0`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testFunctionOfVariablePlusAConstant
**What it does:** Compiles `tanh(y+1)` against the prepared context and asserts evaluation returns `0.9950547536867305`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Context-based symbol resolution and namespace management

### RealExpressionTest.testFunctionOfVariablePlusAVariable
**What it does:** Compiles `tanh(y+z)` against the prepared context, evaluates it, and asserts the result is `0.7615941559557649`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Context-based symbol resolution and namespace management

### RealExpressionTest.testHyperbolicTangentOfAVariable
**What it does:** Compiles `tanh(y)` against the prepared context, evaluates it, and asserts the result rounds up to `0.9640275800758169`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Context-based symbol resolution and namespace management

### RealExpressionTest.testIdentityInput
**What it does:** Compiles `t`, evaluates it at `1`, and asserts the result is `1`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### RealExpressionTest.testInputRaisedToThe5thPowerWithBetterLookingUnicodeSymbols
**What it does:** Compiles `y⁵`, evaluates it at `2` and `3` using the same result object, and asserts the returned values are `32` and `243` while reusing that object.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Bytecode generation and class loading

### RealExpressionTest.testInputSquared
**What it does:** Compiles `y^2`, evaluates it at `2` and `3` using the same result object, and asserts the values are `4` and `9`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Bytecode generation and class loading

### RealExpressionTest.testInputSquaredPlusOne
**What it does:** Compiles `y^2+1`, evaluates it at `2` and `3` using the same result object, and asserts the values are `5` and `10`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Bytecode generation and class loading

### RealExpressionTest.testInputSquaredWithBetterLookingUnicodeSymbols
**What it does:** Compiles `y²`, evaluates it at `2` and `3` using the same result object, and asserts the values are `4` and `9`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Bytecode generation and class loading

### RealExpressionTest.testLogOnePlusInputSquared
**What it does:** Compiles `ln(t^2+1)`, evaluates it twice at `t=1` and once at `t=0.5` using the same result object, and asserts the values are `0.6931471805599453`, `0.6931471805599453`, and `0.22314355131420976`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Bytecode generation and class loading

### RealExpressionTest.testMultiplyConstants
**What it does:** Compiles `6 × 7`, evaluates it, and asserts the result rounds up to `42`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testOnePlusInputSquared
**What it does:** Compiles `1+t^2`, evaluates it at `1`, `2`, and `0.5` using the same result object, and asserts the values are `2`, `5`, and `1.25`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Bytecode generation and class loading

### RealExpressionTest.testOnePlusInputOver2PlusZero
**What it does:** Compiles `1+i/2+0`, evaluates it in-place on a `Real` initially set to `2` and then reset to `4`, and asserts the results are `2` and `3`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testRaiseConstantToAConstantPower
**What it does:** Compiles `5^2` with extra whitespace, evaluates it, and asserts the result rounds up to `25`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testPi
**What it does:** Compiles `π`, evaluates it, and asserts the result equals `RealConstants.π`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing

### RealExpressionTest.testSFunction
**What it does:** Compiles `tanh(ln(1+t^2))`, evaluates it at `t=1` and `t=0` using the same result object, and asserts the values are `0.6` and `0`.
**Compiler features exercised:**
- Functional application and reified function evaluation
- Bytecode generation and class loading

### RealExpressionTest.testSFunctionWithGreekInputSplitIntoTwoFunctions
**What it does:** Registers `yay:1+ρ^2` in a context, compiles `x->tanh(ln(yay(x)))`, evaluates it at `x=1`, and asserts the result is `0.6`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Unicode surface syntax and literal parsing

### RealExpressionTest.testSFunctionWithGreekInput
**What it does:** Compiles `tanh(ln(1+ρ^2))` against the prepared context, evaluates it, and asserts the result is `0.6`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Context-based symbol resolution and namespace management

### RealExpressionTest.testSFunctionWithVar
**What it does:** Compiles `tanh(ln(1+y^2))` against the prepared context, evaluates it, and asserts the result is `0.9230769230769231`.
**Compiler features exercised:**
- Functional application and reified function evaluation
- Context-based symbol resolution and namespace management

### RealExpressionTest.testOnePlusTwoPlusThree
**What it does:** Compiles the nullary expression `1+(2)+(3)`, evaluates it, and asserts the result rounds up to `6`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testSquareRootOfTwentyFive
**What it does:** Compiles `√(25)`, evaluates it, and asserts the result rounds up to `5`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testSubtractConstants
**What it does:** Compiles `70 - 0.58`, evaluates it, and asserts the result rounds up to `69.42`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### RealExpressionTest.testTanhLogOne
**What it does:** Compiles `tanh(ln(1))`, evaluates it into a caller-supplied result object, and asserts that object is zero.
**Compiler features exercised:**
- Functional application and reified function evaluation
- Bytecode generation and class loading

### RealExpressionTest.testVariable
**What it does:** Compiles `x` against the prepared context, evaluates it into a caller-supplied result object, and asserts the value is `1000000`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Bytecode generation and class loading

### RealExpressionTest.testcontextquared
**What it does:** Compiles `y^2` against the prepared context, evaluates it, and asserts the result rounds up to `4`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Context-based symbol resolution and namespace management

### RealExpressionTest.testVariableToThePowerOfOneMinusAVariable
**What it does:** Compiles `r^(1-α)` against the prepared context, evaluates it, and asserts the result is `1.2276839790698644`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Context-based symbol resolution and namespace management

### RecompileAfterContextChangeTest.testInjectReferencesAfterResetClassLoaderAndRecompile
**What it does:** Compiles a complex `pFq`-containing expression, mutates context variable `m`, recompiles with `resetClassLoader()`, injects references into the new instance, and asserts the new function can still render without throwing.
**Compiler features exercised:**
- Bytecode generation and class loading
- Context-based symbol resolution and namespace management

### RecurrentSequenceStressTest.directFormula
**What it does:** Compiles `f:n➔n+1`, evaluates `f(50)`, and asserts the run completes in under `200ms`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation

### RecurrentSequenceStressTest.selfRecursive
**What it does:** Compiles `f:n➔when(n=0,0,else,f(n-1)+1)`, evaluates `f(50)`, and asserts total `IndexCache` lookups stay below `10,000`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation
- Static hoisting and cache invalidation

### RecurrentSequenceStressTest.mutualPair
**What it does:** Declares mutually recursive `f` and `g`, evaluates `f(40)`, and asserts total `IndexCache` lookups stay below `10,000`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation

### RecurrentSequenceStressTest.mutualTriple
**What it does:** Declares mutually recursive `a`, `b`, and `c`, evaluates `a(30)`, and asserts total `IndexCache` lookups stay below `10,000`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation

### RecurrentSequenceStressTest.mutualQuadruple
**What it does:** Declares mutually recursive `w`, `x`, `y`, and `z`, evaluates `w(25)`, and asserts total `IndexCache` lookups stay below `10,000`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation

### RecurrentSequenceStressTest.threeTermRecurrence
**What it does:** Compiles `f:n➔when(n=0,1,n=1,1,else,f(n-1)+f(n-2))`, evaluates `f(80)`, and asserts total `IndexCache` lookups stay below `50,000`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation
- Static hoisting and cache invalidation

### RecurrentSequenceStressTest.selfReferentialPlusMutual
**What it does:** Declares `p` and `q` where each depends on itself and the other, evaluates `p(40)`, and asserts total `IndexCache` lookups stay below `20,000`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation

### RecurrentSequenceStressTest.twoIndependentPairsInSameContext
**What it does:** Declares two independent mutually recursive pairs `(a,b)` and `(c,d)` in one context, evaluates `c(30)`, and asserts total `IndexCache` lookups stay below `10,000`.
**Compiler features exercised:**
- Recursive and mutually recursive compilation

### RepeatedBoundVariableToStringTest.testRepeatedUpstreamVariableToStringDoesNotThrow
**What it does:** Instantiates `n➔t➔n*t+n*t+n`, binds `n=5`, calls `toString()` on the inner function, and asserts the rendered text is non-null and contains `5`.
**Compiler features exercised:**
- Nested functional declarations

### SelfRecursiveSequenceInSumTest.testRecursionInsideSumOperand
**What it does:** Compiles `d:n➔when(n=0,1,n<3,0,else,(1/n)*Σk➔k*d(n-k){k=3..n})`, evaluates `d(3)`, and asserts it equals `1` within the provided tolerance.
**Compiler features exercised:**
- Recursive and mutually recursive compilation
- Summation and product operators

### SharedNodeStaticHoistingTest.testSharedSubtreeWithBuriedStaticNodeEvaluatesWithoutNaN
**What it does:** Compiles `ceil(√(t/(2*π)))`, `floor(√(t/(2*π)))`, and their difference, evaluates them at `t=55.3`, and asserts the first two are `3` and `2` while the difference is finite and equal to `1`.
**Compiler features exercised:**
- Common-subexpression elimination
- Static hoisting and cache invalidation

### SharedNodeStaticHoistingTest.testSharedSubtreeWithBuriedStaticNodeWithoutSquareRoot
**What it does:** Compiles `ceil(t/(2*π))-floor(t/(2*π))`, evaluates it at `55.3`, and asserts the result is finite and equal to `1`.
**Compiler features exercised:**
- Common-subexpression elimination
- Static hoisting and cache invalidation

### SharedNodeTest.testSharedNodeInsertedForRepeatedSubexpression
**What it does:** Optimizes `tanh(log(1+x²))/(1+x²)` and asserts the repeated subexpression `1+x²` is wrapped by exactly two `SharedNode`s: one canonical and one reference.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testSharedNodesShareFieldName
**What it does:** Optimizes `tanh(log(1+x²))/(1+x²)` and asserts the two `SharedNode`s for `1+x²` share the same generated field name.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testCanonicalDelegateIsTheCommonSubexpression
**What it does:** Optimizes `tanh(log(1+x²))/(1+x²)` and asserts the canonical `SharedNode` delegate text still represents the common subexpression `1+x²`.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testDenominatorIsReferenceSharedNode
**What it does:** Optimizes `tanh(log(1+x²))/(1+x²)` and asserts the division node’s denominator child is a non-canonical `SharedNode`.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testNumeratorContainsCanonicalSharedNode
**What it does:** Optimizes `tanh(log(1+x²))/(1+x²)` and asserts the argument passed to `log` inside the numerator is a canonical `SharedNode`.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testNoSharedNodesWhenNoCommonSubexpressions
**What it does:** Optimizes `sin(x) + cos(x)` and asserts the resulting AST contains no `SharedNode`s.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testTripleOccurrenceProducesOneCanonicalTwoReferences
**What it does:** Optimizes `sin(x²)+cos(x²)+tan(x²)` and asserts the three repeated `x²` occurrences become one canonical and two reference `SharedNode`s sharing one field name.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testOptimizedExpressionProducesCorrectResult
**What it does:** Evaluates original and optimized forms of `tanh(log(1+x²))/(1+x²)` at six sample points and asserts every pair of results matches.
**Compiler features exercised:**
- Common-subexpression elimination
- Typed expression compilation and codomain promotion

### SharedNodeTest.testTripleOccurrenceNumericalCorrectness
**What it does:** Evaluates original and optimized forms of `sin(x²)+cos(x²)+tan(x²)` at four sample points and asserts every pair of results matches.
**Compiler features exercised:**
- Common-subexpression elimination
- Typed expression compilation and codomain promotion

### SharedNodeTest.testTwoDistinctCommonSubexpressions
**What it does:** Optimizes `sin(x²)*cos(x³)+sin(x²)-cos(x³)` and asserts the collected `SharedNode`s expose at least two distinct generated field names.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testFunctionCallNodesAreCsed
**What it does:** Optimizes `sin(x²)*cos(x³)+sin(x²)-cos(x³)` and asserts there are `SharedNode` groups whose delegates render exactly `sin(x^2)` and `cos(x^3)`.
**Compiler features exercised:**
- Common-subexpression elimination

### SharedNodeTest.testLeafNodesAreNotWrapped
**What it does:** Optimizes `x+x+x` and asserts no `SharedNode`s are inserted for the repeated leaf variable.
**Compiler features exercised:**
- Common-subexpression elimination
- Static hoisting and cache invalidation

### SigmaTableCacheEfficiencyTest.testCacheHitsDetectExponentialRecomputation
**What it does:** Evaluates a `RiccatiMuntzPadeFunctional` approximant at `0.5`, then asserts total σ-table cache accesses are at least `100` and fail if they exceed `10,000`.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### TypeStringTest.testLeafTypeString
**What it does:** Parses `x➔x^2`, calls `typeString()`, and asserts it returns `RealFunction:x=Real➔Real`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing

### TypeStringTest.testNestedFunctionalTypeString
**What it does:** Parses `t➔x➔t+3*x+x^2`, calls `typeString()`, and asserts it returns `RealFunctional:t=Real➔(RealFunction:x=Real➔Real)`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Nested functional declarations

### Npe1046Test.testEvaluateDΦReproducesNpe1046
**What it does:** Manually registers all variables and generated function instances for the decompiled `dΦ` closure, injects references into each instance, evaluates `dΦ`, and wraps any `NullPointerException` or `AssertionError` in a failing `AssertionError` annotated as issue `#1046` reproduction.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Bytecode generation and class loading

### CaputoFractionalDerivativeNodeTest.testFracdiffParserConstructorDoesNotNPE
**What it does:** Compiles `fracdiff(sin(t),t^½)`, asserts the function instance is non-null, and checks the value at `t=1` is `0.8460567867240202` within `1e-6`.
**Compiler features exercised:**
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testFracdiffTwiceOnSameContextDoesNotThrow
**What it does:** Builds `Đ^(α)(t)` and then `Đ^(α)(t²)` in the same context with `α=0.5`, asserts both compile, and checks their numeric values at `t=1` and `t=2` against the closed forms.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testFracdiffOfNamedContextualFunctionDoesNotInfinitelyRecurse
**What it does:** Registers `P:v->-(v^2)/2`, then tries to compile `Đ^(α)(P(t))` and only fails the test if compilation throws `StackOverflowError` or `NullPointerException`.
**Compiler features exercised:**
- Symbolic differentiation
- Context-based symbol resolution and namespace management

### CaputoFractionalDerivativeNodeTest.testFracdiffOfUnnamedFunctionThrowsInsteadOfInfiniteRecurse
**What it does:** Compiles `Đ^(α)(sin(t)+t)` in a context with `α=0.5` and only fails if a `StackOverflowError` occurs.
**Compiler features exercised:**
- Fractional calculus
- Symbolic differentiation

### CaputoFractionalDerivativeNodeTest.testFracdiffOfContextualFunction
**What it does:** Registers `P:v->-(v^2)/2`, compiles `fracdiff(P(v),v^½)`, and checks the value at `v=2` equals `-8√2/(3√π)` within `1e-6`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testParseFractionalDerivativeFunctionForm
**What it does:** Parses `fracdiff(sin(t),t^2)` and asserts its normalized string form is `t➔Đ^(2)sin(t)`.
**Compiler features exercised:**
- Fractional calculus
- Unicode surface syntax and literal parsing

### CaputoFractionalDerivativeNodeTest.testFractionalDerivativeFunctionForm2
**What it does:** Registers `α`, parses `t➔α➔fracdiff(sin(t),t^α)`, and asserts the rendered form is `t➔Đ^(α)sin(t)`.
**Compiler features exercised:**
- Nested functional declarations
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testFractionalDerivativeFunctionForm3
**What it does:** Registers `β`, parses `t➔β➔fracdiff(sin(t),t^β)`, and asserts the rendered form is `t➔Đ^(β)sin(t)`.
**Compiler features exercised:**
- Nested functional declarations
- Symbolic differentiation

### CaputoFractionalDerivativeNodeTest.testSubstituteInSumPreservesTreeIntegrity
**What it does:** Compiles `Đ^(α)(t)+t` with `α=0.5` and checks the value at `t=1` equals `2/√π + 1` within `1e-10`.
**Compiler features exercised:**
- Fractional calculus
- Context-based symbol resolution and namespace management

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOfConstantIsZero
**What it does:** Compiles `Đ^(α)(5)` with `α=0.5` and asserts evaluation at `t=1` is exactly `0` within `1e-10`.
**Compiler features exercised:**
- Fractional calculus
- Context-based symbol resolution and namespace management

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOfVariable
**What it does:** Compiles `Đ^(α)(t)` with `α=0.5` and checks the value at `t=1` equals `2/√π` within `1e-10`.
**Compiler features exercised:**
- Fractional calculus
- Typed expression compilation and codomain promotion

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOfTSquared
**What it does:** Compiles `Đ^(α)(t²)` with `α=0.5` and checks the value at `t=2` against `(8/(3√π))*2^(3/2)` within `1e-10`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOfTCubed
**What it does:** Compiles `Đ^(α)(t³)` with `α=0.5` and checks the value at `t=1` equals `16/(5√π)` within `1e-10`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOfConstantTimesMonomial
**What it does:** Compiles `Đ^(α)(3*t²)` with `α=0.5` and checks the value at `t=2` against the scaled closed form within `1e-10`.
**Compiler features exercised:**
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOfConstantTimesMonomialWithoutAlphaVariableNameConflict
**What it does:** Compiles `Đ^(β)(3*t²)` with `β=0.5` and checks the value at `t=2` against the same closed form used for the `α` case.
**Compiler features exercised:**
- Symbolic differentiation
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOfSum
**What it does:** Compiles `Đ^(α)(t+t²)` with `α=0.5` and checks the value at `t=1` equals `2/√π + 8/(3√π)` within `1e-10`.
**Compiler features exercised:**
- Fractional calculus
- Summation and product operators

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOrderOneMatchesOrdinaryDerivativeAltSyntax
**What it does:** Compiles `ꟲD^(α)(t³)` with `α=1.0` and asserts the value at `t=2` is `12`.
**Compiler features exercised:**
- Fractional calculus
- Symbolic differentiation

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOrderOneMatchesOrdinaryDerivative
**What it does:** Compiles `Đ^(α)(t³)` with `α=1.0` and asserts the value at `t=2` is `12`.
**Compiler features exercised:**
- Fractional calculus
- Symbolic differentiation

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOrderOneQuarter
**What it does:** Compiles `Đ^(α)(t)` with `α=0.25` and checks the value at `t=1` equals `1/Γ(7/4)` within `1e-10`.
**Compiler features exercised:**
- Fractional calculus

### CaputoFractionalDerivativeNodeTest.testCaputoDerivativeOrderThreeQuarters
**What it does:** Compiles `Đ^(α)(t²)` with `α=0.75` and checks the value at `t=1` equals `2/Γ(9/4)` within `1e-10`.
**Compiler features exercised:**
- Fractional calculus

### DerivativeNodeTest.test2ndDerivative
**What it does:** Verifies that `diff(sin(t),t)` renders like `cos(t)` and that both `diff(diff(sin(t),t),t)` and `diff(sin(t),t²)` render like `-sin(t)`.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testFirstDerivativeViaCombiningDotAboveCharacter
**What it does:** Registers `θ`, compiles `Nθ:t➔t-θ̇(t)`, and evaluates it at `2.3` without asserting a numeric value.
**Compiler features exercised:**
- Symbolic differentiation
- Context-based symbol resolution and namespace management

### DerivativeNodeTest.testFirstDerivativeWithFunctionFormOfDerivative
**What it does:** Registers `θ`, compiles `Nθ:t➔t-θ(t)/diff(θ(t),t)`, evaluates at `2.3`, and asserts the result is `-2.9960711222608554`.
**Compiler features exercised:**
- Symbolic differentiation
- Context-based symbol resolution and namespace management

### DerivativeNodeTest.testSecondDerivativeViaCombiningTwoDotsAboveCharacter
**What it does:** Registers `θ`, compiles `Nθ̇:t➔t-θ̇(t)/θ̈(t)`, evaluates at `2.3`, and asserts the result is not `NaN`.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testEvaluateDerivativeOfTheRealRiemannSiegelThetaFunction
**What it does:** Compiles `ϑ(t)`, calls `.derivative()`, evaluates at `1`, and asserts the derivative is `-1.0125730965517337`.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testDerivativeOfTheLogarithmicGammaFunction
**What it does:** Compiles `diff(lnΓ(x),x)`, evaluates at `2.3`, and asserts the value is `0.6000398803639695`.
**Compiler features exercised:**
- Symbolic differentiation
- Built-in function and special-function nodes

### DerivativeNodeTest.testSquareRootDerivative
**What it does:** Parses `diff(sqrt(x),x)` and asserts its root-node string matches `1/(sqrt(x)*2)`.
**Compiler features exercised:**
- Symbolic differentiation
- Unicode surface syntax and literal parsing

### DerivativeNodeTest.testCosineDerivativeSimplerSyntax
**What it does:** Parses `diff(cos(x),x)` and asserts its root-node string matches `-sin(x)`.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testGammaDerivative
**What it does:** Parses `∂Γ(x)/∂x` and asserts its root-node string matches `Γ(x)*digamma(x)`.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testHyperbolicSineDerivative
**What it does:** Parses `∂sinh(x)/∂x` and asserts its root-node string matches `cosh(x)`.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testHyperbolicCosineDerivative
**What it does:** Parses `∂cosh(x)/∂x` and asserts its root-node string matches `sinh(x)`.
**Compiler features exercised:**
- Symbolic differentiation
- Unicode surface syntax and literal parsing

### DerivativeNodeTest.testRealCotangentDerivative
**What it does:** Compiles `∂cot(x)/∂x` and `(-1)-cot(x)^2`, evaluates both at `2.3`, and asserts the numeric results are equal.
**Compiler features exercised:**
- Symbolic differentiation
- Typed expression compilation and codomain promotion

### DerivativeNodeTest.testComplexCotangentDerivative
**What it does:** Compiles complex `∂cot(x)/∂x` and `(-1)-cot(x)^2`, evaluates both at `2.3`, and asserts the complex results are equal.
**Compiler features exercised:**
- Symbolic differentiation
- Typed expression compilation and codomain promotion

### DerivativeNodeTest.testComplexCotangentDerivativeFuncSyntax
**What it does:** Compiles complex `diff(cot(x),x)` and `(-1)-cot(x)^2`, evaluates both at `2.3`, and asserts the complex results are equal.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testCosecantDerivative
**What it does:** Parses `∂csc(x)/∂x` and asserts its root-node string matches `(-csc(x))*cot(x)`.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testSecantDerivative
**What it does:** Parses `∂sec(x)/∂x` and asserts its root-node string matches `sec(x)*tan(x)`.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testTanhDerivative
**What it does:** Parses `∂tanh(x)/∂x` and asserts its root-node string matches `1-tanh(x)²`.
**Compiler features exercised:**
- Symbolic differentiation
- Unicode surface syntax and literal parsing

### DerivativeNodeTest.testArcSinDerivative
**What it does:** Parses and simplifies `∂arcsin(x)/∂x`, parses and simplifies `1/√(1-x^2)`, and asserts the simplified root-node strings match.
**Compiler features exercised:**
- Symbolic differentiation

### DerivativeNodeTest.testRealFunctionDerivative
**What it does:** Parses `x->a*x+b*x²+c*x³` with context variables `a=2`, `b=4`, `c=6`, replaces the root node with its simplified derivative, instantiates, evaluates at `2.3`, and asserts `115.61999999999998`.
**Compiler features exercised:**
- Symbolic differentiation
- Context-based symbol resolution and namespace management

### ErrorFunctionDerivativeTest.testErfDerivative
**What it does:** Compiles `diff(erf(x),x)` and `2*exp(-x²)/sqrt(π)` and asserts their balls overlap at `x=7/10`.
**Compiler features exercised:**
- Symbolic differentiation
- Symbolic integration

### ErrorFunctionDerivativeTest.testErfcDerivative
**What it does:** Compiles `diff(erfc(x),x)` and `-2*exp(-x²)/sqrt(π)` and asserts their balls overlap at `x=-3/2`.
**Compiler features exercised:**
- Symbolic differentiation
- Typed expression compilation and codomain promotion

### ErrorFunctionDerivativeTest.testErfiDerivative
**What it does:** Compiles `diff(erfi(x),x)` and `2*exp(x²)/sqrt(π)` and asserts their balls overlap at `x=1/3`.
**Compiler features exercised:**
- Symbolic differentiation
- Symbolic integration

### ErrorFunctionDerivativeTest.testErfcChainRule
**What it does:** Compiles `diff(erfc(3*x+1),x)` and `-6*exp(-(3*x+1)²)/sqrt(π)` and asserts their balls overlap at `x=2/5`.
**Compiler features exercised:**
- Symbolic differentiation

### ErrorFunctionDerivativeTest.testErfcSecondSymbolicOrder
**What it does:** Compiles `diff(erfc(x),x^(2))` and `4*x*exp(-x²)/sqrt(π)` and asserts their balls overlap at `x=9/8`.
**Compiler features exercised:**
- Symbolic differentiation

### ErrorFunctionDerivativeTest.testErfAtZeroDerivativeIsTwoOverSqrtPi
**What it does:** Evaluates `diff(erf(x),x)` at zero and `2/sqrt(π)` as a nullary function, then asserts the resulting balls overlap.
**Compiler features exercised:**
- Symbolic differentiation
- Typed expression compilation and codomain promotion

### FractionalDerivativeNodeTest.testRealFunctionSequenceOfFixedFractionalMonomialDerivative
**What it does:** Compiles `n->t->fracdiff(t^n,t^½)`, applies `n=3`, evaluates at `t=2.3`, and asserts `14.484203969691649` within `1e-6`.
**Compiler features exercised:**
- Fractional calculus
- Nested functional declarations

### FubiniExchangeTest.testDirectNestingConstantBoundsIsExchangeable
**What it does:** Parses `x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)`, simplifies it, and asserts the root node remains non-null.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testStructuralExchangeabilityDirectNesting
**What it does:** Parses directly nested constant-bound integrals, asserts the outer and inner nodes are integrals, and asserts `outer.isStructurallyExchangeableWith(inner)`.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testAnalyticValidityFiniteBounds
**What it does:** Parses the same nested constant-bound integrals and asserts `outer.isAnalyticallyValidToExchangeWith(inner)`.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testNonNegativeSquare
**What it does:** Parses `x^2` and asserts the root node reports itself as provably non-negative.
**Compiler features exercised:**
- Symbolic integration
- Arithmetic and algebraic operator nodes

### FubiniExchangeTest.testNonNegativeExponential
**What it does:** Parses `exp(x)` and asserts the root node reports itself as provably non-negative.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testNonNegativeProduct
**What it does:** Parses `x^2*exp(x)` and asserts the root node reports itself as provably non-negative.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testExchangeOrderProducesSwappedStructure
**What it does:** Parses directly nested integrals, calls `outer.exchangeOrder(inner)`, and asserts the inner node becomes the root position while both variables and parent links are preserved as expected.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testFindExchangeableInnerIntegral
**What it does:** Parses directly nested integrals, calls `findExchangeableInnerIntegral()`, and asserts it returns the direct inner integral.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testHasFiniteConstantBounds
**What it does:** Parses `x➔∫y➔exp(y)dy∈(0,1)`, asserts the root is an integral, and asserts `hasFiniteConstantBounds()` is true.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testParentPointersSetDuringParsing
**What it does:** Parses directly nested integrals and asserts the inner integral's parent is the outer integral and the inner integrand's parent is the inner integral.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testIsLinearPathDirectNesting
**What it does:** Parses directly nested integrals and asserts `Node.isLinearPath(...)` returns true for the outer-to-inner path.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testAlphaConvert
**What it does:** Parses `x➔∫y➔(y*x)dy∈(0,1)`, asserts the integrand initially references `y`, runs `alphaConvert("y", "y′")`, then asserts only `y′` remains.
**Compiler features exercised:**
- Symbolic integration

### FubiniExchangeTest.testFreshVariableName
**What it does:** Asserts `Node.freshVariableName("x")` yields `x′` and `Node.freshVariableName("x′")` yields `x′′`.
**Compiler features exercised:**
- Symbolic integration

### HeavisideProductDerivativeTest.testHeavisideProductDerivativeKeepsSiblingUnsifted
**What it does:** Registers `a`, `f(w)=exp(w²/4)`, and compares `diff(θ(w-a)*f(w),w)` against `δ(w-a)*f(a)+θ(w-a)*exp(w²/4)*w/2` by ball overlap at `w=12/5` and `w=1/2`.
**Compiler features exercised:**
- Symbolic differentiation
- Symbolic integration

### HeavisideProductDerivativeTest.testSchwingerGaussErfcDerivative
**What it does:** Builds contextual functions `g`, `z`, and `E`, differentiates `E(w)`, and asserts overlap with the hand-expanded reference derivative at `w=12/5` and `w=3/4`.
**Compiler features exercised:**
- Symbolic differentiation
- Symbolic integration

### IndexAccessNodeTest.testIndexAccessOfRealPolynomial
**What it does:** Registers a real polynomial `p=3*x^2+x`, accesses coefficients through `p[i]` and `P()[2]`, and asserts `P()[2]` evaluates to `3.0`.
**Compiler features exercised:**
- Index access

### IndexAccessNodeTest.testIndexAccessOfComplexPolynomial
**What it does:** Registers a complex polynomial `p=3*x^2+x`, accesses coefficients through `p[i]` and `P()[2]`, and asserts the coefficient has real part `3.0` and imaginary part `0.0`.
**Compiler features exercised:**
- Index access

### IntegralNodeTest.testIntegral
**What it does:** Registers `w:1/√(1-λ²)`, compiles `t➔∫s➔w(s)ds∈{-1..t}`, and asserts the value at `t=1` is `π`.
**Compiler features exercised:**
- Symbolic integration

### IntegralNodeTest.testSincIntegral
**What it does:** Compiles `y➔∫x➔exp(-I*x*y)dx∈{-1..1}`, evaluates it at `y=1` and `y=2`, and asserts the complex results differ.
**Compiler features exercised:**
- Symbolic integration

### IntegralNodeTest.testDefiniteIntegralOfSquareRoot
**What it does:** Compiles `x➔∫y➔1/sqrt(1-y^2)dy∈(-1,x)`, evaluates at `x=0.75`, and asserts it matches `arcsin(x)+π⁄2` at the same point.
**Compiler features exercised:**
- Symbolic integration

### IntegralNodeTest.testDefiniteIntegralOfSquareRootStringRepresentation
**What it does:** Compiles `x➔∫y➔1/sqrt(1-y^2)dy∈(-1,x)` and asserts its rendered form matches `arcsin(x)-arcsin(-1)`.
**Compiler features exercised:**
- Symbolic integration

### IntegralNodeTest.testIntegralOfSquareRootToo
**What it does:** Compiles the indefinite integral `∫y➔1/sqrt(1-y^2)dy`, evaluates at `0.75`, and asserts it matches `arcsin(y)` evaluated at `0.75`.
**Compiler features exercised:**
- Symbolic integration

### IntegralNodeTest.testBothWaysOfSpecifyingTheFunctionName
**What it does:** Compiles `f:arcsin(y)` and `f` with separate expression `arcsin(y)` and asserts both render identically.
**Compiler features exercised:**
- Nested functional declarations

### IntegralNodeTest.testStringRepresentationOfIntegralOfSquareRoot
**What it does:** Compiles named `f` as `∫y➔1/sqrt(1-y^2)dy`, evaluates it, and asserts its rendered form matches named `f` compiled from `arcsin(y)`.
**Compiler features exercised:**
- Symbolic integration

### IntegralNodeTest.testIntegralOfSquareRoot
**What it does:** Compiles `1/sqrt(1-x^2)` and `diff(arcsin(x),x)`, asserts their string forms match, and asserts both evaluate equally at `x=0.75`.
**Compiler features exercised:**
- Symbolic integration
- Symbolic differentiation

### IntegralNodeTest.testGetElementOfAsequence
**What it does:** Registers a shifted Jacobi sequence `P`, compiles `P(3)`, and asserts the evaluated polynomial equals `P.evaluate(3, 128)`.
**Compiler features exercised:**
- Index access
- Typed expression compilation and codomain promotion

### IntegralNodeTest.testJacobiPolynomialSquared
**What it does:** Registers shifted Jacobi polynomials, compiles `P(3)^2`, evaluates the polynomial, and asserts its exact expanded form.
**Compiler features exercised:**
- Index access
- Typed expression compilation and codomain promotion

### IntegralNodeTest.testIntegralOfAElementOfAContextualSequence
**What it does:** Registers a Jacobi sequence `P`, compiles `int(P(3)(x),x=-1...1)`, evaluates it, and asserts the result is zero.
**Compiler features exercised:**
- Symbolic integration
- Typed expression compilation and codomain promotion

### IntegralNodeTest.testAnotherIntegralOfASequenceAnotherWay
**What it does:** Registers `P`, evaluates `P4:P(4)`, calls `.integral()` on the resulting polynomial, and asserts the exact antiderivative polynomial string.
**Compiler features exercised:**
- Index access
- Typed expression compilation and codomain promotion

### IntegralNodeTest.testAnotherIntegralOfASequence
**What it does:** Registers `P`, compiles `int(P4(x),x)` after injecting `P4`, evaluates the resulting polynomial, and asserts the exact antiderivative string.
**Compiler features exercised:**
- Symbolic integration
- Context-based symbol resolution and namespace management

### IntegralNodeTest.testAnotherToo
**What it does:** Evaluates the integral of `P.evaluate(3,128)` directly, checks the antiderivative at `1` and `-1`, and asserts both are negative and equal to `-0.15625`.
**Compiler features exercised:**
- Symbolic integration

### IntegralNodeTest.testFunctionOfPolynomialElementOfAContextualSequence
**What it does:** Registers `P`, parses `P(3)(0.75)`, instantiates it, evaluates it, and asserts the value is `-0.17578125`.
**Compiler features exercised:**
- Functional application and reified function evaluation
- Context-based symbol resolution and namespace management

### IntegralNodeTest.testIntegralOfAnElementOfAContextualSequenceSquared2
**What it does:** Registers `P`, compiles `int((P(3)^2)(x),x)`, evaluates the antiderivative polynomial, computes `A(1)-A(-1)`, and asserts `0.09486607142857142`.
**Compiler features exercised:**
- Symbolic integration

### IntegralNodeTest.testIntegralOfAnElementOfAContextualSequenceSquared
**What it does:** Registers `P`, compiles `int((P(3)^2)(x),x=-1..1)`, evaluates it, and asserts `0.09486607142857142`.
**Compiler features exercised:**
- Symbolic integration
- Context-based symbol resolution and namespace management

### IntegralNodeTest.testIntegralProgrammerSyntax
**What it does:** Compiles `int(x,x=2..4)`, evaluates it, and asserts the result string is `6`.
**Compiler features exercised:**
- Symbolic integration

### LimitNodeTest.testLimitSubstitutesBoundVariableAtThePoint
**What it does:** Registers `t`, compiles `x➔lim(x+t,t=2)`, evaluates at `x=3`, and asserts the result is `5`.
**Compiler features exercised:**
- Limit evaluation
- Context-based symbol resolution and namespace management

### LimitNodeTest.testLimitOfExpressionIndependentOfBoundVariableReturnsOperand
**What it does:** Registers `t`, compiles `x➔lim(1+x,t=0)`, evaluates at `x=2.3`, and asserts the result is `3.3`.
**Compiler features exercised:**
- Limit evaluation
- Typed expression compilation and codomain promotion

### LiteralConstantTest.testPi
**What it does:** Compiles `pi` as a real nullary function and asserts its value equals `RealConstants.π`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Typed expression compilation and codomain promotion

### LiteralConstantTest.testRationalNullaryOneHalfMinusXOver2
**What it does:** Compiles rational nullary `1/2`, evaluates into a `RationalFunction`, and asserts the rendered result is `1/2`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing
- Typed expression compilation and codomain promotion

### LiteralConstantTest.testThreeEightsPlusOneEight
**What it does:** Compiles rational nullary `3/8+1/8`, evaluates into a `RationalFunction`, and asserts the simplified result is `1/2`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Typed expression compilation and codomain promotion

### NumericalIntegralNodeContextTest.testOuterFreeVariableInIntegrand
**What it does:** Compiles `x➔nint(t➔sin(x*t), t=0…π)`, evaluates at `x=1` and `x=2`, and asserts the results are approximately `2` and `0`.
**Compiler features exercised:**
- Numerical integration

### NumericalIntegralNodeContextTest.testRepeatedEvaluatesRebindGrid
**What it does:** Re-evaluates `x➔nint(t➔sin(x*t), t=0…π)` at `x=1`, `2`, `3`, and `1` again, asserting `2`, `0`, `2/3`, and `2` respectively.
**Compiler features exercised:**
- Symbolic integration
- Typed expression compilation and codomain promotion

### NumericalIntegralNodeTest.testSinIntegralDefaultN
**What it does:** Compiles `nint(t➔sin(t), t=0…π)`, evaluates it, and asserts the trapezoid result is `2.0` within `1e-3`.
**Compiler features exercised:**
- Numerical integration

### NumericalIntegralNodeTest.testExplicitPanelCount
**What it does:** Compiles `nint(t➔sin(t), t=0…π, N=4)`, evaluates it, and asserts the result is finite and lies in `[1.5, 2.0]`.
**Compiler features exercised:**
- Numerical integration

### NumericalIntegralNodeTest.testExplicitPanelWidth
**What it does:** Compiles `nint(t➔sin(t), t=0…π, dt=0.1)`, evaluates it, and asserts the result is `2.0` within `1e-2`.
**Compiler features exercised:**
- Numerical integration

### NumericalIntegralNodeTest.testNonElementaryIntegrand
**What it does:** Compiles `nint(t➔sin(t^2), t=0…1)`, evaluates it, and asserts the result is `0.310268` within `1e-3`.
**Compiler features exercised:**
- Numerical integration

### NumericalIntegralNodeTest.testNodeType
**What it does:** Compiles `nint(t➔t, t=0…1)` and asserts its rendered form still contains `nint(`.
**Compiler features exercised:**
- Symbolic integration
- Unicode surface syntax and literal parsing

### PolynomialIntegrationByPartsTest.testIntegralXTimesExp
**What it does:** Compiles `x→int(x*exp(x),x)`, evaluates at `x=2`, and asserts the result equals `e^2*(2-1)`.
**Compiler features exercised:**
- Symbolic integration

### PolynomialIntegrationByPartsTest.testIntegralXSquaredTimesExp
**What it does:** Compiles `x→int(x²*exp(x),x)`, evaluates at `x=2`, and asserts the result equals `e^2*(4-4+2)`.
**Compiler features exercised:**
- Symbolic integration
- Unicode surface syntax and literal parsing

### PolynomialIntegrationByPartsTest.testIntegralXCubedTimesExp
**What it does:** Compiles `x→int(x→x³*exp(x),x)`, evaluates at `x=1`, and asserts the result equals `e*(1-3+6-6)`.
**Compiler features exercised:**
- Symbolic integration

### PolynomialIntegrationByPartsTest.testIntegralXTimesSin
**What it does:** Compiles `x→int(x*sin(x),x)`, evaluates at `x=1.5`, and asserts the result equals `sin(1.5)-1.5*cos(1.5)`.
**Compiler features exercised:**
- Symbolic integration

### PolynomialIntegrationByPartsTest.testIntegralXTimesCos
**What it does:** Compiles `x→int(x*cos(x),x)`, evaluates at `x=2`, and asserts the result equals `cos(2)+2*sin(2)`.
**Compiler features exercised:**
- Symbolic integration

### PolynomialIntegrationByPartsTest.testIntegralXTimesLn
**What it does:** Compiles `x→int(x*ln(x),x)`, evaluates at `x=2`, and asserts the result equals `2*ln(2)-1`.
**Compiler features exercised:**
- Symbolic integration
- Typed expression compilation and codomain promotion

### PolynomialIntegrationByPartsTest.testIntegralConstantTimesExp
**What it does:** Compiles `x→int(3*exp(x),x)`, evaluates at `x=1`, and asserts the result equals `3e`.
**Compiler features exercised:**
- Symbolic integration

### PolynomialIntegrationByPartsTest.testIntegral2XSquaredPlus3XTimesExp
**What it does:** Compiles `x→int((2*x²+3*x)*exp(x),x)`, evaluates at `x=1`, and asserts the result equals `2e` within `1e-8`.
**Compiler features exercised:**
- Symbolic integration

### PolynomialIntegrationByPartsTest.testDefiniteIntegralXTimesExp
**What it does:** Compiles `x→int(x*exp(x),x)`, evaluates the antiderivative at `1` and `0`, subtracts the results, and asserts the definite integral is `1`.
**Compiler features exercised:**
- Symbolic integration

### RiemannLiouvilleFractionalIntegralNodeTest.testFractionalIntegralOfMonomialHasClosedForm
**What it does:** Compiles `t➔fracint(t^2,t^½)`, evaluates at `t=2`, and asserts the result matches `(16/(15√π))*2^(5/2)` within `1e-10`.
**Compiler features exercised:**
- Fractional calculus
- Typed expression compilation and codomain promotion

### RiemannLiouvilleFractionalIntegralNodeTest.testFractionalIntegralOfConstantHasClosedForm
**What it does:** Compiles `t➔fracint(5,t^½)`, evaluates at `t=4`, and asserts the result matches `5*2*√4/√π` within `1e-10`.
**Compiler features exercised:**
- Fractional calculus
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testNonNullaryIndependentVariable
**What it does:** Parses `x` as a `RealFunction`, asserts the independent variable exists, is named `x`, is marked independent, the expression is non-nullary, and `x.type()` is `Real.class`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testNonNullaryExpressionWithVariable
**What it does:** Compiles `x^2+1`, evaluates at `x=3`, and asserts the result is `10`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Arithmetic and algebraic operator nodes

### VariableNodeResolutionTest.testNonNullaryWithContextVariable
**What it does:** Compiles `x+a` with contextual `a=5`, evaluates at `x=3`, and asserts the result is `8`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testNonNullaryResolutionProperties
**What it does:** Parses `x^2`, asserts the independent variable exists and is marked independent, the expression is non-nullary, and its domain and codomain types are both `Real.class`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testNullaryConstantExpression
**What it does:** Compiles nullary `2^(1/4)`, evaluates it, asserts the result is non-null, and checks the numeric value `1.189207115002721` within `1e-10`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes

### VariableNodeResolutionTest.testNullaryExpressionWithContextVariable
**What it does:** Compiles nullary `a+1` with contextual `a=7`, evaluates it, asserts the result is non-null, and checks the value `8`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testNullaryRationalFunctionIdentity
**What it does:** Compiles rational-function nullary `x`, asserts the result is non-null, and checks that it renders as `x`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testNullaryRationalFunctionArithmetic
**What it does:** Compiles rational-function nullary `x/2`, asserts the result is non-null, and checks that it renders as `(x)/2`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testNullaryRationalFunctionComplex
**What it does:** Compiles rational-function nullary `½-x/2`, asserts the result is non-null, and checks that it renders as `(-x+1)/2`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Unicode surface syntax and literal parsing

### VariableNodeResolutionTest.testNullaryRationalFunctionInverse
**What it does:** Compiles rational-function nullary `x^(-1)`, asserts the result is non-null, and checks that it renders as `1/(x)`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Inverse-function notation and series reversion

### VariableNodeResolutionTest.testNullaryRealPolynomialIdentity
**What it does:** Compiles polynomial nullary `x`, evaluates into a `RealPolynomial`, asserts the result is non-null, and checks it renders as `x`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testNullaryRealPolynomialArithmetic
**What it does:** Compiles polynomial nullary `x^2+1`, evaluates into a `RealPolynomial`, and asserts it renders as `x² + 1`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Unicode surface syntax and literal parsing

### VariableNodeResolutionTest.testSequenceInputAndFunctionalVariable
**What it does:** Compiles `n➔(½-z/2)ⁿ` as a rational-function sequence, evaluates it at `n=0,1,2,3`, and asserts the exact rational-function strings for each term.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testSequenceNegativeExponent
**What it does:** Compiles `n➔(½-z/2)ⁿ` as a rational-function sequence, evaluates it at `n=-2`, and asserts the exact rational-function string `4/(z^2-2*z+1)`.
**Compiler features exercised:**
- Index access
- Arithmetic and algebraic operator nodes

### VariableNodeResolutionTest.testSequenceResolutionProperties
**What it does:** Compiles `n➔(½-z/2)ⁿ`, asserts the expression is non-nullary with domain `Integer` and codomain `RationalFunction`, and checks the independent variable is named `n`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testIsFunctionalVariableOnSequenceExpression
**What it does:** Compiles `n➔(½-z/2)ⁿ` and asserts both `expr.isFunctional()` and `expr.isReifiedFunctional()` are true.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### VariableNodeResolutionTest.testContextVariableResolution
**What it does:** Registers context variable `a`, parses `a` as a rational nullary expression, and asserts there is no independent variable.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testContextVariableVsIndependentVariable
**What it does:** Registers context variable `a`, parses `x+a`, and asserts the placeholder variable exists and is named `x`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testContextRationalFunctionVariables
**What it does:** Registers rational-function variables `a`, `b`, and `c`, parses `a+b+c`, evaluates it, and asserts the exact combined rational function `(21*x^2+98*x+201)/320`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testFunctionsTreatedAsVariablesThrows
**What it does:** Registers named rational functions `a`, `b`, and `c`, parses `a+b+c` without call syntax, and asserts instantiation throws `UndefinedReferenceException`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testFunctionCallSyntaxWorks
**What it does:** Registers named rational functions `a`, `b`, and `c`, evaluates `a()+b()+c()`, and asserts the exact rational function `(21*x^2+98*x+201)/320`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Functional application and reified function evaluation

### VariableNodeResolutionTest.testUndefinedVariableThrows
**What it does:** Attempts to compile `x+undefinedVar` and asserts that compilation throws an `UndefinedReferenceException`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testIsIndependentLogic
**What it does:** Parses `x`, retrieves the independent variable, and asserts both `x.isIndependent()` and the `isIndependent` field are true.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testTypeForNonNullaryIndependent
**What it does:** Parses `x`, retrieves the independent variable, and asserts `x.type()` returns `Real.class`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testTypeForNullaryIndependent
**What it does:** Parses rational-function nullary `x`, instantiates and evaluates it, and asserts the resulting function renders as `x`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testTypeForNullaryIndependentWithArrow
**What it does:** Parses rational-function `x->x`, instantiates and evaluates it, and asserts the resulting function renders as `x`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### VariableNodeResolutionTest.testExpressionFunctionalClassification
**What it does:** Parses `x` as both a `RealFunction` and a rational nullary expression, then asserts the real expression is neither functional nor reified-functional while the rational one is both.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testNullaryRealFunctionProperties
**What it does:** Parses nullary real `42` and asserts the expression is nullary with domain `Object.class` and codomain `Real.class`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testExpressionToString
**What it does:** Parses `x^2+1`, converts the expression to a string, and asserts the string is non-null and contains either `x²` or `x^2`.
**Compiler features exercised:**
- Unicode surface syntax and literal parsing

### VariableNodeResolutionTest.testVariableNodeSubstitution
**What it does:** Parses `x^2`, retrieves the independent variable, substitutes `x` with `sin(x)`, and asserts the expression renders as `x➔sin(x)^2`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Arithmetic and algebraic operator nodes

### VariableNodeResolutionTest.testNonNullaryEvaluationAtMultiplePoints
**What it does:** Compiles `x^3-x`, evaluates it at `0`, `1`, `2`, and `-1`, and asserts the results are `0`, `0`, `6`, and `0`.
**Compiler features exercised:**
- Bytecode generation and class loading
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testNullaryPureConstantHasNoIndependentVariable
**What it does:** Parses nullary real `42`, retrieves the independent variable, and asserts it is `null`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeResolutionTest.testMultipleContextVariables
**What it does:** Compiles nullary `a+b` with contextual `a=3` and `b=4`, evaluates it, and asserts the result is `7`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeTest.testSubstitution
**What it does:** Parses `x^2`, substitutes `x` with `sin(x)` and then with `x/2`, and asserts the final expression renders as `x➔sin(x/2)^2`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Arithmetic and algebraic operator nodes

### VariableNodeTest.testResolutionOfNullaryPolynomialFunction
**What it does:** Parses polynomial nullary `3*x+x^2`, instantiates it, evaluates it, and asserts the polynomial renders as `x² + 3*x`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### VariableNodeTest.testResolutionOfRealToRealPolynomialFunctionWithDifferentIndependentAndPlaceholderVariables
**What it does:** Parses `t->t+3*x+x^2` as a function from `Real` to `RealPolynomial`, evaluates at `t=2`, and asserts the resulting polynomial is `x² + 3*x + 2`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeTest.testResolutionOfRealToRealPolynomialFunctionWithSameIndependentAndPlaceholderVariables
**What it does:** Parses `x->x+3*x+x^2` as a function from `Real` to `RealPolynomial`, evaluates at `x=2`, and asserts the resulting polynomial is `12`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### VariableNodeTest.testResolutionOfRealFunctionalWithDifferentIndependentAndPlaceholderVariables
**What it does:** Parses `t->t+3*x+x^2` as a `RealFunctional`, evaluates the outer parameter at `2`, then evaluates the returned function at `x=3`, and asserts `20`.
**Compiler features exercised:**
- Nested functional declarations

### VariableNodeTest.testResolutionOfRealFunctionalWithDifferentIndependentAndPlaceholderVariablesAndArrowUsedForOuterFunction
**What it does:** Parses `t->x->t+3*x+x^2` as a `RealFunctional`, evaluates the outer parameter at `2`, then evaluates the returned function at `x=3`, and asserts `20`.
**Compiler features exercised:**
- Nested functional declarations
- Functional application and reified function evaluation

### VariableNodeTest.testResolutionOfRealFunctionalWithDifferentIndependentAndPlaceholderVariablesAndNoArrowsUsed
**What it does:** Parses `t+3*x+x^2` as a `RealFunctional`, evaluates the outer parameter at `2`, then evaluates the returned function at `x=3`, and asserts `20`.
**Compiler features exercised:**
- Nested functional declarations

### VariableNodeTest.testResolutionOfRealToRealFunctionWithSameIndependentAndPlaceholderVariables
**What it does:** Parses `x->x+3*x+x^2` as a `RealFunction`, evaluates at `x=2`, and asserts the result renders as `12`.
**Compiler features exercised:**
- Nested functional declarations
- Typed expression compilation and codomain promotion

### AscendingFactorializationTest.testAlternativeSyntax
**What it does:** Compiles the real sequence `n⋰3`, enumerates values from `0` through `9`, and asserts the exact list string `[0, 6, 24, 60, 120, 210, 336, 504, 720, 990]`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Summation and product operators

### DivisionNodeTest.testAnotherArcsinIntegral
**What it does:** Compiles `∫λ➔1/√(λ-λ²)dλ` and asserts its rendered form is `λ➔arcsin((λ-1⁄2)/√(1⁄4))`.
**Compiler features exercised:**
- Symbolic integration
- Unicode surface syntax and literal parsing

### DivisionNodeTest.testSineIntegral
**What it does:** Parses `int(sin(t)/t,t)`, instantiates it, asserts it renders as `t➔si(t)`, checks a quantized sample is nonzero, and asserts the value at `t=2.3` is `1.7222074818055033`.
**Compiler features exercised:**
- Symbolic integration

### DivisionNodeTest.testSimplificationOfExponentialDivision
**What it does:** Parses `exp(t)/exp(s)` with contextual `t=2` and `s=3`, instantiates it, and asserts it renders as `exp(t-s)`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Context-based symbol resolution and namespace management

### MultiplicationNodeTest.testSimplificationOfExponentialMultiplication
**What it does:** Parses `exp(t)*exp(-s)` with contextual `t=2` and `s=3`, instantiates it, and asserts it renders as `exp(t-s)`.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes

### SumNodePlaceholderPassthroughTest.testPolynomialSumOperandPreservesPolynomialType
**What it does:** Registers polynomial variables `p`, `q`, `r`, and `σ`, compiles the recurrence sequence `a`, and asserts `a(1)` and `a(2)` both evaluate to degree-1 `ComplexPolynomial`s.
**Compiler features exercised:**
- Summation and product operators
- Recursive and mutually recursive compilation

### BesselFunctionOfTheFirstKindTest.testPointwiseEvaluationOfExpansionOfJ0Complex
**What it does:** Registers `n=0`, compiles the complex Bessel-based expression `Ψ`, evaluates at `y=2.3`, and asserts the real part is `0.18292135352494568` and the imaginary part is zero.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Context-based symbol resolution and namespace management

### BesselFunctionOfTheFirstKindTest.testPointwiseEvaluationOfExpansionOfJ0
**What it does:** Registers `n=0`, compiles the real Bessel-based expression `Ψ`, evaluates at `y=2.3`, and asserts the result is `0.18292135352494568`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Context-based symbol resolution and namespace management

### BetaFunctionNodeTest.testBetaFunc
**What it does:** Compiles nullary `Beta(1.2,2.3)`, evaluates it, and asserts the value is `0.3223368257714494301489366396995434828153`.
**Compiler features exercised:**
- Built-in function and special-function nodes

### HypergeometricFunctionTest.testHypergeometricPolynomialReal
**What it does:** Initializes a `RealHypergeometricPolynomialFunction` with vector parameters and polynomial argument `1/2-x/2`, evaluates it, and asserts the polynomial renders as `0.065625*x² + 0.30625*x + 0.628125`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Typed expression compilation and codomain promotion

### HypergeometricFunctionTest.testHypergeometricFunctionExpressionReal
**What it does:** Compiles `pFq([-5,3.75,1.2],[1.4,2.7,3.4],-x^2)`, evaluates at `x=2.3`, and asserts `82.03626613894305`.
**Compiler features exercised:**
- Built-in function and special-function nodes

### HypergeometricFunctionTest.testHypergeometricFuntionExpressionComplexRealArg
**What it does:** Compiles complex-rational `pFq([-2,3.5,1],[2,4],1/2-x/2)`, asserts it matches the explicit quadratic rational form, then evaluates at real `x=2.3` and asserts the rendered value `1.67965625`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Typed expression compilation and codomain promotion

### HypergeometricFunctionTest.testHypergeometricFuntionExpressionComplexComplexArg
**What it does:** Compiles the same complex-rational hypergeometric expression, asserts it matches the explicit quadratic rational form, then evaluates at complex `x=2.3` and asserts the rendered value `1.67965625`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Typed expression compilation and codomain promotion

### HypergeometricFunctionTest.testHypergeometricFunctionExpressionRationalFunction
**What it does:** Compiles rational-function `pFq([-2,3.5,1],[2,4],1/2-x/2)`, evaluates it, and asserts it equals the explicit quadratic rational function.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Typed expression compilation and codomain promotion

### HypergeometricFunctionTest.testHypergeometricFunctionExpressionRealPolynomial
**What it does:** Compiles polynomial `pFq([-2,3.5,1],[2,4],1/2-x/2)`, evaluates it, and asserts it renders as `0.065625*x² + 0.30625*x + 0.628125` while also asserting no `UnsupportedOperationException` is thrown.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Typed expression compilation and codomain promotion

### HypergeometricFunctionTest.testSummandComplex
**What it does:** Compiles the hypergeometric summand `n➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q})` with contextual vectors and `z=π`, evaluates at `n=3`, and asserts the real part equals `-244.81029976584379503781836652101052755` and the imaginary part is `0`.
**Compiler features exercised:**
- Summation and product operators
- Context-based symbol resolution and namespace management

### NegationNodeTest.testDoubleNegative
**What it does:** Parses `-(-(1))` and `1` and asserts their rendered expressions are identical.
**Compiler features exercised:**
- Arithmetic and algebraic operator nodes
- Unicode surface syntax and literal parsing

### PolynomialCompositionTest.testComplexPolynomialDirectComposition
**What it does:** Composes complex polynomials `1+x^2` and `1+x` directly, asserts the supplied result buffer is returned, and checks the composed polynomial evaluates to `2` at `0` and `5` at `1`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### PolynomialCompositionTest.testComplexPolynomialCompositionAliasing
**What it does:** Composes the same complex polynomials twice, once with a fresh result buffer and once aliasing the receiver or inner argument, and asserts both aliased results match the unaliased one.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### PolynomialCompositionTest.testRealPolynomialDirectComposition
**What it does:** Composes real polynomials `1+x^2` and `1+x` directly, asserts the supplied result buffer is returned, and checks the composed polynomial evaluates to `2` at `0` and `5` at `1`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### PolynomialCompositionTest.testComplexPolynomialCompositionViaExpressionCompiler
**What it does:** Registers complex polynomial `q=1+x`, compiles `p=1+q()^2`, evaluates the resulting polynomial, and asserts it gives `5` at `x=1`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### PolynomialCompositionTest.testRealPolynomialCompositionViaExpressionCompiler
**What it does:** Registers real polynomial `q=1+x`, compiles `p=1+q()^2`, evaluates the resulting polynomial, and asserts it gives `5` at `x=1`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### IndexCacheTest.testEmptyReturnsNull
**What it does:** Creates an empty cache, confirms it reports empty, and verifies lookups at positive and negative indices return null.
**Compiler features exercised:** none — tests native arb wrapper only.

### IndexCacheTest.testNonNegativePutGet
**What it does:** Stores values at non-negative indices, checks `put` returns the inserted value, verifies retrieval, and confirms the cache is no longer empty.
**Compiler features exercised:** none — tests native arb wrapper only.

### IndexCacheTest.testNegativeIndicesSupported
**What it does:** Stores values at negative indices, verifies those lookups succeed, and confirms positive indices remain unset.
**Compiler features exercised:** none — tests native arb wrapper only.

### IndexCacheTest.testMixedSignsCoexist
**What it does:** Fills the cache from -5 through 5 and verifies each stored square is returned for its matching signed index.
**Compiler features exercised:** none — tests native arb wrapper only.

### IndexCacheTest.testGrowsOnDemandSparse
**What it does:** Writes sparse far-out positive and negative entries and verifies the cache grows on demand while intermediate and out-of-range reads still return null.
**Compiler features exercised:** none — tests native arb wrapper only.

### IndexCacheTest.testOverwriteSameIndex
**What it does:** Writes the same positive and negative indices twice and verifies the later value overwrites the earlier one.
**Compiler features exercised:** none — tests native arb wrapper only.

### IndexCacheTest.testClear
**What it does:** Populates both sides of the cache, clears it, verifies emptiness and null reads, then confirms the cleared cache can be reused.
**Compiler features exercised:** none — tests native arb wrapper only.

### IndexCacheTest.testBoundaryIndices
**What it does:** Stores values at index 0 and -1, verifies each is retrieved from its own side, and confirms adjacent unset indices remain null.
**Compiler features exercised:** none — tests native arb wrapper only.

### InverseFunctionNodeTest.testMultiplicativeInverse
**What it does:** Registers `a=4` in a context, compiles `a⁻¹` as a nullary expression, and verifies it evaluates to 0.25.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Inverse-function notation and series reversion

### InverseFunctionNodeTest.testCompositionalInverseParsesToInverseFunctionNode
**What it does:** Registers `f:x->x²`, parses `f⁻¹(x)`, and verifies the root AST node is an `InverseFunctionNode` whose forward-function name is `f`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Inverse-function notation and series reversion

### InverseFunctionTest.testRealFunctionInvertRoundtrip
**What it does:** Compiles `x²`, evaluates it at 2 to get 4, inverts the function near 2, and verifies the inverse sends 4 back to 2.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### InverseFunctionTest.testRealFunctionInvertCube
**What it does:** Compiles `x³`, builds its inverse near 2, and verifies the inverse sends 8 back to 2.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### InverseFunctionTest.testExpressionCompilerInverseFunction
**What it does:** Registers `f:x->x²`, compiles `f⁻¹(x)`, and verifies the compiled inverse evaluates 4 to approximately 2.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Inverse-function notation and series reversion

### InverseFunctionTest.testComplexFunctionInvert
**What it does:** Inverts a hand-written complex square function near 2 and verifies the resulting function sends 4 to 2+0i.
**Compiler features exercised:** none — tests native arb wrapper only.

### JacobianTest.testJacobianOnHandRolledFunction
**What it does:** Evaluates a hand-written complex function `F(t;v)=v·t²+1` at `t=2+i`, checks `F(t)=10+12i`, then verifies its one-variable Jacobian returns `t²=3+4i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### NumericalRealFunctionIntegralTest.testConstantIntegrand
**What it does:** Compiles the constant integrand `1`, numerically integrates it from 0, and verifies the result matches `F(x)=x` at five sample points.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Nested functional declarations

### NumericalRealFunctionIntegralTest.testLinearIntegrand
**What it does:** Compiles the identity integrand `t`, numerically integrates it from 0, and verifies the result matches `F(x)=x²/2` at five sample points.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Nested functional declarations

### RealBivariateFunctionTest.testEvaluateRealBivariateFunction
**What it does:** Compiles the bivariate expression `x-y`, partially evaluates it at `x=1/2`, then verifies the resulting unary function at `y=√2` equals `1/2-√2`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### RealBivariateFunctionTest.testEvaluateRealBivariateFunctionWithContextVariable
**What it does:** Obtains an oscillatory bivariate-to-complex function from `ZProcess`, evaluates it at frequency 1, and checks the resulting complex-valued function at 1 has the expected real part.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealMatrixFunctionTest.testMatrixAdd
**What it does:** Compiles the nullary matrix expression `2+3`, evaluates it, and verifies the single matrix entry is `5`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Arithmetic and algebraic operator nodes

### SphericalBesselFunctionTest.testEval
**What it does:** Sets the spherical Bessel order to 3, evaluates at 2.3, and checks the returned double against the expected value.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralRandomMeasureTest.testEvaluateAtSingleFrequency
**What it does:** Evaluates the spectral random measure at `ν=0.5` on a coarse grid and verifies both real and imaginary midpoints are finite.
**Compiler features exercised:** none — tests native arb wrapper only.

### DiagonalPadePairTest.testConstructionPreservesOrder
**What it does:** Constructs Padé pairs at several orders and verifies each preserves `M`, allocates `P` and `Q`, and is not marked singular.
**Compiler features exercised:** none — tests native arb wrapper only.

### DiagonalPadePairTest.testNegativeOrderThrows
**What it does:** Verifies constructing a Padé pair with negative order throws `IllegalArgumentException`.
**Compiler features exercised:** none — tests native arb wrapper only.

### DiagonalPadePairTest.testSingularSentinel
**What it does:** Marks a Padé pair singular and verifies the sentinel flag becomes true and both constant coefficients become non-finite.
**Compiler features exercised:** none — tests native arb wrapper only.

### DiagonalPadePairTest.testLinearPadeEvaluation
**What it does:** Manually sets a `[1/1]` Padé pair with `P(z)=z` and `Q(z)=1`, evaluates it at `z=0.1`, and verifies the result is `0.1+0i`.
**Compiler features exercised:** none — tests native arb wrapper only.

### DiagonalPadePairTest.testDiagonalTwoPadeMatchesTanh
**What it does:** Manually sets a higher-order Padé pair for tanh, evaluates it at `z=0.5`, and verifies the real part matches `tanh(0.5)` to 5 digits with zero imaginary part.
**Compiler features exercised:** none — tests native arb wrapper only.

### FoxHFunctionTest.testMittagLefflerReduction
**What it does:** Compiles a Fox H-function specialization and a Mittag-Leffler reference, evaluates both at seven complex points, and verifies matching real and imaginary parts to `1e-12`.
**Compiler features exercised:**
- Built-in function and special-function nodes
- Context-based symbol resolution and namespace management

### HyperbolicTangentTest.testTanhAtZero
**What it does:** Builds the Riccati Müntz–Padé functional for `y'=1-y²`, evaluates it at 0, and verifies the result is exactly 0.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### HyperbolicTangentTest.testTanhAtHalf
**What it does:** Evaluates the Riccati tanh functional at 0.5 and verifies it matches a compiled `tanh(1/2)` reference.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### HyperbolicTangentTest.testTanhAtOne
**What it does:** Evaluates the Riccati tanh functional at 1 and verifies it matches a compiled `tanh(1)` reference.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### HyperbolicTangentTest.testTanhAtTwo
**What it does:** Evaluates the Riccati tanh functional at 2 and verifies it matches a compiled `tanh(2)` reference.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### HyperbolicTangentTest.testTanhOddSymmetry
**What it does:** Evaluates the Riccati tanh approximant at `±0.7` and verifies the values are negatives of each other.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### MuntzPadeApproximantAbandonedAllocationTest.testRebindAbandonsNoOwnedArbWithoutClose
**What it does:** Enables leak tracking, repeatedly rebinds and evaluates the Riccati Müntz–Padé functional, forces collection, and verifies no owned arb allocations were abandoned without `close()`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### MuntzPadeApproximantPrecisionTest.testReuseAcrossEvaluationPointsSameBits
**What it does:** Evaluates one Riccati tanh approximant at several points with the same precision, re-evaluates earlier points, and verifies each result stays within the tanh error threshold.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### MuntzPadeApproximantPrecisionTest.testIncreasingPrecisionRebuildsCache
**What it does:** Evaluates one approximant first at 32 bits and then at 256 bits at the same point, and verifies the higher-precision result is not capped by the earlier cache.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### MuntzPadeApproximantPrecisionTest.testDecreasingPrecisionReusesCache
**What it does:** Evaluates one approximant at 256 bits and then 64 bits at the same point, and verifies both results meet their expected tanh accuracy thresholds.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### MuntzPadeApproximantPrecisionTest.testLargePointStopsAtBestPreviousIterate
**What it does:** Evaluates the approximant at `t=3.3` and verifies it returns a value within the target tolerance of `tanh(3.3)` instead of failing.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### MuntzPadeCumulantGeneratorTest.roughHestonLatticeWeightsCompileAndEvaluate
**What it does:** Builds a rough-Heston cumulant generator from compiled coefficient, `u`, and `w` expressions; verifies `Φ(0,T)=0`, checks 32-bit and 64-bit evaluations agree closely at `v=0.5`, and confirms a 128-bit evaluation returns a non-null result.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### PadeResolventConvergenceTest.testInitialConditionZeroForBothClassicalAndFractional
**What it does:** Evaluates the Riccati Müntz–Padé functional at 0 for `μ=1` and `μ=0.5` and verifies both satisfy the initial condition exactly.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### PadeResolventConvergenceTest.testLinearClassicalRiccatiMatchesExponential
**What it does:** Solves the classical linear Riccati case at `t=1` and verifies the result matches the compiled reference `1-exp(-1)`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### PadeResolventConvergenceTest.testTanhPrecisionStability
**What it does:** Evaluates the classical tanh oracle at 128-bit and 64-bit precision and verifies both agree with a compiled `tanh(1)` reference at their expected accuracy levels.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### PadeResolventConvergenceTest.testFractionalPadeConvergesMonotonically
**What it does:** Evaluates the fractional Riccati solution at `t=1/4` over increasing precisions and verifies at least three of five successive corrections get smaller.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### PadeResolventConvergenceTest.testFractionalFirstMuntzTermDominatesAtSmallT
**What it does:** Evaluates the fractional Riccati solution at `t=1/100`, compares it with a compiled first-term reference, and verifies the relative error is below 5%.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RiccatiDiscriminantTest.testDiscriminantOfTangentEquation
**What it does:** Builds the tangent Riccati functional, computes its discriminant polynomial, and verifies it is the constant `-4` with zero imaginary part.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RiccatiDiscriminantTest.testDiscriminantOfHyperbolicTangentEquation
**What it does:** Builds the hyperbolic-tangent Riccati functional, computes its discriminant polynomial, and verifies it is the constant `+4` with zero imaginary part.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RiccatiDiscriminantTest.testDiscriminantWithVDependentCoefficients
**What it does:** Builds a Riccati functional with `Q(v)=2v`, computes the discriminant, and verifies the resulting polynomial is `4v²-4`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RiccatiMittagLefflerFunctionTest.testConstructionAndFirstMuntzCoefficient
**What it does:** Builds the Riccati functional for `μ=0.6`, retrieves the compiled Müntz coefficient sequence, evaluates `a₁` at `v=1`, and verifies its real part equals `1/Γ(1.6)` with zero imaginary part.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RiccatiMittagLefflerFunctionTest.testSecondMuntzCoefficientClosedForm
**What it does:** Builds the linear fractional Riccati case with `μ=1/2`, evaluates the second Müntz coefficient at `v=1`, and verifies it equals `-1+0i`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RiccatiMittagLefflerFunctionTest.testFractionalLinearMatchesMittagLefflerClosedForm
**What it does:** Evaluates the fractional linear Riccati solution at `t=1/2`, `1`, and `2`, and verifies each real part matches a compiled Mittag-Leffler reference with zero imaginary part.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RiccatiMittagLefflerFunctionTest.testFractionalOracleIsVerifiedEnclosure
**What it does:** Evaluates the fractional linear Riccati solution at `t=1` and verifies the returned real ball contains the compiled exact reference `1-ℰ(1/2,-1)`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RiccatiMuntzPadeFunctionalJacobianTest.testJacobianCompilesWithoutThrowing
**What it does:** Builds the linear Riccati functional `P(v)=v,Q(v)=-1,R(v)=0`, requests its Jacobian with respect to `v`, and verifies the Jacobian metadata and first partial are present.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Symbolic differentiation

### RiccatiMuntzPadeFunctionalJacobianTest.testSymbolicDerivativeMatchesClosedFormAtTEqualsOne
**What it does:** Evaluates the symbolic `∂y/∂v` at `v=1,t=1` and verifies it matches `1-e^{-1}` with zero imaginary part.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Symbolic differentiation

### RiccatiMuntzPadeFunctionalJacobianTest.testSymbolicDerivativeAgreesWithFiniteDifference
**What it does:** Compares the symbolic derivative at `v=1.5,t=0.5` with a centered finite-difference estimate and verifies agreement to `1e-6`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Symbolic differentiation

### TangentTest.testTanAtZero
**What it does:** Builds the Riccati Müntz–Padé functional for `y'=1+y²`, evaluates it at 0, and verifies the result is exactly 0.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### TangentTest.testTanAtHalf
**What it does:** Evaluates the Riccati tangent functional at 0.5 and verifies it matches the direct `tan(0.5)` reference.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### TangentTest.testTanAtOne
**What it does:** Evaluates the Riccati tangent functional at 1 and verifies it matches the direct `tan(1)` reference.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### TangentTest.testTanJustBelowSingularity
**What it does:** Evaluates the Riccati tangent functional at 1.5 and verifies it matches the direct tangent value just below the pole.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### TangentTest.testTanPastSingularity
**What it does:** Evaluates the Riccati tangent functional at 2, verifies the continued value is negative, and checks it matches `tan(2)` past the pole.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### TangentTest.testTanFurtherPastSingularity
**What it does:** Evaluates the Riccati tangent functional at 2.5 and 3 and verifies both match the direct tangent values on the continued branch.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### TangentTest.testTanPastSingularityIsVerifiedEnclosure
**What it does:** Evaluates the Riccati tangent functional at 2 and verifies the returned real ball contains the direct high-precision `tan(2)` value.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### TangentTest.testTanOddSymmetry
**What it does:** Evaluates the Riccati tangent approximant at `±0.7` and verifies the values are negatives of each other.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Functional application and reified function evaluation

### ComplexFunctionSequenceTest2.testComplexFunctionSequence
**What it does:** Compiles the nested sequence `n➔t➔sin(tⁿ)`, evaluates the `n=3` and `n=4` members at sample points, and verifies each result is purely real with the expected value.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Index access

### ComplexFunctionSequenceTest2.testComplexFunctionSequenceDividedByRealNumber
**What it does:** Registers `r=1`, compiles a nested sequence and a second sequence that divides by `r`, and verifies the `n=3` and `n=4` members still evaluate to the expected purely real values.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### PascalsTriangleTest.testGenerationOfPascalsTriangleOfBinomialCoeffecients
**What it does:** Evaluates Pascal's triangle at row 10 and verifies the resulting polynomial string matches the expected binomial-coefficient row.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealSequenceSequenceTest.testExpressString
**What it does:** Compiles the two-index expression `i+j`, evaluates it at `(3,5)`, and verifies the result is `8`.
**Compiler features exercised:**
- Index access
- Typed expression compilation and codomain promotion

### RealSequenceSequenceTest.testExpressString2
**What it does:** Compiles `i->i+j`, evaluates it at `(3,5)`, and verifies the result is `8`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Index access

### RealSequenceSequenceTest.testExpressString3
**What it does:** Compiles `i->j->i+j`, evaluates it at `(3,5)`, and verifies the result is `8`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Index access

### RealSequenceSequenceTest.testExpressStringIntegral
**What it does:** Compiles `i->j->int(x^(i+j),x=-1..1)`, evaluates it at `(3,5)`, and verifies the integral equals `2/9`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Symbolic integration

### RealSequenceSequenceTest.testExpressStringSum
**What it does:** Compiles `i->j->sum(k{k=i..j})` with a context, evaluates it at `(3,5)`, and verifies the sum is `12`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Summation and product operators

### RealSequenceSequenceTest.testExpressStringSumFuncSyntax
**What it does:** Compiles `i->j->sum(k,k=i..j)` with a context, evaluates it at `(3,5)`, and verifies the sum is `12`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Summation and product operators

### ModifiedLommelPolynomialsTest.testModifiedLommelPolynomials
**What it does:** Evaluates modified Lommel polynomials from orders 0 through 9 and verifies the order-9 polynomial string matches the expected form.
**Compiler features exercised:** none — tests native arb wrapper only.

### OrthogonalPolynomialSequenceTest.testHermitePolynomials
**What it does:** Evaluates Hermite polynomials through order 9 and verifies the order-9 polynomial string matches the expected recurrence result.
**Compiler features exercised:** none — tests native arb wrapper only.

### OrthogonalPolynomialSequenceTest.testType1ChebyshevPolynomials
**What it does:** Evaluates Type-1 Chebyshev polynomials through order 9 and verifies the order-9 polynomial string matches the expected form.
**Compiler features exercised:** none — tests native arb wrapper only.

### OrthogonalPolynomialSequenceTest.testChebyshevPolynomialsOfTheFirstKind
**What it does:** Evaluates Chebyshev polynomials of the first kind through order 9 and verifies the order-9 polynomial string matches the expected form.
**Compiler features exercised:** none — tests native arb wrapper only.

### BesselPolynomialsTest.testComplexBesselPolynomials
**What it does:** Evaluates complex Bessel polynomials through order 9 and verifies the order-5 polynomial string matches the expected coefficients.
**Compiler features exercised:** none — tests native arb wrapper only.

### BesselPolynomialsTest.testBesselPolynomials
**What it does:** Evaluates real Bessel polynomials through order 9 and verifies the order-5 polynomial string matches the expected coefficients.
**Compiler features exercised:** none — tests native arb wrapper only.

### JacobiPolynomialSequenceTest.testP1
**What it does:** Evaluates the `n=1` Jacobi polynomial with parameters `(-1/2,-1/2)` and verifies its values at 1 and 1/2 are 1/2 and 1/4.
**Compiler features exercised:** none — tests native arb wrapper only.

### OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequenceTest.testConstructionAndFirstFewTerms
**What it does:** Builds the fractional Riccati OPS for `μ=0.6`, verifies the compiled sequences `m`, `σ`, `h`, `α`, and `β` exist, and checks `m(0..2)` and `h(0..2)` are non-null non-empty polynomials.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### OrthogonalPolynomialMomentFunctionalSequenceTest.testOnDemandEvaluationDoesNotThrow
**What it does:** Builds the tanh OPS, verifies `σ`, `h`, `α`, and `β` exist, and checks `h(j)`, `α(j)`, and `β(j)` all evaluate for `j=0..3`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### OrthogonalPolynomialMomentFunctionalSequenceTest.testSquaredNormsAreNonEmpty
**What it does:** Evaluates `h(j)` for `j=0..3` in the tanh OPS and verifies each squared-norm polynomial is non-null and non-empty.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### OrthogonalPolynomialMomentFunctionalSequenceTest.testDiagonalJacobiCoefficientsAreZeroForSymmetricFunctional
**What it does:** Evaluates `α(j)` for `j=0..2` at `v=1` in the tanh OPS and verifies each value has zero real and imaginary parts to tolerance.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### OrthogonalPolynomialMomentFunctionalSequenceTest.testBetaCoefficientsMatchTanhJFraction
**What it does:** Evaluates `β(1)` and `β(2)` at `v=1` in the tanh OPS and verifies they equal `-1/3` and `-1/15` with zero imaginary parts.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### OrthogonalPolynomialMomentFunctionalSequenceTest.testRepeatedEvaluationIsConsistent
**What it does:** Evaluates `β(1)` twice at `v=1` in the tanh OPS and verifies the repeated result is unchanged.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### HermiteGeneratingFunctionTest.testRepeatedDifferentiationOfGeneratingFunction
**What it does:** Compiles the recursive polynomial sequence `H:n➔when(n=0,1,else,2*x*H(n-1)-diff(H(n-1),x))`, compares it with built-in Hermite polynomials exactly for orders 0 through 4, then verifies matching length and overlap up to order 2000.
**Compiler features exercised:**
- Recursive and mutually recursive compilation
- Symbolic differentiation

### HermiteGeneratingFunctionTest.testNthDerivativeOfGeneratingFunction
**What it does:** Compiles `H:n➔x➔(-1)^n*exp(x²)*diff(exp(-x²),x^n)`, evaluates orders 0 through 4 at `x=0.75`, and verifies each value overlaps the built-in Hermite reference.
**Compiler features exercised:**
- Symbolic differentiation
- Typed expression compilation and codomain promotion

### LaguerrePolynomialsTest.testLaguerrePolynomials
**What it does:** Evaluates the second Laguerre polynomial and verifies its string form is `0.5*x² - 2*x + 1`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ShiftedJacobiPolynomialsTest.testShiftedJacobiPolynomials
**What it does:** Evaluates the shifted Jacobi polynomial at order 8 for parameters `(-1/2,-1/2)` and verifies the resulting polynomial string.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealFunctionTest.testDeltaFunctionSifting
**What it does:** Parses `H:a->int(sin(x)*δ(x-a),x=-inf..inf)` and verifies the simplified function string is `H:a➔sin(a)`.
**Compiler features exercised:**
- Symbolic integration

### RealFunctionTest.testDeltaFunctionIntegrals
**What it does:** Parses `δ(x)`, then successive integrals of that result, and verifies the simplified strings are `θ(x)`, `x*θ(x)`, and `(θ(x)*(x^2))/2`.
**Compiler features exercised:**
- Symbolic integration

### RealFunctionTest.testEvaluateMixedExpression
**What it does:** Compiles a mixed special-function expression with real and integer context variables, evaluates it at 2.3, and verifies the result is NaN.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Built-in function and special-function nodes

### ZetaSpectralDensityTest.testSaddleIdentityForModes2Through5
**What it does:** Computes saddle times for modes 2 through 5, differentiates `θ` at each saddle, and verifies `ϑ'(t*) = log(n)/(σ-ν)`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralDensityTest.testMaxModeInWindowIsFinite
**What it does:** Computes `N_max` for two window sizes and verifies it is at least 2 for the smaller window and strictly larger for the bigger one.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralDensityTest.testTailBoundVanishesAtMaxMode
**What it does:** Computes the tail bound at `N=N_max` and verifies it is exactly zero.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralDensityTest.testTailBoundIsMonotoneNonIncreasing
**What it does:** Evaluates tail bounds at increasing truncations and verifies the sequence is monotone non-increasing.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralDensityTest.testChooseTruncationHonorsTolerance
**What it does:** Chooses a truncation for tolerance 1.0, recomputes its tail bound, and verifies the bound is within tolerance or the truncation reached `N_max`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralDensityTest.testMultiModeContributionIsNonTrivial
**What it does:** Evaluates the density with `N=2` and `N=8`, verifies the multi-mode sum differs from the single-mode value, and checks the difference stays within the certified `N=2` tail bound.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralDensityTest.testEvaluatorIsFiniteAndReproducible
**What it does:** Evaluates the density twice with the same parameters and verifies the result is finite and exactly reproducible.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralDensityTest.testRejectsFrequencyAtOrOutsideBand
**What it does:** Tries several out-of-band frequencies and verifies each evaluation throws `IllegalArgumentException`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZetaSpectralDensityTest.testRejectsInvalidTruncationOrModeArguments
**What it does:** Verifies invalid truncation and saddle-time arguments (`N=0`, `n=1`, `σ=0`, and `σ-ν<0`) each throw `IllegalArgumentException`.
**Compiler features exercised:** none — tests native arb wrapper only.

### LommelPolynomialTest.testLommelRationalFuctionSequenceViaSequenceNode
**What it does:** Compiles the rational sequence `R(n,1⁄2;z)`, evaluates the `n=3` member, verifies its rational form, and checks its value at `23/10`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Built-in function and special-function nodes

### LommelPolynomialTest.testLommelPolynomials
**What it does:** Registers `v=1/2`, compiles an explicit rational-function sequence definition, evaluates the `n=3` member, verifies its rational form, and checks its real evaluation at 2.3.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### LommelPolynomialTest.testRationalLommelPolynomialsAsNullary
**What it does:** Registers `v=1/2` and `n=3`, compiles the nullary rational expression for the Lommel polynomial, evaluates it, verifies its rational form, and evaluates it numerically at 2.3.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### LommelPolynomialTest.testLommelPolynomial
**What it does:** Uses the direct `LommelPolynomial` class with `v=1/2` and `n=3`, evaluates the resulting rational function, and verifies its value at 2.3.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexEpsilonTableTest.testDivergentComplexGeometricExactlyResummed
**What it does:** Feeds the first three partial sums of the geometric series with ratio 2i into `ComplexEpsilonTable`, then checks that the estimate matches `1/(1-2i)` within `2^(-bits/2)` and that exactly 3 cell updates were performed.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexEpsilonTableTest.testDriverResumsComplexGeometric
**What it does:** Uses `ComplexEpsilonTable.limit` with `complexGeometricPartial` to resum the geometric series with ratio 2i, then checks that the returned value matches `1/(1-2i)` within `2^(-bits/2)`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealEpsilonTableTest.testDivergentGeometricExactlyResummed
**What it does:** Feeds the first three partial sums of the geometric series with ratio 2 into `RealEpsilonTable`, then checks that the estimate matches `-1` within `2^(-bits/2)` and that exactly 3 cell updates were performed.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealEpsilonTableTest.testConvergentGeometricExactlyResummed
**What it does:** Feeds the first three partial sums of the geometric series with ratio 0.5 into `RealEpsilonTable`, then checks that the estimate matches `2` within `2^(-bits/2)` and that exactly 3 cell updates were performed.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealEpsilonTableTest.testRunningCostIsTriangularNotCubic
**What it does:** Feeds 12 successive partial sums of the constant-one series into `RealEpsilonTable`, then checks that `cellUpdates()` equals `m(m-1)/2` and `count()` equals 12.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealEpsilonTableTest.testDriverResumsDivergentGeometric
**What it does:** Uses `RealEpsilonTable.limit` with `geometricPartial(2.0, ...)` and checks that the returned value matches `-1` within `2^(-bits/2)`.
**Compiler features exercised:** none — tests native arb wrapper only.

### ComplexWhiteNoiseProcessTest.testComplexWhiteNoiseSampleStream
**What it does:** Seeds `ComplexWhiteNoiseProcess` with 777 and checks that two real-part stream averages are identical, the real-part squared average from a sampled vector is at least 0.95, two imaginary-part stream averages are identical, and the imaginary-part squared average from a stream is at least 0.95.
**Compiler features exercised:** none — tests native arb wrapper only.

### RealWhiteNoiseProcessTest.testWhiteNoiseSampleStream
**What it does:** Seeds `RealWhiteNoiseProcess` with 777 and checks that the stream mean matches the sampled-vector mean and that the stream average of squared values is at least 0.95.
**Compiler features exercised:** none — tests native arb wrapper only.

### ZProcessTest.testZProcessGainFunction
**What it does:** Loads `arblib`, evaluates the gain function at frequency `1/2` and time `13.2`, and checks the resulting complex value against fixed real and imaginary doubles.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonCalibrationTest.testReproducesKnownParameters
**What it does:** Builds a 10-quote mixed call/put grid over two maturities and five strikes, prices it at known rough-Heston parameters, calibrates from a perturbed initial vector freeing `ν`, `ρ`, and `V0`, and checks convergence, iteration count ≤ 5, twelve-digit recovery of those three parameters, and total elapsed time under 60 seconds.
**Compiler features exercised:** none — tests native arb wrapper only.

### RoughHestonCharacteristicFunctionTest.testAtZeroArgumentEqualsOne
**What it does:** Evaluates the rough-Heston characteristic function at `u=0` and checks that the real part is 1 and the imaginary part is 0 to `1e-10`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonCharacteristicFunctionTest.testModulusAtMostOneForRealArgument
**What it does:** Evaluates the characteristic function for each real `u` from -5 through 5 and checks that `|φ(u)| ≤ 1`, allowing the interval difference from 1 to contain zero.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonCharacteristicFunctionTest.testShortMaturityLimitApproachesOne
**What it does:** Sets `T` to `0.0001`, evaluates the characteristic function at `u=1`, and checks that the result is approximately `1 + 0i` within `1e-3` on both components.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### RoughHestonCharacteristicFunctionTest.testMuIsCanonicalSingleInstance
**What it does:** Checks that `φ.μ`, `φ.context.getVariable("μ")`, and `φ.riccati.α` are the very same `Real` instance.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Fractional calculus

### RoughHestonCharacteristicFunctionTest.testEvaluateIsStateless
**What it does:** Evaluates one characteristic-function instance at `u=0.1` and then `u=0.3`, evaluates a fresh instance at `u=0.3`, and checks that the reused and fresh `φ(0.3)` values match to `1e-10` on real and imaginary parts.
**Compiler features exercised:**
- Static hoisting and cache invalidation

### RoughHestonCharacteristicFunctionTest.testContextBasedConstructorSharesInstances
**What it does:** Builds a `Context` with caller-owned parameter `Real`s, constructs the characteristic function from that context, checks that `μ`, `λ`, `T`, and `riccati.α` are shared by identity with the caller’s instances, and then rechecks `φ(0,T)=1+0i` to `1e-10`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### RoughHestonEdgeworthCallPriceTest.testEdgeworthAgainstSinhCbBenchmark
**What it does:** Registers the rough-Heston parameters in a `Context`, prices five strikes at `T=1/252`, converts the first two call prices to OTM puts by parity, and checks that each resulting OTM value matches the published reference string exactly.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### RoughHestonEdgeworthCallPriceTest.testEdgeworthAgainstSinhCbBenchmarkTable2
**What it does:** Registers the same parameter set with `T=1/12`, prices eight strikes, converts the first four call prices to OTM puts by parity, and checks that each resulting value matches the Table 12 reference string exactly.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### RoughHestonExactCallNoArbitrageTest.testMartingaleConditionPhiAtMinusIIsOne
**What it does:** Evaluates the rough-Heston characteristic function at `u=-i`, computes the magnitude of the difference from `1+0i`, and checks that it is below `2^-100`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonExactCallNoArbitrageTest.testIntrinsicZeroArgumentResidue
**What it does:** Evaluates the characteristic function at `u=0`, computes the magnitude of the difference from `1+0i`, and checks that it is below `2^-100`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonExactCallNoArbitrageTest.testHermitianSymmetry
**What it does:** For real inputs `0.7`, `1.3`, and `2.5`, evaluates `φ(u)` and `φ(-u)`, conjugates `φ(u)`, and checks that `|φ(-u)-conj(φ(u))| < 2^-90`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonExactCallNoArbitrageTest.testCharacteristicFunctionBitsConvergence
**What it does:** Builds high-precision characteristic functions with 600-bit parameters, uses a 512-bit evaluation of `φ(0.7)` as reference, and checks that the errors at 64, 128, and 256 working bits decrease strictly and that the 256-bit error is below `2^-100`.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### RoughHestonMuntzPadeSolverConsistencyTest.testMuntzRiccatiRecurrenceResidual
**What it does:** For `v=0.5` and `v=1.0`, evaluates the compiled coefficients `a(1)` through `a(7)`, independently recomputes the anchor and recurrence right-hand sides from the live characteristic-function parameters, and checks every residual is below `2^-90`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### RoughHestonMuntzPadeSolverConsistencyTest.testMuntzCoefficientBitsConvergence
**What it does:** Uses a 512-bit reference value for `a(5)(0.5)` from a 600-bit-parameter characteristic function and checks that the errors at 64, 128, and 256 working bits decrease strictly and that the 256-bit error is below `2^-100`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonOptionPricerTest.testBlackScholesLimitIsExact
**What it does:** Prices a call with `lewisSingleSeries`, independently computes the Black-Scholes price from the same inputs, and checks that the absolute difference is below `2^-100`.
**Compiler features exercised:** none — tests native arb wrapper only.

### RoughHestonOptionPricerTest.testCayleyScaleInvariance
**What it does:** Prices the same option twice with identical inputs except for Cayley scales `κ=1` and `κ=7/4`, using the same two-point complex `w` and `B` vectors, and checks that the two resulting price balls overlap.
**Compiler features exercised:** none — tests native arb wrapper only.

### RoughHestonOrthogonalPolynomialSequenceTest.testConstructionSucceeds
**What it does:** Constructs the orthogonal-polynomial sequence object and checks that its `m` sequence, `S` recurrence sequence, and `muntz` functional are all non-null.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### RoughHestonOrthogonalPolynomialSequenceTest.testMomentSequenceNonEmpty
**What it does:** Evaluates `m(0)`, `m(1)`, and `m(2)`, checks that each polynomial is non-null, and checks that each has degree at least 0.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonOrthogonalPolynomialSequenceTest.testOPSRecurrenceNonEmpty
**What it does:** Evaluates `S(0)`, `S(1)`, and `S(2)`, checks that each polynomial is non-null, and checks that each has degree at least 0.
**Compiler features exercised:**
- Recursive and mutually recursive compilation
- Typed expression compilation and codomain promotion

### RoughHestonOrthogonalPolynomialSequenceTest.testS0EqualsM0
**What it does:** Evaluates `m(0)` and `S(0)`, checks that they have the same degree, and checks coefficient-by-coefficient equality of real and imaginary parts to `1e-12`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### RoughHestonOrthogonalPolynomialSequenceTest.testMuIsSharedInstance
**What it does:** Constructs the orthogonal-polynomial sequence with caller-owned `μ`, `κ`, `ρ`, and `σ`, then checks that the `μ` stored in `ops.muntz.context` is the same instance as the constructor argument.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### RoughHestonOrthogonalPolynomialSequenceTest.testM0SpotCheck
**What it does:** Evaluates `m(0)` at `0.5`, `1.0`, and `1.5` and checks the real and imaginary parts against the three fixed reference values to `1e-12`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonOrthogonalPolynomialSequenceTest.testM1SpotCheck
**What it does:** Evaluates `m(1)` at `0.5`, `1.0`, and `1.5` and checks the real and imaginary parts against the three fixed reference values to `1e-12`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonOrthogonalPolynomialSequenceTest.testM2SpotCheck
**What it does:** Evaluates `m(2)` at `0.5`, `1.0`, and `1.5` and checks the real and imaginary parts against the three fixed reference values to `1e-12`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonRiccatiMuntzPadeFunctionalTest.testConstructFromContextWithoutCharacteristicFunction
**What it does:** Builds the Riccati Müntz-Padé functional from a bare `Context` containing `λ`, `ρ`, `ν`, and `μ`, then checks that `α`, `p`, `q`, `r`, and `a` are all non-null and that the functional keeps the same `Context` instance.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Typed expression compilation and codomain promotion

### RoughHestonRiccatiMuntzPadeFunctionalTest.testContextVariablesRegistered
**What it does:** Checks that the context stores the same `μ`, `p`, `q`, and `r` instances exposed by the functional, using identity comparisons rather than value comparisons.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### RoughHestonRiccatiMuntzPadeFunctionalTest.testContextParameterIdentity
**What it does:** Checks that the context returns the exact caller-supplied `λ`, `ρ`, and `ν` instances.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management

### RoughHestonRiccatiMuntzPadeFunctionalTest.testPCoefficientExpression
**What it does:** Evaluates the compiled `p(v)` polynomial at `v=0`, `0.5`, and `1.0` and checks that its real and imaginary parts match `(-v^2/2, -v/2)` to `1e-30`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonRiccatiMuntzPadeFunctionalTest.testQCoefficientExpression
**What it does:** Evaluates the compiled `q(v)` polynomial at `v=0`, `0.5`, and `1.0` and checks that its real and imaginary parts match `(-λ, λρνv)` to `1e-30`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Context-based symbol resolution and namespace management

### RoughHestonRiccatiMuntzPadeFunctionalTest.testRCoefficientExpression
**What it does:** Evaluates the compiled `r` polynomial at `v=0.5` and `v=2.0` and checks that it is the same real constant `0.5*(λν)^2` with zero imaginary part.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonRiccatiMuntzPadeFunctionalTest.testCoefficientAnchorA1
**What it does:** Recomputes `a1(v)=p(v)/Γ(μ+1)` independently for `v=0.5` and `v=1.0`, evaluates the compiled `a(1)` at those points, and checks that each residual magnitude is below `2^-90`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonRiccatiMuntzPadeFunctionalTest.testMuntzRiccatiRecurrenceResidual
**What it does:** For `v=0.5` and `v=1.0`, evaluates the compiled coefficients `a(1)` through `a(7)`, independently rebuilds the recurrence right-hand sides from the live functional parameters, and checks every residual is below `2^-90`.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion
- Recursive and mutually recursive compilation

### RoughHestonRiccatiMuntzPadeFunctionalTest.testZeroInputYieldsZeroCoefficients
**What it does:** Evaluates `a(k)(0)` for `k=1` through `6` and checks that every value is exactly zero.
**Compiler features exercised:**
- Typed expression compilation and codomain promotion

### RoughHestonRiccatiMuntzPadeFunctionalTest.testCacheInvalidationRefreshesCoefficients
**What it does:** Confirms the initial `r` value at `λ=0.3`, mutates `λ` to `0.5`, calls `invalidateCache()`, then checks that `q` and `r` refresh to the new closed forms while `p` stays unchanged.
**Compiler features exercised:**
- Context-based symbol resolution and namespace management
- Static hoisting and cache invalidation

### RealSequenceTest.testRealFactorialSequence
**What it does:** Compiles `"n!"` with `RealSequence.express`, enumerates terms 0 through 9, wraps them in a `Real`, and checks the exact factorial list string.
**Compiler features exercised:**
- Index access
- Typed expression compilation and codomain promotion

### PointCacheTest.testCache
**What it does:** Retrieves a cached point at `(0,17,18)`, mutates it by setting and taking `tan(128)`, retrieves the same point again, and checks that the cached value is equal to the mutated one.
**Compiler features exercised:** none — tests native arb wrapper only.
