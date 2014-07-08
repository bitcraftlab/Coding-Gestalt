
import oscP5.*;
import netP5.*;

String[] oscAddress =  { "/sound/start", "/sound/stop" };
String[] oscMethod  =  { "soundStart", "soundStop" };

OscP5 osc;

void setupOSC() {
  
   // initialize OSC
   osc = new OscP5(this, localport);
   
   // plug osc messages into callback methods
   for(int i = 0; i < oscAddress.length; i++) {
     osc.plug(this, oscMethod[i], oscAddress[i]);
   }
   
}

  
public void soundStart(int x, int y) {
  
  println("RECEIVE: Sound Start (" + x + ", " + y +")");
  int pick = x % numSamples;
  samples[pick].trigger();
  
}

public void soundStop(int x, int y) {
  
  println("RECEIVE: Sound Stop (" + x + ", " + y +")");
  int pick = x % numSamples;
  samples[pick].stop();

}

// Show which OSC events were received but ignored
void oscEvent(OscMessage msg) {
  if(!msg.isPlugged()) {
    println("Unhandled OSC message " + msg.addrPattern() + "(" + msg.typetag());
  }
}

