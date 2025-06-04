package arb.expressions.context;

import java.util.List;

import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.collections.ListChangeListener;
import javafx.collections.ObservableList;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ContextVariableChange extends
                                         ListChangeListener.Change<Named>
{
  public final Variables vars;
  private final int       index;
  private boolean         invalid = true;

  public ContextVariableChange(Variables variables, ObservableList<Named> list, int index)
  {
    super(list);
    vars       = variables;
    this.index = index;
  }

  @Override
  public boolean next()
  {
    if (invalid)
    {
      invalid = false;
      return true;
    }
    return false;
  }

  @Override
  public void reset()
  {
    invalid = true;
  }

  @Override
  public boolean wasReplaced()
  {
    return true;
  }

  @Override
  public boolean wasRemoved()
  {
    return false;
  }

  @Override
  public boolean wasAdded()
  {
    return false;
  }

  @Override
  public int getRemovedSize()
  {
    return 0;
  }

  @Override
  public List<Named> getRemoved()
  {
    return null;
  }

  @Override
  public int getTo()
  {
    return index + 1;
  }

  @Override
  public int getFrom()
  {
    return index;
  }

  @Override
  protected int[] getPermutation()
  {
    return new int[0];
  }
}