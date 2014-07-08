
// Standard example for loading + playing sound snippets with minim

import ddf.minim.*;

Minim minim;
AudioSample kick;
AudioSample snare;

void setup()
{
  size(512, 200, P3D);
  minim = new Minim(this);

  // load BD.wav from the data folder
  kick = minim.loadSample( "BD.mp3", // filename
                            512      // buffer size
                         );
                         
  // An AudioSample will spawn its own audio processing Thread, 
  // and since audio processing works by generating one buffer 
  // of samples at a time, we can specify how big we want that
  // buffer to be in the call to loadSample. 
  // above, we requested a buffer size of 512 because 
  // this will make the triggering of the samples sound more responsive.
  // on some systems, this might be too small and the audio 
  // will sound corrupted, in that case, you can just increase
  // the buffer size.
  
  // if a file doesn't exist, loadSample will return null
  if ( kick == null ) println("Didn't get kick!");
  
  // load SD.wav from the data folder
  snare = minim.loadSample("SD.wav", 512);
  if ( snare == null ) println("Didn't get snare!");
}

void draw()
{
  background(0);
  stroke(255);
  
  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < kick.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, kick.bufferSize(), 0, width);
    float x2 = map(i+1, 0, kick.bufferSize(), 0, width);
    line(x1, 50 - kick.mix.get(i)*50, x2, 50 - kick.mix.get(i+1)*50);
    line(x1, 150 - snare.mix.get(i)*50, x2, 150 - snare.mix.get(i+1)*50);
  }
}

void keyPressed() 
{
  if ( key == 's' ) snare.trigger();
  if ( key == 'k' ) kick.trigger();
}


