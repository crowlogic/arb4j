package arb.algebraic.expressions;

public class BinaryExpression implements
                              Expression
{
  final Operators  operators;
  final Expression a;
  final Expression b;

  public BinaryExpression(Operators operators, Expression a, Expression b)
  {
    this.operators = operators;
    this.a         = a;
    this.b         = b;
  }

  public float evaluate()
  {
    switch (this.operators)
    {
    case POWER:
      return (float) Math.pow(this.a.evaluate(), this.b.evaluate());
    case MULTIPLY:
      return this.a.evaluate() * this.b.evaluate();
    case DIVIDE:
      return this.a.evaluate() / this.b.evaluate();
    case REMAINDER:
    case PLUS:
      return this.a.evaluate() + this.b.evaluate();
    case MINUS:
      return this.a.evaluate() - this.b.evaluate();
    case SHL:
      return (int) this.a.evaluate() << (int) this.b.evaluate();
    case SHR:
      return (int) this.a.evaluate() >>> (int) this.b.evaluate();
    case LT:
      return this.a.evaluate() < this.b.evaluate() ? 1 : 0;
    case LE:
      return this.a.evaluate() <= this.b.evaluate() ? 1 : 0;
    case GT:
      return this.a.evaluate() > this.b.evaluate() ? 1 : 0;
    case GE:
      return this.a.evaluate() >= this.b.evaluate() ? 1 : 0;
    case EQ:
      return this.a.evaluate() == this.b.evaluate() ? 1 : 0;
    case NE:
      return this.a.evaluate() != this.b.evaluate() ? 1 : 0;
    case BITWISE_AND:
      return (int) this.a.evaluate() & (int) this.b.evaluate();
    case BITWISE_OR:
      return (int) this.a.evaluate() | (int) this.b.evaluate();
    case BITWISE_XOR:
      return (int) this.a.evaluate() ^ (int) this.b.evaluate();
    case LOGICAL_AND:
      return this.a.evaluate() != 0 ? this.b.evaluate() : 0;
    case LOGICAL_OR:
      float cond = this.a.evaluate();
      return cond != 0 ? cond : this.b.evaluate();
    case ASSIGN:
      float rhs = this.b.evaluate();
      ((Variable) this.a).set(rhs);
      return rhs;
    case COMMA:
      this.a.evaluate();
      return this.b.evaluate();
    default:
      return 0;
    }
  }
}