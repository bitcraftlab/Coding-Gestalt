// Code adapted from
// http://shiffman.net/2010/11/13/streaming-video-with-udp-in-processing/

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import javax.imageio.ImageIO;
import java.net.InetAddress;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.net.DatagramPacket;

class SnapshotSender {
  
  DatagramSocket ds;
  
  SnapshotSender() {
    try {
      ds = new DatagramSocket();
    } 
    catch (SocketException e) {
      e.printStackTrace();
    }
  }

  void send(PImage img, InetAddress remote, int remoteport) {
   
    // We need a buffered image to do the JPG encoding
    int w = img.width;
    int h = img.height;
    BufferedImage b = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);

    // Transfer pixels from localFrame to the BufferedImage
    img.loadPixels();
    b.setRGB( 0, 0, w, h, img.pixels, 0, w);

    // Need these output streams to get image as bytes for UDP
    ByteArrayOutputStream baStream = new ByteArrayOutputStream();
    BufferedOutputStream bos = new BufferedOutputStream(baStream);

    // JPG compression into BufferedOutputStream
    // Requires try/catch
    try {
      ImageIO.write(b, "jpg", bos);
    } 
    catch (IOException e) {
      e.printStackTrace();
    }

    // Get the byte array, which we will send out via UDP!
    byte[] packet = baStream.toByteArray();

    // Send JPEG data as a datagram
    println("Sending datagram with " + packet.length + " bytes to " + remote + ":" + remoteport);
    try {
      ds.send(new DatagramPacket(packet, packet.length, remote, snapshotport));
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}


