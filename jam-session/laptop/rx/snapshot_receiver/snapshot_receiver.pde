
PImage remoteimg;
SnapshotReceiver sr;

void setup() {
  size(500, 500); 
  remoteimg = createImage(500, 500, RGB);
  sr = new SnapshotReceiver(remoteimg, remoteport);
}

void draw() {
  sr.receive();
  image(remoteimg, 0, 0);
}
