package arb.expressions.viz.sample;

import arb.expressions.viz.sample.SamplerController.Sample;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;

public class FXMLSample implements
                        Sample
{

  @Override
  public Node mkRoot()
  {
    try
    {
      return FXMLLoader.load(getClass().getResource("/FXML.fxml"));
    }
    catch (Exception e)
    {
      throw new RuntimeException(e);
    }
  }
}
