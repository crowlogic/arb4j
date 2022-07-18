package arb.expression;

import java.util.*;

import arb.expression.Expression.*;

public class Builder
{
  private final static int            TOK_NUMBER      = 1;
  private final static int            TOK_WORD        = 2;
  private final static int            TOK_OP          = 4;
  private final static int            TOK_OPEN        = 8;
  private final static int            TOK_CLOSE       = 16;

  private final static int            PAREN_ALLOWED   = 0;
  private final static int            PAREN_EXPECTED  = 1;
  private final static int            PAREN_FORBIDDEN = 2;

  final static Map<String, Operation> OPS             = new HashMap<String, Operation>()
                                                      {
                                                        {
                                                          put("-u", Operation.UNARY_MINUS);
                                                          put("!u", Operation.UNARY_LOGICAL_NOT);
                                                          put("^u", Operation.UNARY_BITWISE_NOT);
                                                          put("**", Operation.POWER);
                                                          put("*", Operation.MULTIPLY);
                                                          put("/", Operation.DIVIDE);
                                                          put("%", Operation.REMAINDER);
                                                          put("+", Operation.PLUS);
                                                          put("-", Operation.MINUS);
                                                          put("<<", Operation.SHL);
                                                          put(">>", Operation.SHR);
                                                          put("<", Operation.LT);
                                                          put("<=", Operation.LE);
                                                          put(">", Operation.GT);
                                                          put(">=", Operation.GE);
                                                          put("==", Operation.EQ);
                                                          put("!=", Operation.NE);
                                                          put("&", Operation.BITWISE_AND);
                                                          put("^", Operation.BITWISE_XOR);
                                                          put("|", Operation.BITWISE_OR);
                                                          put("&&", Operation.LOGICAL_AND);
                                                          put("||", Operation.LOGICAL_OR);
                                                          put("=", Operation.ASSIGN);
                                                          put(",", Operation.COMMA);
                                                        }
                                                      };

  List<String> tokenize(String input)
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
          return null; // Parens mismatch
        }
      }
      else
      {
        if ((expected & TOK_OP) == 0)
        {
          if (c != '-' && c != '^' && c != '!')
          {
            return null; // Missing operand
          }
          tok = tok + c + 'u';
          pos++;
        }
        else
        {
          String lastOp = null;
          while (!Character.isLetter(c) && !Character.isDigit(c) && !Character.isWhitespace(c) && c != '_'
                        && c != '(' && c != ')' && pos < input.length())
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

  public Expression
         parse(String s, Map<String, VariableExpression> variableExpressions, Map<String, Function> functions)
  {
    if (variableExpressions == null)
    {
      variableExpressions = new HashMap<>();
    }
    Stack<String>     os     = new Stack<>();
    Stack<Expression> es     = new Stack<>();
    int               paren  = PAREN_ALLOWED;
    List<String>      tokens = tokenize(s);
    if (tokens == null)
    {
      return null;
    }
    for (String token : tokens)
    {
      paren = parseUnit(variableExpressions, functions, os, es, paren, token);
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
      Expression e = bind(op, es);
      if (e == null)
      {
        return null;
      }
      es.push(e);
    }
    if (es.isEmpty())
    {
      return new ConstantExpression(0);
    }
    else
    {
      return es.pop();
    }
  }

  protected int parseUnit(Map<String, VariableExpression> variableExpressions,
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
      parenNext = closeParenthesis(variableExpressions, functions, operands, expressions);
    }
    else if (parseFloat(token) != null)
    {
      expressions.push(new ConstantExpression(parseFloat(token)));
      parenNext = PAREN_FORBIDDEN;
    }
    else if (functions != null && functions.containsKey(token))
    {
      operands.push(token);
      parenNext = PAREN_EXPECTED;
    }
    else if (OPS.containsKey(token))
    {
      organizeOperands(operands, expressions, token);
    }
    else
    {
      if (variableExpressions.containsKey(token))
      {
        expressions.push(variableExpressions.get(token));
      }
      else
      {
        VariableExpression v = new VariableExpression(0);
        variableExpressions.put(token, v);
        expressions.push(v);
      }
      parenNext = PAREN_FORBIDDEN;
    }
    paren = parenNext;
    return paren;
  }

  protected void organizeOperands(Stack<String> os, Stack<Expression> es, String token)
  {
    Operation operation = OPS.get(token);
    String    o2        = os.isEmpty() ? null : os.peek();

    while (OPS.containsKey(o2) && ((Operation.isLeftAssoc(operation) && operation.ordinal() > OPS.get(o2).ordinal())
                  || (operation.ordinal() > OPS.get(o2).ordinal())))
    {
      Expression e = bind(o2, es);
      assert e != null;
      es.push(e);
      os.pop();
      o2 = os.isEmpty() ? null : os.peek();
    }
    os.push(token);
  }

  protected int closeParenthesis(Map<String, VariableExpression> variableExpressions,
                                 Map<String, Function> functions,
                                 Stack<String> os,
                                 Stack<Expression> es)
  {
    int parenNext;
    while (!os.isEmpty() && !os.peek().equals("(") && !os.peek().equals("{"))
    {
      Expression e = bind(os.pop(), es);
      assert e != null;
      es.push(e);
    }
    assert !os.isEmpty();
    if (os.pop().equals("{"))
    {
      Function<?>      f    = functions.get(os.pop());
      List<Expression> args = new ArrayList<Expression>();
      if (!es.isEmpty())
      {
        Expression e = es.pop();
        while (e != null)
        {
          if (e instanceof BinaryBinary)
          {
            BinaryBinary binExpr = (BinaryBinary) e;
            if (binExpr.operation == Operation.COMMA)
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
      es.push(new FunctionalExpressionContext<>(f,
                                                args,
                                                variableExpressions));
    }
    parenNext = PAREN_FORBIDDEN;
    return parenNext;
  }

  private Expression bind(String s, Stack<Expression> stack)
  {
    if (OPS.containsKey(s))
    {
      Operation operation = OPS.get(s);
      if (Operation.isUnary(operation))
      {
        if (!stack.isEmpty() && stack.peek() == null)
        {
          return null; // Operand missing
        }
        return new UnaryExpression(operation,
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
        return new BinaryBinary(operation,
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