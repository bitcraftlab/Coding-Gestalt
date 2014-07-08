
// Standard example for loading + playing sound snippets with minim

import ddf.minim.*;

Minim minim;
AudioSample kick;
AudioSample snare;

String[] filenames = {
  "BD.mp3", 
  "SD.wav"
};

int bufSize = 512;
int numSamples = filenames.length;
AudioSample[] samples = new AudioSample[numSamples];

void setup()
{
  size(512, 200, P3D);
  minim = new Minim(this);

  for (int i = 0; i < numSamples; i++) {
    samples[i] = minim.loadSample(filenames[i], bufSize); 
    if ( samples[i] == null) {
      println("Error loading sample " + filenames[i]);
    }
  }
  
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
  if(key >= '1' && key <= '1' + numSamples - 1) {
    int pick = key - '1';
    samples[pick].trigger();
  }
  
  // mute all samples
  if(key == ' ') {
    for(int i = 0; i < numSamples; i++) {
       samples[i].stop(); 
    }
  }
}

