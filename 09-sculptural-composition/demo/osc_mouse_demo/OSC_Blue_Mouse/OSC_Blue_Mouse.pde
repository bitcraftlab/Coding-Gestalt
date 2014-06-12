///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 09      -   Demo 01                  //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//              OSC MOUSE DEMO                   //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  This is an example of how to hook up two     //
//  sketches running on the same computer        //
//  using Open Sound Control.                    //
//                                               //
//  The only difference between the sketches     //
//  is the mouse and networking info inside      //
//  the config tab.                              //
//                                               //
///////////////////////////////////////////////////

import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress remote;

// OSC
String oscAddress = "/test";
String oscTypetag = "iiif";

// Display
String title;
int width = 1000;
int height = 250;
float mouseAlpha = 50;
float r = 64;
float r2 = 40;
float d = 40;


// Default data for the remote mouse
color remoteMouseColor = color(100);
int remoteMouseX = height/2;
int remoteMouseY = height/2;

// Mouse data
float mouseAngle, remoteMouseAngle;


void setup() {
  
   // setup the canvas
   size(width, height); 
   frameRate(60);
   textFont(createFont("Futura-MediumItalic", 48, true));
   title = this.getClass().getName() + ":" +  localport;
   
   // listen at local port  
   osc = new OscP5(this, localport);
   
   // send to remote port
   remote = new NetAddress(remotehost , remoteport);
   
}

void draw() {
  
  smooth(16);
  background(255);
  
  // show sketch title
  fill(200);
  textAlign(CENTER);
  text(title, width/2, height/2 + textDescent());
  
  // set local mouse angle
  mouseAngle = mouseSpin * frameCount;
  
  // draw local mouse cursor
  drawCursor(mouseX, mouseY, mouseColor, mouseAngle);
  
  // draw remote mouse cursor
  drawCursor(remoteMouseX, remoteMouseY, remoteMouseColor, remoteMouseAngle);
  
}


void drawCursor(int x, int y, color c, float angle) {
  pushMatrix();
  fill(c, mouseAlpha);
  stroke(0, mouseAlpha * 1.5);
  translate(x, y);
  ellipse(0, 0, r, r);
  fill(c, mouseAlpha);
  rotate(angle);
  ellipse(0, 0, r2, r2);
  line(- d, 0, +d, 0);
  line(0, 0 - d, 0, +d);
  popMatrix();
}



// send an OSC signal every time we move the mouse
void mouseMoved() {
   
  // message sending
  OscMessage msg = new OscMessage(oscAddress);
  msg.add(mouseX).add(mouseY).add(mouseColor).add(mouseAngle);
  osc.send(msg, remote);  
  
  println("sent: ", mouseX, mouseY, mouseColor, mouseAngle);
  
}


void oscEvent(OscMessage msg) {

  // message checking
  if(msg.checkAddrPattern(oscAddress) && msg.checkTypetag(oscTypetag)) {
      
    // message parsing
    remoteMouseX = msg.get(0).intValue();  
    remoteMouseY = msg.get(1).intValue();
    remoteMouseColor = msg.get(2).intValue();
    remoteMouseAngle = msg.get(3).floatValue();
    
    println("received: ", remoteMouseX, remoteMouseY, remoteMouseColor, remoteMouseAngle);
   
  } 
  
}

