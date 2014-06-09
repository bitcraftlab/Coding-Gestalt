///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 09      -   Demo 02                  //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//             SCHEDULING DEMO                   //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  This is an example of how to schedule        //
//  events with an accuracy of a milliseconds    //
//  (depending on your machine)                  //
//                                               //
//  It uses on a scheduler, that creates a       //
//  new thread, which runs independently of      //
//  Processing's drawing loop.                   // 
//                                               //
//  You can use the Schedule class to play back  // 
//  a sequence of events in real time ...        //
//                                               //
///////////////////////////////////////////////////

Schedule s;
Cat cat1, cat2;

void setup() {
  
  println("Hit any key to schedule events");
  
  // Create the schedule
  s = new Schedule(this);
  
  // Create some kittens
  cat1 = new Cat("kitty");
  cat2 = new Cat("felix");
  
  // We don't need to do any drawing ...
  noLoop(); 

} 

// ... but the  draw() function needs to be present!
void draw() {}


void keyPressed() {
  
  // what's the time?
  println();
  println("It's now " + millis() + " ms since the sketch has started");
  
  // absolute scheduling
  s.add(5000, "hello");         // call hello() at 5.0 seconds 
  s.add(6000, "hello", cat1);   // call cat1.hello() at 6.0 seconds
  
  // relative scheduling
  int now = millis();
  s.add(now + 1000, "hello");        // call hello() at 1.0 seconds from now
  s.add(now + 1100, "hello", cat2);  // call cat2.hello() at 1.1 seconds from now

}


void hello() {
  println(millis()+ ": hi there");
}


class Cat {
  
  String name;
  
  Cat(String s) {
    name = s;
  }
  
  void hello() {
    println(millis() + ": hello " + name);
  }

  // used when printing this object to the console ...
  String toString() {
    return name;
  }
  
}

