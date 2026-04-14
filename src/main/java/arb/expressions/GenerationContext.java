package arb.expressions;

/**
 * Identifies which method is currently being generated, so that nodes can emit
 * the correct bytecode for loading parameters like {@code bits}.
 * 
 * <ul>
 * <li>{@link #Evaluation} — inside {@code evaluate(Object, int, int, Object)};
 * {@code bits} is in local slot 3.</li>
 * <li>{@link #Initialization} — inside {@code initialize()}; no parameters
 * beyond {@code this} in slot 0, so {@code bits} must be a literal
 * constant.</li>
 * <li>{@link #StaticEvaluation} — inside
 * {@code evaluateStaticSubexpressions(Object, int, int, Object)}; same slot
 * layout as {@link #Evaluation}, but the purpose is to compute and store
 * constant (input-independent) subexpression fields.</li>
 * </ul>
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public enum GenerationContext
{
 /**
  * Normal {@code evaluate()} method. Full parameter slots available.
  */
 Evaluation,

 /**
  * {@code initialize()} method. Only {@code this} in slot 0; no input, order,
  * bits, or result parameters.
  */
 Initialization,

 /**
  * {@code evaluateStaticSubexpressions()} method. Same parameter layout as
  * {@link #Evaluation} so {@code ILOAD 3} resolves to {@code bits}, but the
  * generated code computes constant subexpression fields and stores them.
  */
 StaticEvaluation
}
