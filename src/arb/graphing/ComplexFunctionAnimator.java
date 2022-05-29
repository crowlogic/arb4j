
package arb.graphing;

import static java.lang.System.out;

import java.awt.AWTException;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import javax.swing.JFrame;

import arb.graphing.plots.XPlotter;
import io.humble.video.Codec;
import io.humble.video.Encoder;
import io.humble.video.MediaPacket;
import io.humble.video.MediaPicture;
import io.humble.video.Muxer;
import io.humble.video.MuxerFormat;
import io.humble.video.PixelFormat;
import io.humble.video.Rational;
import io.humble.video.awt.MediaPictureConverter;
import io.humble.video.awt.MediaPictureConverterFactory;

public class ComplexFunctionAnimator
{
  public ComplexFunctionAnimator() throws NoninvertibleTransformException
  {
    plotter             = new XPlotter();
    frameEncodingThread = Executors.newSingleThreadExecutor();

  }

  private JFrame                frame;
  Robot                         robot;
  private Rectangle             screenbounds;
  private Rational              framerate;
  private Muxer                 muxer;
  private MuxerFormat           format;
  private Codec                 codec;
  private Encoder               encoder;
  private PixelFormat.Type      pixelformat;
  private MediaPictureConverter converter;
  private MediaPicture          picture;
  private MediaPacket           packet;
  private int                frameCount;
  private double                maxSize;
  private ExecutorService       frameEncodingThread;
  private XPlotter              plotter;

  public static void
         main(String[] args) throws InterruptedException, IOException, AWTException, NoninvertibleTransformException
  {
    ComplexFunctionAnimator animator = new ComplexFunctionAnimator();
    animator.renderAnimatedSequence("hmm.avi", "avi", "ffv1", 10, 20);
  }

  protected static void printInstalledCodecs()
  {
    for (Codec codec : Codec.getInstalledCodecs())
    {
      System.out.println("codec: " + codec);
    }
  }

  public BufferedImage renderFunction(int i, int frameCount) throws NoninvertibleTransformException, IOException
  {
    // FIXME: draw the parameter a= that the function is rendered with and extract
    // this frame# -> parameter setting idea into an interface
    plotter.function.f.scale.assign(0.1 + maxSize * ((double) i / frameCount));
    out.println("Drawing frame " + i + "/" + frameCount + " a=" + plotter.function.f.scale);

    BufferedImage image = convertToType(plotter.plot(), BufferedImage.TYPE_3BYTE_BGR);
//    plotter.frame.setVisible(false);
//    plotter.frame.hide();
    System.gc();
    return image;
  }

  public void renderAnimatedSequence(String filename,
                                     String formatname,
                                     String codecname,
                                     int duration,
                                     int snapsPerSecond) throws AWTException,
                                                         InterruptedException,
                                                         IOException,
                                                         NoninvertibleTransformException
  {

    robot        = new Robot();
    screenbounds = new Rectangle(XPlotter.width,
                                 XPlotter.height);
    framerate    = Rational.make(1, snapsPerSecond);
    muxer        = Muxer.make(filename, null, formatname);
    try
    {
      prepareEncoder(codecname, duration);

      for (int i = 0; i < frameCount; i++)
      {
        renderAndEncodeFrame(i);
      }

      frameEncodingThread.awaitTermination(Long.MAX_VALUE, TimeUnit.DAYS);
      flushCache();
    }
    finally
    {
      muxer.close();
    }
  }

  protected void prepareEncoder(String codecname, double seconds) throws InterruptedException, IOException
  {
    format = muxer.getFormat();
    if (codecname != null)
    {
      codec = Codec.findEncodingCodecByName(codecname);
    }
    else
    {
      codec = Codec.findEncodingCodec(format.getDefaultVideoCodecId());
    }

    encoder = Encoder.make(codec);
    encoder.setWidth(screenbounds.width);
    encoder.setHeight(screenbounds.height);
    pixelformat = PixelFormat.Type.PIX_FMT_YUV420P;
    encoder.setPixelFormat(pixelformat);
    encoder.setTimeBase(framerate);
    if (format.getFlag(MuxerFormat.Flag.GLOBAL_HEADER))
    {
      encoder.setFlag(Encoder.Flag.FLAG_GLOBAL_HEADER, true);
    }
    encoder.open(null, null);
    muxer.addNewStream(encoder);
    muxer.open(null, null);
    converter = null;
    picture   = MediaPicture.make(encoder.getWidth(), encoder.getHeight(), pixelformat);
    picture.setTimeBase(framerate);

    packet     = MediaPacket.make();
    frameCount = (int) (seconds / framerate.getDouble());
    maxSize    = 5;
  }

  private void flushCache()
  {
    do
    {
      encoder.encode(packet, null);
      if (packet.isComplete())
        muxer.write(packet, false);
    }
    while (packet.isComplete());
  }

  protected void renderAndEncodeFrame(int i) throws NoninvertibleTransformException, IOException
  {
    final BufferedImage screen = renderFunction( i, frameCount);

    /**
     * TODO: do this on a single-threaded work queue in the background so that the
     * other unutilized processors can be utilized without having to unnecessarily
     * wait on this step
     */
    encodeFrame(i, screen);
  }

  protected void encodeFrame(int i, final BufferedImage screen)
  {
    frameEncodingThread.execute(() ->
    {
      if (converter == null)
      {
        converter = MediaPictureConverterFactory.createConverter(screen, picture);
      }
      converter.toPicture(picture, screen, i);

      do
      {
        encoder.encode(packet, picture);
        if (packet.isComplete())
        {
          muxer.write(packet, false);
        }
      }
      while (packet.isComplete());
    });
  }

  /**
   * Convert a {@link BufferedImage} of any type, to {@link BufferedImage} of a
   * specified type. If the source image is the same type as the target type, then
   * original image is returned, otherwise new image of the correct type is
   * created and the content of the source image is copied into the new image.
   * 
   * @param sourceImage the image to be converted
   * @param targetType  the desired BufferedImage type
   * 
   * @return a BufferedImage of the specifed target type.
   * 
   * @see BufferedImage
   */

  public static BufferedImage convertToType(BufferedImage sourceImage, int targetType)
  {
    BufferedImage image;

    // if the source image is already the target type, return the source image

    if (sourceImage.getType() == targetType)
      image = sourceImage;

    // otherwise create a new image of the target type and draw the new
    // image

    else
    {
      image = new BufferedImage(sourceImage.getWidth(),
                                sourceImage.getHeight(),
                                targetType);
      image.getGraphics().drawImage(sourceImage, 0, 0, null);
    }

    return image;
  }

}