
PImage remoteimg;
SnapshotReceiver sr;

void setup() {
  size(400, 400); 
  remoteimg = createImage(400, 400, RGB);
  sr = new SnapshotReceiver(remoteimg, remoteport);
}

void draw() {
  sr.receive();
  image(remoteimg, 0, 0);
}
