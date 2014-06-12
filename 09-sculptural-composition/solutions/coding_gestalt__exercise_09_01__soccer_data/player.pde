

// Lists of teams
Players[] teams = new Players[] { 
  new Players(color(255)), new Players(color(255, 0, 0)),
  new Players(color(0, 0, 255)), new Players(color(0))
};

final int BALL = 0, A = 1, B = 2, REFEREE = 3;


class Players extends ArrayList<Player> {
  
  color c;
  
  Players(color _c) {
    c = _c;
  }
  
  void draw() {
    fill(c);
    for(Player p : this) {
      p.draw(); 
    }
  }
  
}

class Player {

  String name;
  int team;
  Sensor mysensor;
  
  Player(String _name) {
    name = _name;
  }
  
  // for player with 2 leg sensors
  Player sensors(int id1, int id2) {
    mysensor = setSensor(LEFT_LEG, id1);
    setSensor(RIGHT_LEG, id2);
    return this;
  }
  
  // for player with two leg and two arm sensors
  Player sensors(int id1, int id2, int id3, int id4) {
    sensors(id1, id2);
    setSensor(LEFT_ARM, id3);
    setSensor(RIGHT_ARM, id4);
    return this;
  }
  
  // set the team
  Player team(int theTeam) {
    team = theTeam;
    teams[team].add(this);
    return this;
  }
  
  // add a sensor at position
  Player sensor(int position, int id) {
    setSensor(position, id);
    return this;
  }
  
  // add sensor at the center
  Player sensor(int id) {
    mysensor = setSensor(CENTER, id);
    return this;
  }
  
  private Sensor setSensor(int position, int id) {
    Sensor s = new Sensor(id, this, position);
    sensors.add(s);
    return s;
  }
  
  // take average of the sensor positions
  PVector pos() {
    return mysensor.sample.p;
  }
  
  void draw() {
    pushMatrix();
    PVector p = pos();
    
    //float x = p.x / 100.0;
    //float y = -p.y / 100.0;
    
    float x = map(p.y, 0, 52483, 0, width);
    float y = map(p.x, +33960, -33960, 0, height);
    
    smooth(16);
    ellipse(x, y, 5, 5);
    popMatrix();
  }
  
}



