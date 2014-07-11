
SnapshotSender ss;
InetAddress[] remotes; 
InetAddress local;

void setup() {
  size(600, 600);
  background(255); 
  ss = new SnapshotSender();
  remotes = getRemotes();
  local = getInetAddress("127.0.0.1");
}

void draw() {
}

void keyPressed() {
  
  // send image to the remote party
  if(key >= '1' && key <= '9') {
    InetAddress remote = remotes[key - '1'];
    PImage img = get();
    ss.send(img, remote);
  }
      
  switch(key) {
    case 'c': 
      noFill();
      ellipse(random(width), random(height), 100, 100);
      break; 
    case 's':
      PImage img = get();
      ss.send(img, local);
      break;
      
  }
}

