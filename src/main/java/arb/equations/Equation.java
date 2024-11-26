package arb.equations;

import static arb.utensils.Utensils.throwOrWrap;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
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

  final Class<? extends C> coDomainType;
  final Class<? extends F> functionType;
  final Class<? extends D> domainType;
  private Context          context;

  public Equation(Class<? extends D> domainType,
                  Class<? extends C> coDomainType,
                  Class<? extends F> functionClass,
                  F leftSide,
                  F rightSide)
  {
    super();
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
    this.domainType   = domainType;
    this.coDomainType = coDomainType;
    this.functionType = functionClass;
    this.context      = context;
    parse(equationString);
  }

  public Equation(Class<? extends D> domainType,
                  Class<? extends C> coDomainType,
                  Class<? extends F> functionClass,
                  String equationString)
  {
    super();
    this.domainType   = domainType;
    this.coDomainType = coDomainType;
    this.functionType = functionClass;
    parse(equationString);
  }

  F                           leftSide;
  F                           rightSide;
  private Expression<D, C, F> lhs;
  private Expression<D, C, F> rhs;

  private void parse(String string)
  {
    lhs = Function.parse(Parser.expressionToUniqueClassname(string),
                         string,
                         context,
                         domainType,
                         coDomainType,
                         functionType,
                         string,
                         null);
    lhs.require('=');
    string = string.substring(lhs.position + 1, string.length());
    rhs    = Function.parse(Parser.expressionToUniqueClassname(string),
                            string,
                            context,
                            domainType,
                            coDomainType,
                            functionType,
                            string,
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

}