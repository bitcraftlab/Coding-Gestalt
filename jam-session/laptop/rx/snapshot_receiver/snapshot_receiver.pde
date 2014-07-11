
// Receive Snapshots on Port 13000 and 13001

PImage remoteimg1, remoteimg2;
SnapshotReceiver sr1, sr2;
int border = 100;
int w = 500;
int h = 500;

void setup() {
  size(2 * w + 3 * border, h + 2 * border); 
  remoteimg1 = createImage(w, h, RGB);
  remoteimg2 = createImage(w, h, RGB);
  sr1 = new SnapshotReceiver(remoteimg1, remoteport1);
  sr2 = new SnapshotReceiver(remoteimg2, remoteport2);
  
}

void draw() {
  background(#666666);
  sr1.receive();
  sr2.receive();
  image(remoteimg1, border, border);
  image(remoteimg2, 2 * border + w, border);
}
