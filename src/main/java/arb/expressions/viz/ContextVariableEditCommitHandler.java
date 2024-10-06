package arb.expressions.viz;

import java.io.Closeable;

import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Variables;
import arb.functions.Function;
import javafx.event.EventHandler;
import javafx.scene.control.ListView;
import javafx.scene.control.ListView.EditEvent;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ContextVariableEditCommitHandler<D, C extends Closeable, F extends Function<D, C>> implements
                                                   EventHandler<ListView.EditEvent<Named>>
{
  /**
   * 
   */
  private final Analyzer<D, C, F> analyzer;

  /**
   * @param analyzer
   */
  ContextVariableEditCommitHandler(Analyzer<D, C, F> analyzer)
  {
    this.analyzer = analyzer;
  }

  @Override
  public void handle(EditEvent<Named> event)
  {
    int       index     = event.getIndex();
    Named     newValue  = event.getNewValue();
    Variables variables = this.analyzer.getCurrentContext().variables;

    if (newValue == null)
    {
      // Conversion failed, keep the original value
      return;
    }

    Named  oldValue = variables.get(index);
    String oldName  = oldValue.getName();
    String newName  = newValue.getName();

    if (!oldName.equals(newName))
    {
      // Name changed, handle rename
      variables.rename(oldName, newName);
    }

    // Update the value (this will handle both value changes and name changes)
    variables.set(index, newValue);
  }
}