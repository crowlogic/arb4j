package arb.expressions;

/**
 * operators are constructs defined within programming languages which behave
 * generally like functions, but which differ syntactically or semantically.
 * 
 * Common simple examples include arithmetic (e.g. addition with ), comparison
 * (e.g. "greater than" with >), and logical operations (e.g. AND, also written
 * && in some languages). More involved examples include assignment (usually =
 * or :=), field access in a record or object (usually .), and the scope
 * resolution operator (often :: or .). Languages usually define a set of
 * built-in operators, and in some cases allow users to add new meanings to
 * existing operators or even define completely new operators.
 *
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Operator_(computer_programming)">Wikipedia</a>
 */
public enum Operators
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

  public static boolean isUnary(Operators operators)
  {
    return operators == UNARY_MINUS || operators == UNARY_LOGICAL_NOT || operators == UNARY_BITWISE_NOT;
  }

  public static boolean isLeftAssoc(Operators operators)
  {
    return !isUnary(operators) && operators != ASSIGN && operators != POWER && operators != COMMA;
  }
}