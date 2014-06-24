
///////////////////////////////////////////////////
//                                               //
//                                               //
//          LAPTOP CHESS BOARD RECEIVER          //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  This is an example of how to map the (x, y)  //
//  output of a function to cell touch events.   //
//                                               //
//  The events are emmited via OSC.              //
//  And are interpreted by the receiver sketch.  //
//                                               //
///////////////////////////////////////////////////


String title = "Chessboard Receiver: TTS";

void setup() {
  size(1129, 150);
  textFont(createFont("Futura-MediumItalic", 48, true));
  setupOSC(); 
  setupTTS();
}

void draw() {

  smooth(16);
  background(0);
  
  // show sketch title
  fill(255);
  textAlign(CENTER);
  text(title, width/2, height/2 + textDescent());
  
}
