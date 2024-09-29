package arb.expressions.viz.context;

import arb.Complex;
import arb.Fraction;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.viz.Analyzer;
import arb.functions.Function;
import javafx.util.StringConverter;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ContextVariableStringConverter<D, C, F extends Function<D, C>> extends
                                                 StringConverter<Named>
{

  private final Analyzer<D, C, F> analyzer;

  /**
   * @param expressionAnalyzer
   */
  public ContextVariableStringConverter(Analyzer<D, C, F> expressionAnalyzer)
  {
    this.analyzer = expressionAnalyzer;
  }

  @Override
  public Named fromString(String string)
  {
    try
    {
      int colon = string.indexOf(':');
      if (colon == -1)
      {
        String msg = "Missing ':'. The format is 'Type: name=value'";
        analyzer.showAlert("Syntax Error", msg, new IllegalArgumentException(msg));
        return null;
      }
      String type         = string.substring(0, colon);
      int    namePosition = colon;
      while (string.charAt(++namePosition) == ' ');
      int    equalsPosition = string.indexOf('=', colon);
      String name           = string.substring(namePosition, equalsPosition);
      String value          = string.substring(equalsPosition + 1);

      switch (type)
      {
      case "Real":
        return Real.named(name).set(value, this.analyzer.bits);
      case "Complex":
        return Complex.named(name).set(value, this.analyzer.bits);
      case "Integer":
        return Integer.named(name).set(value);
      case "Fraction":
        return Fraction.named(name).set(value);
      default:
        String msg = String.format("TODO: handle type='%s'\nname='%s'\nvalue='%s'\n", type, name, value);
        analyzer.showAlert("TODO", msg);
        assert false : msg;
        return null;
      }

    }
    catch (Throwable t)
    {
      analyzer.showAlert(t.getClass().getName(), "Problem with context variable format", t);
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