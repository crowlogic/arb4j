package arb.expressions.nodes.binary;

import org.objectweb.asm.Opcodes;

/**
 * The two binary boolean connectives. {@code AND}'s short-circuit identity is
 * "if left is false, the answer is false"; {@code OR}'s is "if left is true,
 * the answer is true." {@link #shortCircuitOpcode} is the JVM jump opcode that
 * fires the short-circuit branch when the left operand has just been evaluated
 * and lies on top of the stack: {@code IFEQ}/0-jumps for AND,
 * {@code IFNE}/1-jumps for OR. {@link #shortCircuitResult} is the constant
 * pushed when the short- circuit branch fires (0 for AND because
 * false-AND-anything is false, 1 for OR because true-OR-anything is true).
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public enum BooleanOperator
{
 AND("∧",
     "\\land",
     "and",
     Opcodes.IFEQ,
     0),
 OR("∨",
    "\\lor",
    "or",
    Opcodes.IFNE,
    1);

  public final String symbol;
  public final String latex;
  public final String operation;
  public final int    shortCircuitOpcode;
  public final int    shortCircuitResult;

  BooleanOperator(String symbol, String latex, String operation, int shortCircuitOpcode, int shortCircuitResult)
  {
    this.symbol             = symbol;
    this.latex              = latex;
    this.operation          = operation;
    this.shortCircuitOpcode = shortCircuitOpcode;
    this.shortCircuitResult = shortCircuitResult;
  }
}