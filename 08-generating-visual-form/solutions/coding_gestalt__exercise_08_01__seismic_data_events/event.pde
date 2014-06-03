
class Event {

  int t0;
  int dt;
  float y;

  Event(int onset, int duration, float intensity) {
    t0 = onset;
    dt = duration;
    y = intensity;
  }

  void draw() {

    float x0 = t0 / zoom;
    float dx = dt / zoom;
    float dy = y * height;

    fill(255, 0, 0, 100);
    rect(x0, y0 - dy/2, dx, dy);
    
  }
  
}


class Events extends ArrayList<Event> {

  Events(float[] data) {
    createEvents(data, eventSlices, eventLimit);  
  }  

  void createEvents(float[] data, int step, float limit) {

    // now calculate the absolute limit for triggering events
    float absMax = max(abs(ymax), abs(ymin));
    float absLimit = absMax * limit;


    // create all events
    for (int t0 = 0; t0 < samples - step; t0 += step) {

      // get the maximum inside the interval
      float vmax = 0;
      for (int dt = 0; dt < step; dt++) {
        int t = t0 + dt;
        float sample = abs(data[t]);
        vmax = max(vmax, sample);
      }

      // create an event if the maximum exceeds some limit
      if (vmax > limit * absMax ) {
        float y = vmax / absMax;
        add(new Event(t0, step, y));
      }
    }
  }
}




