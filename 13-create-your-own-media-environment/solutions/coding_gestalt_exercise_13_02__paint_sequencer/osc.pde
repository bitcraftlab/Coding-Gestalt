
import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress remote;

void setupOSC() {
   osc = new OscP5(this, localport);
   remote = new NetAddress(remotehost, remoteport);
}

// has the scanner entered a pixel?
void pixelEntered(int pixel, int ypos) {
  
  println("SEND: Pixel Entered (" + pixel + ", " + ypos +")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/sound/start");
  msg.add(pixel).add(ypos);
  osc.send(msg, remote);  
  
}

// has the scanner left a pixel?
void pixelLeft(int pixel, int ypos) {
  
  println("SEND: Pixel Left (" + pixel + ", " + ypos + ")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/sound/stop");
  msg.add(pixel).add(ypos);
  osc.send(msg, remote);  
 
}

