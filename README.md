# arb4j Overview

## What is arb4j?

**arb4j** is a robust Java API designed to efficiently represent mathematical structures in their most general 
forms, prioritizing high performance. It seamlessly integrates with the [arblib](http://arblib.org) library 
via an interface generated by [SWIG](https://swig.org), enabling arbitrary precision real and complex ball 
arithmetic operations.

## Features and Usage Patterns

### Fluent Interface Pattern
- arb4j employs a fluent pattern wherever possible, enhancing the way functions receive and return values.
- Typically, the last argument in a function call becomes the return value, defaulting to `'this'` if not specified.

**Example:**
```java
Real x = new Real("25", 128); // 128 bits of precision

// Both lines achieve the same result:
Real five = x.sqrt(128);
Real five = x.sqrt(128, x); // Using 'this' as the result variable explicitly
```
- To prevent overwriting the input variable:
```java
Real five = x.sqrt(128, new Real());
```
- Chain function calls in an object-oriented way:
```java
Real y = new Real("25", 128)
            .add(RealConstants.one, 128)
            .log(128)
            .tanh(128);
```

### Resource Management with AutoCloseable
- The `AutoCloseable` interface is used for memory management.
- This implementation ensures that objects can and should be used within try-with-resources blocks for optimal resource handling, especially important for managing native resources.

**Example:**
```java
try (Real x = new Real("25", 128)) {
    doSomething(x);
} // x is automatically closed, ensuring proper resource management
```

### Advanced Tools

#### Expression Compiler
- The [arb.expressions](https://github.com/crowlogic/arb4j/tree/master/src/main/java/arb/expressions) package in arb4j includes tools for compiling mathematical [expressions](https://github.com/crowlogic/arb4j/blob/master/src/main/java/arb/expressions/Expression.java) directly into Java bytecode, eliminating the need for verbose Java code.

The following is the unmodified decompiled class file generated for the [Type1ChebyshevPolynomial](https://github.com/crowlogic/arb4j/blob/master/src/main/java/arb/functions/polynomials/orthogonal/Type1ChebyshevPolynomialSequence.java) implementation

```java
import arb.Integer;
import arb.RealPolynomial;
import arb.functions.Function;

public class T implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1 = new Integer("0");
   Integer c2 = new Integer("1");
   Integer c3 = new Integer("2");
   public RealPolynomial r̅1 = new RealPolynomial();
   public Integer ℤ1 = new Integer();
   public RealPolynomial r̅2 = new RealPolynomial();
   public RealPolynomial r̅3 = new RealPolynomial();
   public Integer ℤ2 = new Integer();
   public RealPolynomial r̅4 = new RealPolynomial();
   public T T;

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }
      return switch(in.getSignedValue()) {
         case 0 -> result.set(c2);
         case 1 -> result.set(result.identity());
         default -> c3
         .mul(result.identity(), bits, r̅1)
         .mul(T.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅2), bits, r̅3)
         .sub(T.evaluate(in.sub(c3, bits, ℤ2), order, bits, r̅4), bits, result);
      };
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         T = new T();
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      c2.close();
      c3.close();
      r̅1.close();
      ℤ1.close();
      r̅2.close();
      r̅3.close();
      ℤ2.close();
      r̅4.close();
      T.close();
   }
}
```

#### Automatic Differentiation of Expressions (Upcoming)
- A symbolic parser and compiler for automatic differentiation is in development. 
- Current progress can be tracked at: [GitHub Issue #253](https://github.com/crowlogic/arb4j/issues/253).

## Forked modularized version of jlatexmath 
See [this](https://github.com/crowlogic/jlatexmath) for a version of jlatexmath without the unnamed module warnings

## Licensing

arb4j is made available under the terms of the Business Source License™ v1.1
which can be found in the root directory of this project in a file
named License.pdf, License.txt, or License.tm which are the pdf, text, and
TeXmacs format of the same document respectively.


