
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
Signal signal;

// default buffer size
int bufferSize;
float sampleRate;

void setupMinim() {
  
  minim = new Minim(this);
  out = minim.getLineOut();
  
  bufferSize = out.bufferSize();
  sampleRate = out.sampleRate();
  
  println("Minim Buffer Size ", bufferSize);
  println("Minim Sample Rate", sampleRate);
  
  signal = new Signal();
  out.addSignal(signal);
  
}

void soundEvent(int x, int y) {
  println("Minim Event ", x, y);
  signal.update(x, y);
}

class Signal implements AudioSignal{
  
  float freq = 400.0;
  float amp = 1.0;
  int t = 0;
  
  // mono samples
  void generate(float[] samp){
    for(int i = 0;i < bufferSize;i++){
      samp[i] = fn(t);
      t++;
    }
    update();
  }
  
  // stereo samples
  void generate(float[] left, float[] right){
    for(int i = 0; i < bufferSize; i++){
      left[i] = fn(t);
      right[i] = fn(t);
      t++;
    }
    update();
  }
  
  void update() {
    amp = lerp(amp, 0, 0.05);
  }
  
  // the actual sound function
  final float fn(float t) {
    return sin(t / sampleRate * freq * TWO_PI) * amp;
  }
   
  // update amplitude and frequency
  void update(int x, int y) {
    
    int nx = 8;
    int ny = 8;
    int modx = x % nx;
    int mody = y % ny;
    
    freq = map(modx, 0, nx-1, 200, 800);
    amp  = map(mody, 0, ny-1, 0.2, 1.0);
    
  }
  
}
