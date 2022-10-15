package arb.viz.chartingsamples;

import de.gsi.chart.axes.Axis;
import de.gsi.chart.plugins.Zoomer;
import javafx.beans.value.ChangeListener;
import javafx.scene.control.CheckBox;

public class MyZoomCheckBox extends
                                   CheckBox
{
  /**
   * @param zoom the zoom interactor
   * @param axis to be synchronised
   */
  public MyZoomCheckBox(Zoomer zoom, Axis axis)
  {
    super("enable zoom for axis '" + axis.getName() + "'");
    this.setSelected(!zoom.omitAxisZoomList().contains(axis) || Zoomer.isOmitZoom(axis));
    ChangeListener<? super Boolean> listener = (obj, o, n) ->
    {
      if (n.equals(o))
      {
        return;
      }
      if (Boolean.TRUE.equals(n))
      {
        zoom.omitAxisZoomList().remove(axis);
        Zoomer.setOmitZoom(axis, false); // alternative implementation
      }
      else
      {
        zoom.omitAxisZoomList().add(axis);
        Zoomer.setOmitZoom(axis, true); // alternative implementation
      }
    };
    this.selectedProperty().addListener(listener);
  }
}