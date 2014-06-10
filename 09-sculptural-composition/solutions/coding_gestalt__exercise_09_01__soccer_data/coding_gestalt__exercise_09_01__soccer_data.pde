
//////////////// S O C C E R    D A T A ///////////////////
                                                     
// TODO                                                 
//                                                      
// * Replay the Data in Realtime                        
// * Emit OSC signals   
// * Display Soccer Field


// location where you should have downloaded the datafile
String datafile = "../../../data/soccer/full-game.gz";

BufferedReader reader;

void setup() {
  
  size(800, 400);
  
  // note that Processing will automagically unzip the file 
  // when reading it ...
  
  reader = createReader(datafile);   

  // Setup sensors for players of team A
  
  new Player("Nick Gertje")
    .sensors(13, 14, 97, 98)
    .team(A)
    ;

  new Player("Dennis Dotterweich")
    .sensors(47, 16)
    .team(A)
    ;
    
  new Player("Niklas Wälzlein")
    .sensors(49, 88)
    .team(A)
    ;
    
  new Player("Wili Sommer")
    .sensors(19, 52)
    .team(A)
    ;
                    
  new Player("Philipp Harlass")
    .sensors(53, 54)
    .team(A)
    ;
    
  new Player("Roman Hartleb")
    .sensors(23, 24)
    .team(A);
    ;
  
  new Player("Erik Engelhardt")
    .sensors(57, 58)
    .team(A)
    ;
    
  new Player("Sandro Schneider")
    .sensors(59, 28)
    .team(A)
    ;
    
    
  // Setup sensors for players of team B
  
  new Player("Leon Krapf")
    .sensors(61, 62, 99, 100)
    .team(B)
    ;
    
  new Player("Kevin Bär")
    .sensors(63, 64)
    .team(B)
    ;
    
  new Player("Luca Ziegler")
    .sensors(65, 66)
    .team(B)
    ;
  
  new Player("Ben Müller")
    .sensors(67, 68)
    .team(B)
    ;
    
  new Player("Vale Reitstetter")
    .sensors(69, 38)
    .team(B)
    ;
    
  new Player("Christopher Lee")
    .sensors(71, 40)
    .team(B)
    ;
    
  new Player("Leon Heinze")
    .sensors(73, 74)
    .team(B)
    ;
  
  new Player("Leo Langhans")
    .sensors(75, 44)
    .team(B)
    ; 
  
  
  // Setup sensors for the balls
    
  new Player("Ball 1")
    .sensor(4)
    ;
    
  new Player("Ball 2")
    .sensor(8)
    .team(BALL);
    ;
      
  new Player("Ball 3")
    .sensor(10)
    .team(BALL);
    ;
    
  new Player("Ball 4")
    .sensor(12)
    .team(BALL)
    ;
    
    
  // Setup sensors for the referees
  
  new Player("Referee")
    .sensors(105, 106)
    .team(REFEREE)
    ;

}


// read one line from the file every time we draw ...
void draw() {
  
  for(int i = 0; i < 1500; i++)
  parseLine();
  
  background(255);
  
  // draw the playing field !
  
  // ...
  
  // draw the teams
  translate(width/2, height/2);
  for(int i = 0; i < teams.length; i++) {
    teams[i].draw();
  }
  
}


void parseLine() {
  
  String line = readLine();
  
  if(line != null) {
    
    // sid, ts, x, y, z, |v|, |a|, vx, vy, vz, ax, ay, az
    String[] csv = split(line, ",");
    
    // get sensor id
    int sid = int(csv[0]);
    
    // get timestamp
    long timestamp = parseLong(csv[1]);
    
    // get remaining data
    int[] data = int(subset(csv, 2, 11));
    
    // get sensor
    Sensor s = sensors.get(sid);
    
    // assign the data
    s.setData(data);
    
    // print sensor values in pico-seconds
    // println((int) (timestamp / 10e09), "ms", "::", s, "::", s.data());
    
  } else {
    println("no more lines to read.");
    noLoop();
  }
   
}



String readLine() {
  String line;
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  return line;
}


long parseLong(String s) {
  return Long.parseLong(s, 10);
}

