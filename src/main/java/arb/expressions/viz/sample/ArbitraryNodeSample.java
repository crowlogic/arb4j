package arb.expressions.viz.sample;

import java.io.IOException;

import arb.expressions.viz.sample.SamplerController.Sample;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.SubScene;
import javafx.scene.control.Label;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import net.kurobako.gesturefx.GesturePane;

public class ArbitraryNodeSample implements Sample {
	@Override
	public Node mkRoot() {
		try {
			Parent node = FXMLLoader.load(getClass().getResource("/ComplexScene.fxml"));
			node.setPickOnBounds(true);
			node.setMouseTransparent(false);

			GesturePane pane = new GesturePane(new SubScene(node, 500, 500));
			VBox.setVgrow(pane, Priority.ALWAYS);
			Label description = new Label("Zoom and scroll on the SubScene below, " +
					"observe that controls in JavaFX are vectors " +
					"and that lighting effects are respected" +
					"(different zoom alters light distance). Gestures still work when the mouse " +
					"event is consumed(e.g the bottom black bar)");
			description.setWrapText(true);
			description.setPadding(new Insets(16));
			return new VBox(description, pane);

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
}
