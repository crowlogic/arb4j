package arb.algebraic.expressions;

import java.util.*;

/**
 * systematically schematizes {@link Expression}s with the
 * this{@link #parse(String, Map, Map)} method
 */
public class ExpressionParser
{
  private final static int            TOK_NUMBER      = 1;
  private final static int            TOK_WORD        = 2;
  private final static int            TOK_OP          = 4;
  private final static int            TOK_OPEN        = 8;
  private final static int            TOK_CLOSE       = 16;

  private final static int            PAREN_ALLOWED   = 0;
  private final static int            PAREN_EXPECTED  = 1;
  private final static int            PAREN_FORBIDDEN = 2;

  final static Map<String, Operators> OPS             = new HashMap<String, Operators>()
                                                      {
                                                        {
                                                          put("-u", Operators.UNARY_MINUS);
                                                          put("!u", Operators.UNARY_LOGICAL_NOT);
                                                          put("^u", Operators.UNARY_BITWISE_NOT);
                                                          put("**", Operators.POWER);
                                                          put("*", Operators.MULTIPLY);
                                                          put("/", Operators.DIVIDE);
                                                          put("%", Operators.REMAINDER);
                                                          put("+", Operators.PLUS);
                                                          put("-", Operators.MINUS);
                                                          put("<<", Operators.SHL);
                                                          put(">>", Operators.SHR);
                                                          put("<", Operators.LT);
                                                          put("<=", Operators.LE);
                                                          put(">", Operators.GT);
                                                          put(">=", Operators.GE);
                                                          put("==", Operators.EQ);
                                                          put("!=", Operators.NE);
                                                          put("&", Operators.BITWISE_AND);
                                                          put("^", Operators.BITWISE_XOR);
                                                          put("|", Operators.BITWISE_OR);
                                                          put("&&", Operators.LOGICAL_AND);
                                                          put("||", Operators.LOGICAL_OR);
                                                          put("=", Operators.ASSIGN);
                                                          put(",", Operators.COMMA);
                                                        }
                                                      };

  /**
   * Splits a string into component strings by applying the appropriate grammar
   * and syntax
   * 
   * @param input
   * @return a {@link List} of {@link String}s constituting the input expression
   */
  public List<String> split(String input)
  {
    int          pos      = 0;
    int          expected = TOK_OPEN | TOK_NUMBER | TOK_WORD;
    List<String> tokens   = new ArrayList<>();
    while (pos < input.length())
    {
      String tok = "";
      char   c   = input.charAt(pos);
      if (Character.isWhitespace(c))
      {
        pos++;
        continue;
      }
      if (Character.isDigit(c))
      {
        if ((expected & TOK_NUMBER) == 0)
        {
          return null; // unexpected number
        }
        expected = TOK_OP | TOK_CLOSE;
        while ((c == '.' || Character.isDigit(c)) && pos < input.length())
        {
          tok = tok + input.charAt(pos);
          pos++;
          if (pos < input.length())
          {
            c = input.charAt(pos);
          }
          else
          {
            c = 0;
          }
        }
      }
      else if (Character.isLetter(c))
      {
        if ((expected & TOK_WORD) == 0)
        {
          return null; // Unexpected identifier
        }
        expected = TOK_OP | TOK_OPEN | TOK_CLOSE;
        while ((Character.isLetter(c) || Character.isDigit(c) || c == '_') && pos < input.length())
        {
          tok = tok + input.charAt(pos);
          pos++;
          if (pos < input.length())
          {
            c = input.charAt(pos);
          }
          else
          {
            c = 0;
          }
        }
      }
      else if (c == '(' || c == ')')
      {
        tok = tok + c;
        pos++;
        if (c == '(' && (expected & TOK_OPEN) != 0)
        {
          expected = TOK_NUMBER | TOK_WORD | TOK_OPEN | TOK_CLOSE;
        }
        else if (c == ')' && (expected & TOK_CLOSE) != 0)
        {
          expected = TOK_OP | TOK_CLOSE;
        }
        else
        {
          assert false : "parenthesis mismatch";
          return null; // Parens mismatch
        }
      }
      else
      {
        if ((expected & TOK_OP) == 0)
        {
          if (c != '-' && c != '^' && c != '!')
          {
            assert false : "missing operand";
            return null; // Missing operand
          }
          tok = tok + c + 'u';
          pos++;
        }
        else
        {
          String lastOp = null;
          while (isNotASpecialCharacter(c) && pos < input.length())
          {
            if (OPS.containsKey(tok + input.charAt(pos)))
            {
              tok    = tok + input.charAt(pos);
              lastOp = tok;
            }
            else if (lastOp == null)
            {
              tok = tok + input.charAt(pos);
            }
            else
            {
              break;
            }
            pos++;
            if (pos < input.length())
            {
              c = input.charAt(pos);
            }
            else
            {
              c = 0;
            }
          }
          if (lastOp == null)
          {
            return null; // Bad operator
          }
        }
        expected = TOK_NUMBER | TOK_WORD | TOK_OPEN;
      }
      tokens.add(tok);
    }
    return tokens;
  }

