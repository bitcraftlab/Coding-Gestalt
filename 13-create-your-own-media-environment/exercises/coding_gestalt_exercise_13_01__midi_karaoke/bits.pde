
// unlike an event a midi bit has a beginning and an end

class Bit {
  long start;
  long end;
  Bit(long tick) {
    start = tick; 
  }
  void setEnd(long tick) {
    end = tick;
  }
  int getEnd() {
    return (int) end; 
  }
  int getStart() {
    return (int) start;
  }
  int getDuration() {
    return int(end - start); 
  }

}

class Note extends Bit {
  int pitch;
  Note(int note, long tick) {
    super(tick);
    pitch = note;
  }
  int getPitch() {
    return pitch; 
  }
  String toString() {
    return "Note: " + "start: " + start + ", duration: " + (end - start) + ", pitch: " + pitch;
  }
}


class Syllable extends Bit {
  
  String txt;
  
  Syllable(String syllable, long tick) {
    super(tick);
    txt = syllable; 
  }
  
  String getText() {
    return txt; 
  }
  
  String toString() {
    return "Syllable " + "start: " + start + ", duration: " + (end - start) + ", text: " + txt;
  }
}

