package arb.expressions.viz;

import arb.Complex;
import arb.Fraction;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import javafx.util.StringConverter;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ContextVariableStringConverter<D, C, F extends Function<D, C>> extends
                                                 StringConverter<Named>
{

  private final ExpressionAnalyzer<D, C, F> expressionAnalyzer;

  /**
   * @param expressionAnalyzer
   */
  ContextVariableStringConverter(ExpressionAnalyzer<D, C, F> expressionAnalyzer)
  {
    this.expressionAnalyzer = expressionAnalyzer;
  }

  @Override
  public Named fromString(String string)
  {
    try
    {
      int    colon        = string.indexOf(':');
      String type         = string.substring(0, colon);
      int    namePosition = colon;
      while (string.charAt(++namePosition) == ' ');
      int    equalsPosition = string.indexOf('=', colon);
      String name           = string.substring(namePosition, equalsPosition);
      String value          = string.substring(equalsPosition + 1);

      switch (type)
      {
      case "Real":
        return Real.named(name).set(value, this.expressionAnalyzer.bits);
      case "Complex":
        return Complex.named(name).set(value, this.expressionAnalyzer.bits);
      case "Integer":
        return Integer.named(name).set(value);
      case "Fraction":
        return Fraction.named(name).set(value);
      default:
        String msg = String.format("TODO: handle type='%s'\nname='%s'\nvalue='%s'\n", type, name, value);
        expressionAnalyzer.showAlert("TODO", msg);
        assert false : msg;
        return null;
      }

    }
    catch (Throwable t)
    {
      expressionAnalyzer.showAlert(t.getClass().getName(), t.getMessage());
      t.printStackTrace(System.err);
      return null;
    }
  }

  @Override
  public String toString(Named object)
  {
    return object == null ? "null" : object.getClass().getSimpleName() + ": " + object.toString();
  }
}