
// a simple static timer class 
// use it to test how efficient your image processing algorithms are

class Timer {
  
  static long t0;
  
  // start the timer
  static void start() {
    t0 = millis();
  }
  
  // print the number of ms passed to the console
  static String stop(String txt) {
    String str = txt + ": " + get() + " ms";
    System.out.println(str);
    return str;
  }
  
  // return number of milliseconds since the timer was started
  static long get() {
    return millis() - t0;
  }  
  
  // use the system time
  private static long millis() {
    return System.currentTimeMillis();
  }
  
}
