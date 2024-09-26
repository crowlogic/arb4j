package arb.expressions.viz;

import arb.Integer;
import javafx.beans.NamedArg;
import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.scene.control.SpinnerValueFactory;
import javafx.util.StringConverter;

/**
*
* @see BusinessSourceLicenseVersionOnePointOne © terms of the
*      {@link TheArb4jLibrary}
*/
public class IntegerSpinnerValueFactory extends
                                        SpinnerValueFactory<Integer>
{

  private final ObjectProperty<Integer> min            = new SimpleObjectProperty<>(this,
                                                                                    "min");
  private final ObjectProperty<Integer> max            = new SimpleObjectProperty<>(this,
                                                                                    "max");
  private final ObjectProperty<Integer> amountToStepBy = new SimpleObjectProperty<>(this,
                                                                                    "amountToStepBy");

  public IntegerSpinnerValueFactory(@NamedArg("min") Integer min,
                                    @NamedArg("max") Integer max,
                                    @NamedArg("initialValue") Integer initialValue,
                                    @NamedArg("amountToStepBy") Integer amountToStepBy)
  {
    setMin(min);
    setMax(max);
    setAmountToStepBy(amountToStepBy);
    setConverter(new StringConverter<Integer>()
    {
      @Override
      public String toString(Integer value)
      {
        if (value == null)
        {
          return "";
        }
        return value.toString();
      }

      @Override
      public Integer fromString(String string)
      {
        if (string == null || string.isEmpty())
        {
          return null;
        }
        return new Integer(string);
      }
    });

    valueProperty().addListener((o, oldValue, newValue) ->
    {
      if (newValue == null)
        return;

      if (newValue.compareTo(getMin()) < 0)
      {
        setValue(getMin());
      }
      else if (newValue.compareTo(getMax()) > 0)
      {
        setValue(getMax());
      }
    });

    setValue(initialValue != null ? initialValue : min);
  }

  public final void setMin(Integer value)
  {
    min.set(value);
  }

  public final Integer getMin()
  {
    return min.get();
  }

  public final ObjectProperty<Integer> minProperty()
  {
    return min;
  }

  public final void setMax(Integer value)
  {
    max.set(value);
  }

  public final Integer getMax()
  {
    return max.get();
  }

  public final ObjectProperty<Integer> maxProperty()
  {
    return max;
  }

  public final void setAmountToStepBy(Integer value)
  {
    amountToStepBy.set(value);
  }

  public final Integer getAmountToStepBy()
  {
    return amountToStepBy.get();
  }

  public final ObjectProperty<Integer> amountToStepByProperty()
  {
    return amountToStepBy;
  }

  @Override
  public void decrement(int steps)
  {
    Integer currentValue = getValue();
    Integer stepValue    = getAmountToStepBy().mul(new Integer(steps), 0);
    Integer newValue     = currentValue.sub(stepValue, 0);
    ;

    if (newValue.compareTo(getMin()) >= 0)
    {
      setValue(newValue);
    }
    else
    {
      setValue(getMin());
    }
  }

  @Override
  public void increment(int steps)
  {
    Integer currentValue = getValue();
    Integer stepValue    = getAmountToStepBy().mul(new Integer(steps), 0);
    Integer newValue     = currentValue.add(stepValue, 0);

    if (newValue.compareTo(getMax()) <= 0)
    {
      setValue(newValue);
    }
    else
    {
      setValue(getMax());
    }
  }
}