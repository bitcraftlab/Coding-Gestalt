
int voice;
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


void keyPressed() {
  if(key >= '1' && key <= '4') voice = key - '1';
}