  protected boolean isNotASpecialCharacter(char c)
  {
    return !Character.isLetter(c) && !Character.isDigit(c) && !Character.isWhitespace(c) && c != '_' && c != '('
                  && c != ')';
  }

  public Expression parse(String s, Map<String, Variable> variables, Map<String, Function> functions)
  {
    if (variables == null)
    {
      variables = new HashMap<>();
    }
    Stack<String>     os          = new Stack<>();
    Stack<Expression> expressions = new Stack<>();
    int               paren       = PAREN_ALLOWED;
    List<String>      tokens      = split(s);
    if (tokens == null)
    {
      return null;
    }
    for (String token : tokens)
    {
      paren = parseUnit(variables, functions, os, expressions, paren, token);
    }
    if (paren == PAREN_EXPECTED)
    {
      return null; // Bad call
    }
    while (!os.isEmpty())
    {
      String op = os.pop();
      if (op.equals("(") || op.equals(")"))
      {
        return null; // Bad paren
      }
      Expression e = bind(op, expressions);
      if (e == null)
      {
        return null;
      }
      expressions.push(e);
    }
    if (expressions.isEmpty())
    {
      return new Constant(0);
    }
    else
    {
      return expressions.pop();
    }
  }

  protected int parseUnit(Map<String, Variable> variables,
                          Map<String, Function> functions,
                          Stack<String> operands,
                          Stack<Expression> expressions,
                          int paren,
                          String token)
  {
    int parenNext = PAREN_ALLOWED;
    if (token.equals("("))
    {
      if (paren == PAREN_EXPECTED)
      {
        operands.push("{");
      }
      else if (paren == PAREN_ALLOWED)
      {
        operands.push("(");
      }
      else
      {
        assert false; // bad call
      }
    }
    else if (paren == PAREN_EXPECTED)
    {
      assert false; // bad call
    }
    else if (token.equals(")"))
    {
      parenNext = closeParenthesis(variables, functions, operands, expressions);
    }
    else if (parseFloat(token) != null)
    {
      expressions.push(new Constant(parseFloat(token)));
      parenNext = PAREN_FORBIDDEN;
    }
    else if (functions != null && functions.containsKey(token))
    {
      operands.push(token);
      parenNext = PAREN_EXPECTED;
    }
    else if (OPS.containsKey(token))
    {
      Operators operators = OPS.get(token);
      String    o2        = operands.isEmpty() ? null : operands.peek();

      while (OPS.containsKey(o2)
                    && ((Operators.isLeftAssoc(operators) && operators.ordinal() > OPS.get(o2).ordinal())
                                  || (operators.ordinal() > OPS.get(o2).ordinal())))
      {
        Expression e = bind(o2, expressions);
        assert e != null;
        expressions.push(e);
        operands.pop();
        o2 = operands.isEmpty() ? null : operands.peek();
      }
      operands.push(token);
    }
    else
    {
      if (variables.containsKey(token))
      {
        expressions.push(variables.get(token));
      }
      else
      {
        Variable v = new Variable(0);
        variables.put(token, v);
        expressions.push(v);
      }
      parenNext = PAREN_FORBIDDEN;
    }
    paren = parenNext;
    return paren;
  }

  protected int closeParenthesis(Map<String, Variable> variables,
                                 Map<String, Function> functions,
                                 Stack<String> os,
                                 Stack<Expression> expressions)
  {
    int parenNext;
    while (!os.isEmpty() && !os.peek().equals("(") && !os.peek().equals("{"))
    {
      Expression e = bind(os.pop(), expressions);
      assert e != null;
      expressions.push(e);
    }
    assert !os.isEmpty();
    if (os.pop().equals("{"))
    {
      Function<?>      f    = functions.get(os.pop());
      List<Expression> args = new ArrayList<Expression>();
      if (!expressions.isEmpty())
      {
        Expression e = expressions.pop();

        while (e != null)
        {
          if (e instanceof BinaryExpression)
          {
            BinaryExpression binExpr = (BinaryExpression) e;
            if (binExpr.operators == Operators.COMMA)
            {
              args.add(binExpr.a);
              e = binExpr.b;
              continue;
            }
          }
          args.add(e);
          break;
        }
      }
      expressions.push(new FunctionalContext<>(f,
                                               args,
                                               variables));
    }
    parenNext = PAREN_FORBIDDEN;
    return parenNext;
  }

  private Expression bind(String s, Stack<Expression> stack)
  {
    if (OPS.containsKey(s))
    {
      Operators operators = OPS.get(s);
      if (Operators.isUnary(operators))
      {
        if (!stack.isEmpty() && stack.peek() == null)
        {
          return null; // Operand missing
        }
        return new UnaryExpression(operators,
                                   stack.pop());
      }
      else
      {
        Expression b = stack.pop();
        Expression a = stack.pop();
        if (a == null || b == null)
        {
          return null; // Operand missing
        }
        return new BinaryExpression(operators,
                                    a,
                                    b);
      }
    }
    else
    {
      return null; // Bad call
    }
  }

  private Float parseFloat(String s)
  {
    try
    {
      return Float.parseFloat(s);
    }
    catch (NumberFormatException e)
    {
      return null;
    }
  }
}