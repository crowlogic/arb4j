/**
 * <pre>
 * A {@link arb.space.topological.VectorSpace} is a set of elements called
 * vectors, which may be added together and multiplied by numbers, called
 * scalars.
 * 
 * An {@link arb.space.topological.InnerProductSpace} is a
 * {@link arb.space.topological.VectorSpace} that has an additional structure,
 * namely an inner product.
 * 
 * A {@link arb.space.topological.NormedVectorSpace} is a
 * {@link arb.space.topological.VectorSpace} that has another additional
 * structure, a norm, which gives the length of vectors. Since every inner
 * product induces a norm, {@link arb.space.topological.NormedVectorSpace}
 * extends {@link arb.space.topological.InnerProductSpace}.
 * 
 * A {@link arb.space.topological.BanachSpace} is a
 * {@link arb.space.topological.NormedVectorSpace} that is complete, meaning
 * every Cauchy sequence in the space converges to a limit in the space.
 * 
 * Finally, a {@link arb.space.topological.HilbertSpace} is a
 * {@link arb.space.topological.BanachSpace} that is also an
 * {@link arb.space.topological.InnerProductSpace}. That is, it is a complete
 * space with an inner product and thus inherits properties from both of these
 * classes.
 * </pre>
 */
package arb.space.topological;