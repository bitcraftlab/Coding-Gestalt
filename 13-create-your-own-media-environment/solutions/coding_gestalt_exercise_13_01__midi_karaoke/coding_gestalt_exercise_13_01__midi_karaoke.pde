
/// COLORS ///

color cpast = color(0);
color cfuture = color(200);
color cnow = color(255, 0, 0);
color cback = color(255);

/// PARAMS ///
float zoom = 16;
float offset = 50;
float theHue = 100;
float speedStep = sqrt(sqrt(2));
float zoomFactor = sqrt(2);

/// GLOBALS ///
float scroll = 0;
MidiLoader midi = new MidiLoader();
MidiPlayer player = new MidiPlayer();

float TMIN, TMAX;
float tmin, tmax;

boolean showNewlines = false;
boolean tracking = true;
float tnow;

void setup() {

  size(600, 200);
  //midi.load("eye_of_the_tiger.kar");
  midi.load("house_of_the_rising_sun.kar");

  Sequence sequence = midi.getSequence();
  TMAX = sequence.getMicrosecondLength();
  tmax = TMAX / zoom;

  player.play(sequence);
}


void drawBits( ArrayList<Bit> bits, float tmin, float tmax, float tnow) {

  background(255);
  int pmin = 0, pmax = 100;
  float dy = height / (pmax - pmin);

  // Draw all the MIDI notes
  for (Bit bit : bits) {

    if (bit instanceof Note) { 

      int t1 = bit.getStart();
      int t2 = bit.getEnd();

      if (t2 > tmin || t1 < tmax) {

        // Draw Notes as Boxes

        Note note = (Note) bit;

        int pitch = note.getPitch();
        float x1 = map(t1, tmin, tmax, 0, width);
        float x2 = map(t2, tmin, tmax, 0, width);
        float y  = map(pitch, pmax, pmin, 0, height);

        fill( tnow < t1 ? cfuture : tnow > t2 ? cpast : cnow );

        noStroke();
        rect(x1, y - dy/2, x2-x1, dy);
      }
    }
  }

  // Draw Karaoke Text on top
  float xshift0 = 10;
  float yshift0 = 10 + textAscent();
  float lineHeight = textAscent() + textDescent();

  float pwidth = 0;
  float xshift = xshift0;
  float yshift = yshift0;
  int sylCount = 0;

  for (Bit bit : bits) {

    int t1 = bit.getStart();
    int t2 = bit.getEnd();

    if (t1 > tmin && t2 < tmax) {

      // Draw Syllables on top
      if (bit instanceof Syllable) {

        Syllable syl = (Syllable) bit;
        String txt = syl.getText();
        char ch = txt.charAt(0);
        switch(ch) {
        case '@':
          // ignore
          continue;

        case '/':
        case '\\':
          txt = txt.substring(1);
          if (showNewlines) {
            yshift += lineHeight;
            xshift = xshift0;
          } else {
            txt = (ch == '/' ? "    " : " ") + txt;
            xshift += pwidth;
          }
          break;
        default:
          if (sylCount == 0) {
            txt = " ... " + txt.substring(1);
          }
          xshift += pwidth;
          break;
        }
        fill(tnow < t1 ? cfuture : tnow > t2 ? cpast : cnow );
        text(txt, xshift, yshift);
        pwidth = textWidth(txt);
        sylCount++;
      }
    }
  }
}

void draw() {

  if (tracking) {
    trackPlayer();
  }

  background(cback);

  int h = 10;
  int w = (int) map(player.time(), TMIN, TMAX, 0, width);
  int hselect = height - 10;
  int wselect = (int) map(player.time(), tmin, tmax, 0, width);

  int w0 = (int) map(tmin, TMIN, TMAX, 0, width);
  int w1 = (int) map(tmax, TMIN, TMAX, 0, width);
  int w2 = (int) map(player.time(), TMIN, TMAX, 0, width);

  // SELECTION

  // draw all the bits
  fill(0);
  drawBits(midi.getBits(), tmin, tmax, player.time());

  // draw a red line
  stroke(cnow);
  line(wselect, 0, wselect, hselect);


  // Progress Bar
  noStroke();  
  fill(cpast, 100); 
  rect(0, hselect, w, h);
  fill(cfuture, 100); 
  rect(w, hselect, width - w, h);
  fill(cnow, 50); 
  rect(w0, hselect, w1 - w0, h);
  stroke(cnow, 100); 
  line(w2, hselect, w2, height);
  
  // update current time
  tnow = player.time();
  
}


void mouseDragged() {
  tracking = false;
  int dragX = mouseX - pmouseX;
  float tdelta = dragX * (tmax - tmin) / width;
  tmin -= tdelta;
  tmax -= tdelta;
}

void trackPlayer() {  
  float relpos = 0.5;
  tmin = tnow - TMAX / zoom * relpos;
  tmax = tnow + TMAX / zoom * (1 - relpos);
}

void zoomBy(float factor) {
  zoom *= factor;
  tmin = tnow + (tmin - tnow) / factor;
  tmax = tnow + (tmax - tnow) / factor;
}

void mouseClicked() {
  float micros = map(mouseX, 0, width, tmin, tmax);
  player.skipto((long) micros);
}

void keyPressed() {

  switch(key) {
    
  case 'r':
    player.reset();
    break;
    
  case ' ':
    player.toggle();
    break;
    
  case 't':
    tracking = !tracking;
    break;
    
  case 'n':
    showNewlines = !showNewlines;
    break;
    
  case '+':
    zoomBy(zoomFactor);
    break;
    
  case '-':
    zoomBy(1.0 / zoomFactor);
    break;
    
  case CODED:
    switch(keyCode) {
    case UP: 
      player.speedup(speedStep);
      break;
    case DOWN:
      player.speedup(1.0 / speedStep);
      break;
    }
    break;
    
  }

  if (key >= '1' && key <= '9') {
    player.setSpeed(pow(speedStep, key - '1'));
  }
}

