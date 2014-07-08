import javax.sound.midi.*;

interface Player {

  void setSpeed(float speed);
  void speedup(float spfeed);
  
}

class MidiPlayer implements Player {

  Sequencer sqr;
  tapMidi tap;  
  Sequence seq;

  PApplet parent;
  int currentNote;
  long tmax;
  float speed;

  MidiPlayer() {

    speed = 1.0;

    try {
      sqr = MidiSystem.getSequencer();

      tap = new tapMidi();
      // connect sqr >> tap 
      Transmitter t = sqr.getTransmitter();
      t.setReceiver(tap);

      // also tap into meta events
      sqr.addMetaEventListener(tap);

      sqr.open();
      sqr.setTempoFactor(speed);
    } 
    catch (MidiUnavailableException e) {
      handleException(e);
    }
  }

  void play(Sequence seq) {
    try {
      sqr.setSequence(seq);
      play();
      this.seq = seq;
      tmax = seq.getMicrosecondLength();
    } 
    catch (InvalidMidiDataException e) {
      handleException(e);
    }
  }

  boolean isPlaying() {
    return sqr.isRunning();
  }

  // play/pause
  void toggle() {
    if (isPlaying()) {
      stop();
    } else {
      play();
    }
  }

  // current time in microseconds
  int time() {
    return int(sqr.getMicrosecondPosition());
  }

  // time since last pitch attack
  float duration() {
    return tap.pitchAge();
  }

  float velocity() {
    return tap.velocity;
  }

  // current pitch
  int pitch() {
    return tap.pitch;
  }

  // current syllable
  String txt() {
    return tap.syllable;
  }

  void play() {
    sqr.start();
  }

  void stop() {
    sqr.stop();
  }

  // set position as percentage
  void skipto(long micros) {
    //int mpos = int(constrain(pos * tmax, 0, tmax));

    sqr.setMicrosecondPosition(micros);
    sqr.start();
  }

  // get position as percentage
  float progress() {
    return time() / tmax;
  }

  void reset() {
    stop();
    skipto(0);
  }

  void speedup(float factor) {
    speed *= factor;
    sqr.setTempoFactor(speed);
  }

  void setSpeed(float factor) {
    speed = factor;
    sqr.setTempoFactor(speed);
  }

  void handleException(Exception e) {
    e.printStackTrace();
    exit();
  }
}


// this class eavesdrops the midi sequencer to capture the currently played pitch
class tapMidi implements Receiver, MetaEventListener {

  int pitch;
  float timestamp;
  float velocity;
  String syllable = "";

  void send(MidiMessage m, long timeStamp) {
    if (m instanceof ShortMessage) {
      ShortMessage sm = (ShortMessage) m; 
      if (sm.getCommand() == 0x90) {
        pitch = sm.getData1();
        velocity = sm.getData2();
        timestamp = millis();
      }
    }
  }

  void meta(MetaMessage mm) {
    int type = mm.getType();
    if (type == 1 || type == 5) {
      syllable = new String(mm.getData());
    }
  }

  float pitchAge() {
    return millis() - timestamp;
  }

  void close() {
  }
}

