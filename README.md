# arb4j
arb4j is a Java API designed to express mathematical structures in their most general form without sacrificing performance. It is based upon an interface to the arbitrary precision real and complex ball arithmetic library [arblib](http://arblib.org) which is generated via [SWIG](https://swig.org/)  

# Fluent Patterns, Arguments and Results of Functions, and Try-With-Resources
<p>The fluent pattern is used as much as possible: this means the last variable in the set of arguments (usually input, order, bits of precision, result) passed to a function is the return value of the function; when it is not specified it assumes the value 'this'.</p>
<p>For example, if Real x = new Real("25",128); where 128 is the number of bits of precision is declared then Real five = x.sqrt(128); is equivalent to Real five = x.sqrt(128,x);  
This would over-write the input variable with the result of the calculation.  
If that is not desired then the thing to do would be do declare the square-root operation like this: Real five = x.sqrt(128,new Real());</p>
<p>
The reason for this is to facilitate more terse expressions via the ability to chain function invocations together in an object-oriented fashion 
such as Real y = new Real("25",128).add( RealConstants.one, 128 ).log(128).tanh(128).  
</p>
<p>
The Real and Complex classes allocate native memory when they are instantiated and as such the memory needs to be freed and this will not be done automatically via the garbage collector because there is a fairly steep performance penality for using finalizers in Java.  
The solution is the implentation of the close() method via the AutoCloseable interface in java that makes the variables amenable to being encapsulated in try-with-resources blocks like so:  
</p>
<p>
try { Real five = x.sqrt(128,new Real() ); } { doSomething(five); } which would cause the close() method to be called regardless of whatever else  
happens between the braces specifying the code block. The close() method just calls the clear() method which maps to arblib's arb_clear or acb_clear methods.
</p>

# Expression Compiler
You can avoid writing code such as that above by harnessing this awesome piece of code I wrote that compiles mathematical expressions directly
into Java bytecodes, obviating the necessity to write long strands of Java code to implement non-trivial function evaluation

# Coming Soon
### Automatic Differentiation of Expressions (doable now that symbolic parser and compiler works)
Until then, derivatives of expressions must be manually expressed. see https://github.com/crowlogic/arb4j/issues/253

# Copyright

This project is licensed under the Mozilla Public License 2.0 - see the [COPYRIGHT](COPYRIGHT) file for details.





