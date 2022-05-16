
package arblib.graphing;

import static java.lang.System.out;

import java.awt.AWTException;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.swing.JFrame;

import arblib.graphing.plots.XPlotter;
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
  private JFrame frame;

  /**
   * Records the screen
   * 
   * @throws NoninvertibleTransformException
   */
  private static void renderAnimationSequence(String filename,
                                              String formatname,
                                              String codecname,
                                              int duration,
                                              int snapsPerSecond) throws AWTException,
                                                                  InterruptedException,
                                                                  IOException,
                                                                  NoninvertibleTransformException
  {
    /**
     * Set up the AWT infrastructure to take screenshots of the desktop.
     */
    final Robot       robot        = new Robot();
    final Rectangle   screenbounds = new Rectangle(XPlotter.width, XPlotter.height );

    final Rational    framerate    = Rational.make(1, snapsPerSecond);

    /**
     * First we create a muxer using the passed in filename and formatname if given.
     */
    final Muxer       muxer        = Muxer.make(filename, null, formatname);

    /**
     * Now, we need to decide what type of codec to use to encode video. Muxers have
     * limited sets of codecs they can use. We're going to pick the first one that
     * works, or if the user supplied a codec name, we're going to force-fit that in
     * instead.
     */
    final MuxerFormat format       = muxer.getFormat();
    final Codec       codec;
    if (codecname != null)
    {
      codec = Codec.findEncodingCodecByName(codecname);
    }
    else
    {
      codec = Codec.findEncodingCodec(format.getDefaultVideoCodecId());
    }

    /**
     * Now that we know what codec, we need to create an encoder
     */
    Encoder encoder = Encoder.make(codec);

    /**
     * Video encoders need to know at a minimum: width height pixel format Some also
     * need to know frame-rate (older codecs that had a fixed rate at which video
     * files could be written needed this). There are many other options you can set
     * on an encoder, but we're going to keep it simpler here.
     */
    encoder.setWidth(screenbounds.width);
    encoder.setHeight(screenbounds.height);
    // We are going to use 420P as the format because that's what most video formats
    // these days use
    final PixelFormat.Type pixelformat = PixelFormat.Type.PIX_FMT_YUV420P;
    encoder.setPixelFormat(pixelformat);
    encoder.setTimeBase(framerate);

    /**
     * An annoynace of some formats is that they need global (rather than
     * per-stream) headers, and in that case you have to tell the encoder. And since
     * Encoders are decoupled from Muxers, there is no easy way to know this beyond
     */
    if (format.getFlag(MuxerFormat.Flag.GLOBAL_HEADER))
      encoder.setFlag(Encoder.Flag.FLAG_GLOBAL_HEADER, true);

    /** Open the encoder. */
    encoder.open(null, null);

    /** Add this stream to the muxer. */
    muxer.addNewStream(encoder);

    /** And open the muxer for business. */
    muxer.open(null, null);

    /**
     * Next, we need to make sure we have the right MediaPicture format objects to
     * encode data with. Java (and most on-screen graphics programs) use some
     * variant of Red-Green-Blue image encoding (a.k.a. RGB or BGR). Most video
     * codecs use some variant of YCrCb formatting. So we're going to have to
     * convert. To do that, we'll introduce a MediaPictureConverter object later.
     * object.
     */
    MediaPictureConverter converter = null;
    final MediaPicture    picture   = MediaPicture.make(encoder.getWidth(), encoder.getHeight(), pixelformat);
    picture.setTimeBase(framerate);

    /**
     * Now begin our main loop of taking screen snaps. We're going to encode and
     * then write out any resulting packets.
     */
    final MediaPacket packet     = MediaPacket.make();
    double            frameCount = duration / framerate.getDouble();

    for (int i = 0; i < frameCount; i++)
    {
      /** Make the screen capture && convert image to TYPE_3BYTE_BGR */
      final BufferedImage screen = renderFunction(i, 0.1 + (double) i / frameCount);

      /**
       * This is LIKELY not in YUV420P format, so we're going to convert it using some
       * handy utilities.
       */
      if (converter == null)
        converter = MediaPictureConverterFactory.createConverter(screen, picture);
      converter.toPicture(picture, screen, i);

      do
      {
        encoder.encode(packet, picture);
        if (packet.isComplete())
          muxer.write(packet, false);
      }
      while (packet.isComplete());

    }

    /**
     * Encoders, like decoders, sometimes cache pictures so it can do the right
     * key-frame optimizations. So, they need to be flushed as well. As with the
     * decoders, the convention is to pass in a null input until the output is not
     * complete.
     */
    do
    {
      encoder.encode(packet, null);
      if (packet.isComplete())
        muxer.write(packet, false);
    }
    while (packet.isComplete());

    /** Finally, let's clean up after ourselves. */
    muxer.close();
  }

  public static BufferedImage renderFunction(int i, double a) throws NoninvertibleTransformException, IOException
  {
    XPlotter plotter = new XPlotter(a);
    out.println("Drawing frame " + i + " a=" + a);
    BufferedImage image = convertToType(plotter.plot(), BufferedImage.TYPE_3BYTE_BGR);
    plotter.frame.setVisible(false);
    plotter.frame.hide();
    return image;
  }

  @SuppressWarnings("static-access")
  public static void
         main(String[] args) throws InterruptedException, IOException, AWTException, NoninvertibleTransformException
  {
    for (Codec codec : Codec.getInstalledCodecs())
    {
      System.out.println("codec: " + codec);
    }
    renderAnimationSequence("hmm.avi", "avi", "flv", 10, 2);
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