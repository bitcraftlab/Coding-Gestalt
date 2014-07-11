
// Standard example for loading + playing sound snippets with minim

import ddf.minim.*;

Minim minim;
AudioSample kick;
AudioSample snare;


int bufSize = 512;
int numSamples;
AudioSample[] samples; 

String[] soundfonts = {
  "drum", 
  "scream", 
  "guitar"
};

int soundfontCount = soundfonts.length;
int pickSoundfont = 0;

void setup() {

  size(800, 800);
  minim = new Minim(this);

  loadSoundfont();

  setupOSC();
}

void draw()
{
  background(0);
  stroke(255);
  noFill();

  // use the mix buffer to draw the waveforms.

  float dx = height / numSamples;

  for (int s = 0; s < numSamples; s++) {

    AudioSample sample = samples[s];

    beginShape();
    for (int i = 0; i < bufSize - 1; i++) {
      float x1 = map(i, 0, bufSize, 0, width);
      vertex(x1, s * dx + dx/2 - sample.mix.get(i) * dx/2);
    }
    endShape();
  }
}

void keyPressed() 
{
  // trigger samples
  if (key >= '1' && key <= '1' + numSamples - 1) {
    int pick = key - '1';
    samples[pick].trigger();
  }

  // mute all samples
  if (key == ' ') {
    for (int i = 0; i < numSamples; i++) {
      samples[i].stop();
    }
  }

  switch(key) {
  case '+':
    pickSoundfont = (pickSoundfont + 1) % soundfontCount;
    loadSoundfont();
    break;
  }
}


void loadSoundfont() {

  String soundfont = soundfonts[pickSoundfont];
  String[] filenames = getFilenames(soundfont, ".wav");
  numSamples = filenames.length;
  samples = new AudioSample[numSamples];
    
  for (int i = 0; i < numSamples; i++) {
    try {
      samples[i] = minim.loadSample(filenames[i], bufSize);
    } catch(NullPointerException e) {
      println("Error loading sample " + filenames[i]);
    }
    if ( samples[i] == null) {
      println("Error loading sample " + filenames[i]);
    }
  }
  
}

