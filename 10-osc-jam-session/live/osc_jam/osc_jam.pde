
void setup() {
   size(600, 400);
   setupOSC();
   setupMinim();
}

void draw() {
  
}

void mousePressed() {
  sendTo(luis_id, mouseX, mouseY); 
}
