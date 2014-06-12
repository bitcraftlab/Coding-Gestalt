
// there are three bug data sets
int bugs = 3;

// create a 2d array, for all data sets
int[][] data = new int[bugs][];

// now load all the data sets into the data array
for(int i = 0; i < bugs; i++) {
  data[i] =  int(trim(loadStrings("../../../data/circadian/pill/BUG" + (i + 1) + ".ACT")));
} 
 
// get number of datapoints 
int samples = data[0].length;

// if one data point is sampled every 6 minutes, one day corresponds to 240 datapoints
int spd = 240;

// calculate the total number of days
int days = samples / spd;

// pixel size
int pxlw = 3;
int pxlh = 3;

// gap between displays (in pixels)
int gap = 2;

// display size
int w = gap + (spd * pxlw) + gap;
int h = gap + (bugs * days * pxlh) + bugs * gap;
size(w, h);

// get min and max and mean values for the activity
float amin = Float.MAX_VALUE;
float amax = Float.MIN_VALUE;
float amean = 0;

for(int i = 0; i < bugs; i++) {
  for(int t = 0; t < samples; t++) {
    int a = data[i][t];
    amin = min(amin, a);
    amax = max(amax, a);
    amean += a;
  }
}

amean /= samples;

// now lets show the activity patterns
background(255);
for(int i = 0; i < bugs; i++) {
  for(int t = 0; t < samples; t++) {
    
    int day = t / spd;
    int slot = t % spd;
    int x = gap + slot * pxlw;
    int y = (i + 1) * gap + (i * days + day) * pxlh;
    int activity = data[i][t];
    
    noStroke();
    
    // display the interval centered around amean ... 
    fill(color(map(activity, amin , 2 * amean - amin, 0, 255)));
    rect(x, y, pxlw, pxlh);
    
  }
}


