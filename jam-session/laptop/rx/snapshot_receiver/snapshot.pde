// Code adapted from
// http://shiffman.net/2010/11/13/streaming-video-with-udp-in-processing/

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import javax.imageio.ImageIO;
import java.net.InetAddress;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.net.DatagramPacket;

class SnapshotReceiver {
  
  ReceiverThread thread;
  PImage img;
  
  SnapshotReceiver(PImage img, int remoteport) {
    this.img = img;
    thread = new ReceiverThread(img.width, img.height, remoteport);
    thread.start();
  } 
  
  void receive() {
    if (thread.available()) {
      img.set(0, 0, thread.getImage());
    }
  } 
}


class ReceiverThread extends Thread {

  DatagramSocket ds; 
  byte[] buffer = new byte[65536]; 

  boolean running;
  boolean available;
  PImage img;

  ReceiverThread (int w, int h, int remote_port) {
    img = createImage(w, h, RGB);
    running = false;
    available = true;

    try {
      ds = new DatagramSocket(remote_port);
    } catch (SocketException e) {
      e.printStackTrace();
    }
  }

  PImage getImage() {
    available = false;
    return img;
  }

  boolean available() {
    return available;
  }

  void start () {
    running = true;
    super.start();
  }

  void run () {
    while (running) {
      checkForImage();
      available = true;
    }
  }

  void checkForImage() {
    DatagramPacket p = new DatagramPacket(buffer, buffer.length); 
    try {
      ds.receive(p);
    } 
    catch (IOException e) {
      e.printStackTrace();
    } 
    byte[] data = p.getData();

    println("Received datagram with " + data.length + " bytes." );
    ByteArrayInputStream bais = new ByteArrayInputStream( data );

    img.loadPixels();
    try {
      BufferedImage bimg = ImageIO.read(bais);
      bimg.getRGB(0, 0, img.width, img.height, img.pixels, 0, img.width);
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    img.updatePixels();
  }

  void quit() {
    System.out.println("Quitting."); 
    running = false;
    interrupt();
  }
}
