package arb.algebraic.expressions;

import arb.algebraic.expressions.operators.unary.Minus;
import arb.algebraic.expressions.operators.unary.UnaryOperator;

/**
 * operators are constructs defined within programming languages which behave
 * generally like functions, but which differ syntactically or semantically.
 * 
 * Common simple examples include arithmetic = new Operator(e.g. addition with
 * ), comparison = new Operator(e.g. "greater than" with >), and logical
 * operations = new Operator(e.g. AND, also written && in some languages). More
 * involved examples include assignment = new Operator(usually = new Operator(
 * or := new Operator(), field access in a record or object = new
 * Operator(usually .), and the scope resolution operator = new Operator(often
 * :: or .). Languages usually define a set of built-in operators, and in some
 * cases allow users to add new meanings to existing operators or even define
 * completely new operators.
 *
 * @see <a href= new Operator(
 *      "https://en.wikipedia.org/wiki/Operator_= new Operator(computer_programming)">Wikipedia</a>
 */
public class Operator<X,Y>
{
  public final int opcode;

  public Operator(int opcode)
  {
    this.opcode = opcode;
  }


  public static final Operator      POWER             = new Operator(4);
  public static final Operator      MULTIPLY          = new Operator(5);
  public static final Operator      DIVIDE            = new Operator(6);
  public static final Operator      REMAINDER         = new Operator(7);

  public static final Operator      PLUS              = new Operator(8);
  public static final Operator      MINUS             = new Operator(9);

  public static final Operator      SHL               = new Operator(10);
  public static final Operator      SHR               = new Operator(11);

  public static final Operator      LT                = new Operator(12);
  public static final Operator      LE                = new Operator(13);
  public static final Operator      GT                = new Operator(14);
  public static final Operator      GE                = new Operator(15);
  public static final Operator      EQ                = new Operator(16);
  public static final Operator      NE                = new Operator(17);

  public static final Operator      BITWISE_AND       = new Operator(18);
  public static final Operator      BITWISE_OR        = new Operator(19);
  public static final Operator      BITWISE_XOR       = new Operator(20);

  public static final Operator      LOGICAL_AND       = new Operator(21);
  public static final Operator      LOGICAL_OR        = new Operator(22);

  public static final Operator      ASSIGN            = new Operator(23);
  public static final Operator      COMMA             = new Operator(24);

  public static boolean isUnary(Operator operator)
  {
    return operator instanceof UnaryOperator;
  }

  public static boolean isLeftAssoc(Operator operators)
  {
    return !isUnary(operators) && operators.opcode != ASSIGN.opcode && operators.opcode != POWER.opcode
                  && operators.opcode != COMMA.opcode;
  }

  public X evaluate(Y arg)
  {
    assert false : "TODO";
    return null;
  }

  public int ordinal()
  {
    return opcode;
    
  }
}