
import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress[] remotes;
boolean[] target;

void setupOSC() {
   osc = new OscP5(this, localport);
   int n =  osc_id.length;
   remotes = new NetAddress[n];
   target = new boolean[n];
   for(int i = 0; i < n; i++) {
     String remoteaddress = remoteprefix + osc_id[i];
     remotes[i] = new NetAddress(remoteaddress, remoteport);
   }
}


// use digit keys to toggle targets
void oscKeyPressed(int key) {
  
  // toggle individual targets
  if(key >= '1' && key <= '1' + target.length - 1) {
    int pick = key - '1';
    target[pick] = !target[pick];
  }
  
  // turn off all targets
  if(key == '0') {
     for(int i = 0; i < target.length; i++) {
       target[i] = false;
     }
  }
  showTargets();  
}

void showTargets() {
  println("============================");
  for(int i = 0; i < target.length; i++) {
    println(osc_name[i] + ": " + remoteprefix + osc_id[i] + " >>> " + (target[i] ? "ON" : "OFF"));
  }
}

// has the scanner entered a pixel?
void faceEntered(int id, int ypos) {
  
  println("SEND: Face Entered (" + id + ", " + ypos +")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/sound/start");
  msg.add(id).add(ypos);

  for(int i = 0; i < remotes.length; i++) {
    
    // only send message to a remote when it is set as a target
    if(target[i]) {
      osc.send(msg, remotes[i]);
    }
    
  }
 
  
}

// has the scanner left a pixel?
void faceLeft(int id, int ypos) {
  
  println("SEND: Face Left (" + id + ", " + ypos + ")");
  
  // create + send OSC message
  OscMessage msg = new OscMessage("/sound/stop");
  msg.add(id).add(ypos);
  
  // send a message to all remotes
  for(int i = 0; i < remotes.length; i++) {
  
      // only send message to a remote when it is set as a target
      if(target[i]) {
        osc.send(msg, remotes[i]); 
      }
      
  }
 
}

