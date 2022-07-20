package arb.expression;

public enum Operation
{
 UNARY_MINUS,
 UNARY_LOGICAL_NOT,
 UNARY_BITWISE_NOT,

 POWER,
 MULTIPLY,
 DIVIDE,
 REMAINDER,

 PLUS,
 MINUS,

 SHL,
 SHR,

 LT,
 LE,
 GT,
 GE,
 EQ,
 NE,

 BITWISE_AND,
 BITWISE_OR,
 BITWISE_XOR,

 LOGICAL_AND,
 LOGICAL_OR,

 ASSIGN,
 COMMA;

  public static boolean isUnary(Operation operation)
  {
    return operation == UNARY_MINUS || operation == UNARY_LOGICAL_NOT || operation == UNARY_BITWISE_NOT;
  }

  public static boolean isLeftAssoc(Operation operation)
  {
    return !isUnary(operation) && operation != ASSIGN && operation != POWER && operation != COMMA;
  }
}