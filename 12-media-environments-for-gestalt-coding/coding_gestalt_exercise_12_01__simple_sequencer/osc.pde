
import oscP5.*;
import netP5.*;

String localhost = "127.0.0.1";
String remotehost = "127.0.0.1";
int localport = 12000;
int remoteport = 12001;

OscP5 osc;
NetAddress remote;

void setupOSC() {
   osc = new OscP5(this, localport);
   remote = new NetAddress(remotehost, remoteport);
}

// has he mouse pointer entered a cell?
void cell(int x, int y) {
  
  println("SEND: Cell Entered (" + x + ", " + y +")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/sequencer/cell");
  msg.add(x).add(y);
  osc.send(msg, remote);  
  
}



