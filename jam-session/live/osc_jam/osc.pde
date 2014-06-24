
import oscP5.*;
import netP5.*;

String localhost = "127.0.0.1";
String netaddress = "192.168.1.";

int localport = 12001;
int remoteport = 12001;

OscP5 osc;
// NetAddress shin, will, luis, riha, clem, adri, laur, evar, mart;

int shin_id = 237;
int will_id = 150;
int luis_id = 146;
int riha_id = 121;
int clem_id = 135;
int adri_id = 214;
int laur_id = 110;
int evar_id = 115;
int mart_id = 145;

String[] oscAddress =  { "/shin", "/clem" };
String[] oscMethod  =  { "shinCalled", "clemCalled" };

void setupOSC() {
  osc = new OscP5(this, localport);

   // plug osc messages into callback methods
   for(int i = 0; i < oscAddress.length; i++) {
     osc.plug(this, oscMethod[i], oscAddress[i]);
   }
   
}

/// SENDING ///

void sendTo(int id, int x, int y) {

  String remotehost = netaddress + id;
  NetAddress addr = new NetAddress(remotehost, remoteport);

  OscMessage msg = new OscMessage("/mart");
  msg.add(x).add(y);
  osc.send(msg, addr);
}

/// RECEIVING ///

// Show which OSC events were received but ignored
void oscEvent(OscMessage msg) {
  if (!msg.isPlugged()) {
    println("Unhandled OSC message " + msg.addrPattern() + "(" + msg.typetag());
  }
}

void clemCalled(int x, int y) {
   soundEvent(100, y);
}

void shinCalled(int x, int y) {
   soundEvent(200, y);
}

