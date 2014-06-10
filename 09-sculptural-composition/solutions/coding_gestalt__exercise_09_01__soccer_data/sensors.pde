
// List of sensors
Sensors sensors = new Sensors();

class Sensors extends HashMap<Integer, Sensor> {
  void add(Sensor s) {
    put(s.id, s); 
  }
} 

// Sensor types
final static int CENTER = 0, LEFT_LEG = 1, RIGHT_LEG = 2, LEFT_ARM = 3, RIGHT_ARM = 4;
final static String[] pstr = { "Center", "Left Leg", "Right Leg", "Left Arm", "Right Arm" };

class Sensor {
  
  Player player;
  int id, position;
  Sample sample;
  
  Sensor(int _id, Player _player, int _position) {
    id = _id;
    player = _player;
    position = _position;
    setData(new int[11]);
  }
  
  String toString() {
    return "Sensor " + id + " ("+ player.name +", " + pstr[position] + ")";
  }
  
  void setData(int[] data) {
    sample = new Sample(data);
  }
  
  String data() {
    return sample.toString();
  }
  
}



