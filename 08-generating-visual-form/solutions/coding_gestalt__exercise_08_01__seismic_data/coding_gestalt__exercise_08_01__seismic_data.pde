
float[] data;
int samples;
float zoom = 25;
float ymin = -5000000;
float ymax = 5000000;

void setup() {
  
  PSacTimeSeries timeseries = new PSacTimeSeries("../../../data/seismic/Aegean_Sea/data/IU.ANTO.00.BHZ.sac");
  data = timeseries.getY();
  samples = data.length;
  
  size(int(samples/zoom), 200);
  
}

void draw() {
 
  // do something with the data here ...
  background(255);
  for(int i = 0; i < samples; i++) {
    float x = i / zoom;
    float y = map(data[i], ymin, ymax, 0, height);
    point(x, y); 
  }
  
}




