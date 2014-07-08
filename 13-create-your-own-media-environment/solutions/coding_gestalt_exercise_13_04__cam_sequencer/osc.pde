

import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress remote;

void setupOSC() {
   osc = new OscP5(this, localport);
   remote = new NetAddress(remotehost, remoteport);
}

// has the scanner entered a face?
void faceEntered(int face, int ypos) {
  
  println("SEND: Cell Entered (" + face + ", " + ypos +")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/note");
  msg.add(face).add(ypos);
  osc.send(msg, remote);  
  
}

// has the scanner left a face?
void faceLeft(int face, int ypos) {
  
  println("SEND: Face Left (" + face + ", " + ypos + ")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/note");
  msg.add(face).add(ypos);
  osc.send(msg, remote);  
 
}

