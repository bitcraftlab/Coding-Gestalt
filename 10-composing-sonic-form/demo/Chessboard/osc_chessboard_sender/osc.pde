
import oscP5.*;
import netP5.*;

String localhost = "127.0.0.1";
String remotehost = "127.0.0.1";
int localport = 12001;
int remoteport = 12000;

OscP5 osc;
NetAddress remote;

void setupOSC() {
   osc = new OscP5(this, localport);
   remote = new NetAddress(remotehost, remoteport);
}

// has he mouse pointer entered a cell?
void cellEntered(int x, int y) {
  
  // println("SEND: Cell Entered (" + x + ", " + y +")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/chess/cellEntered");
  msg.add(x).add(y);
  osc.send(msg, remote);  
  
}

// has the mouse pointer left a cell?
void cellLeft(int x, int y) {
  
  // println("SEND: Cell Left (" + x + ", " + y + ")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/chess/cellLeft");
  msg.add(x).add(y);
  osc.send(msg, remote);  
 
}



