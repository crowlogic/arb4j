package arb.equations;

import static arb.utensils.Utensils.throwOrWrap;

import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.language.Sentence;
import arb.language.Word;
import arb.logic.Clause;
import arb.logic.Proposition;
import arb.logic.RegularProposition;

/**
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Equation<D, C, F extends Function<? extends D, ? extends C>> implements
                     RegularProposition
{

  public Class<? extends C> coDomainType;
  public Class<? extends F> functionType;
  public Class<? extends D> domainType;
  public Context            context;

  public Equation(Class<? extends D> domainType,
                  Class<? extends C> coDomainType,
                  Class<? extends F> functionClass,
                  F leftSide,
                  F rightSide)
  {
    super();
    initialize(domainType, coDomainType, functionClass, leftSide, rightSide);
  }

  public void initialize(Class<? extends D> domainType,
                         Class<? extends C> coDomainType,
                         Class<? extends F> functionClass,
                         F leftSide,
                         F rightSide)
  {
    this.leftSide     = leftSide;
    this.rightSide    = rightSide;
    this.domainType   = domainType;
    this.coDomainType = coDomainType;
    this.functionType = functionClass;
  }

  public Equation(Class<? extends D> domainType,
                  Class<? extends C> coDomainType,
                  Class<? extends F> functionClass,
                  String equationString,
                  Context context)
  {
    super();
    initialize(domainType, coDomainType, functionClass, equationString, context);
  }

  public void initialize(Class<? extends D> domainType,
                         Class<? extends C> coDomainType,
                         Class<? extends F> functionClass,
                         String equationString,
                         Context context)
  {
    initialize(domainType, coDomainType, functionClass, context);
    parse(equationString);
  }

  public void initialize(Class<? extends D> domainType,
                         Class<? extends C> coDomainType,
                         Class<? extends F> functionClass,
                         Context context)
  {
    this.domainType   = domainType;
    this.coDomainType = coDomainType;
    this.functionType = functionClass;
    this.context      = context;
  }

  public Equation(Class<? extends D> domainType,
                  Class<? extends C> coDomainType,
                  Class<? extends F> functionClass,
                  String equationString)
  {
    super();
    initialize(domainType, coDomainType, functionClass, equationString);
  }

  public Equation(Class<? extends D> domainType,
                  Class<? extends C> coDomainType,
                  Class<? extends F> functionClass,
                  Context context)
  {
    initialize(domainType, coDomainType, functionClass, context);
  }

  public void initialize(Class<? extends D> domainType,
                         Class<? extends C> coDomainType,
                         Class<? extends F> functionClass,
                         String equationString)
  {
    this.domainType   = domainType;
    this.coDomainType = coDomainType;
    this.functionType = functionClass;
    parse(equationString);
  }

  public F                   leftSide;
  public F                   rightSide;
  public Expression<D, C, F> lhs;
  public Expression<D, C, F> rhs;

  private void parse(String string)
  {
    lhs = Function.parse("lhs" + Parser.expressionToUniqueClassname(string),
                         string,
                         context,
                         domainType,
                         coDomainType,
                         functionType,
                         "lhs",
                         null);
    lhs.require('=');
    string = string.substring(lhs.position - 1, string.length());
    rhs    = Function.parse("rhs" + Parser.expressionToUniqueClassname(string),
                            string,
                            context,
                            domainType,
                            coDomainType,
                            functionType,
                            "rhs",
                            null);
    try
    {
      leftSide  = lhs.instantiate();
      rightSide = rhs.instantiate();
    }
    catch (Exception e)
    {
      throwOrWrap(e);
    }

  }

  @Override
  public String toString()
  {
    return String.format("Equation[coDomainType=%s, functionType=%s, domainType=%s, context=%s, leftSide=%s, rightSide=%s, lhs=%s, rhs=%s]",
                         coDomainType,
                         functionType,
                         domainType,
                         context,
                         leftSide,
                         rightSide,
                         lhs,
                         rhs);
  }

  @Override
  public <C extends Clause<Word, Sentence<Word>, Proposition<Word, Sentence<Word>>>> Stream<? extends C> structure()
  {
    assert false : "TODO";
    return null;
  }

}