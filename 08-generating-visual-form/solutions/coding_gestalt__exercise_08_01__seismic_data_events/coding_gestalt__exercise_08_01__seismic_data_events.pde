
// sketch size parameters
float zoom = 20;
int height = 200;
int gap = 30;
int hmin = gap;
int hmax = height - gap; 

// eventParameters
int eventSlices = 200;
float eventLimit = 0.3;

// variables
ArrayList<Event> events = new ArrayList();
float[] data;
int samples;
float ymin, ymax, y0;

void setup() {
  
  PSacTimeSeries timeseries = new PSacTimeSeries("../../../data/seismic/Aegean_Sea/data/IU.ANTO.00.BHZ.sac");
  data = timeseries.getY();
  samples = data.length;
  
  // get min and max values
  int n = data.length;
  ymin = Float.MAX_VALUE;
  ymax = Float.MIN_VALUE;
  for(int t = 0; t < n; t++) {
    ymax = max(ymax, data[t]);
    ymin = min(ymin, data[t]);
  }
  
  // size the sketch
  size(int(samples/zoom), height);

  // create events
  events = new Events(data);
  
  noLoop();
  
}


void draw() {
 
  background(255);
  
  // draw the base-line
  y0 =  map(0, ymin, ymax, hmin, hmax);
  line(0, y0, width, y0); 
  
  // draw the curve
  float py = 0;
  for(int t = 0; t < samples; t++) {
    float x = t / zoom;
    float y = map(data[t], ymin, ymax, hmin, hmax);
    if(t > 0) line(x, py, x, y);
    //point(x, y);
    py = y;
  }
  
  // draw the events
  for(Event evt : events) {
    evt.draw();
  }
  
}




