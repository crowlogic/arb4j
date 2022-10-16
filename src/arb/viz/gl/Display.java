package arb.viz.gl;

public class Display
{

  private int    WIDTH      = 3200;
  private int    HEIGHT     = 1400;

  private double renderPart = 0.75;

  /**
   * Get width
   * 
   * @return width
   */
  public int getWidth()
  {
    return WIDTH;
  }

  /**
   * Get height
   * 
   * @return height
   */
  public int getHeight()
  {
    return HEIGHT;
  }

  /**
   * Set width
   * 
   * @param width width to set
   */
  public void setWidth(int width)
  {
    WIDTH = width;
  }

  /**
   * Set height
   * 
   * @param height height to set
   */
  public void setHeight(int height)
  {
    HEIGHT = height;
  }

  /**
   * Set size
   * 
   * @param width  width to set
   * @param height height to set
   */
  public void setSize(int width, int height)
  {
    setWidth(width);
    setHeight(height);
  }

  /**
   * Get render part
   * 
   * @return width of render part
   */
  public double getRenderPart()
  {
    return renderPart;
  }

  /**
   * Get not render part
   * 
   * @return width of not render part
   */
  public double getNotRenderPart()
  {
    return 1 - renderPart;
  }
}
