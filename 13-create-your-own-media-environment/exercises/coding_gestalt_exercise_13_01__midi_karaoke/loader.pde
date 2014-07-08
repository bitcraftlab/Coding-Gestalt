


class MidiLoader {

  Sequence seq;
  int duration;

  void load(String filename) {
    try {
      seq = MidiSystem.getSequence(new File(dataPath(filename)));
    } 
    catch (IOException e) {
      handleException(e);
    } 
    catch (InvalidMidiDataException e) {
      handleException(e);
    }
  }

  void handleException(Exception e) {
    e.printStackTrace();
    exit();
  }

  Sequence getSequence() {
    return seq;
  }
  
  int getDuration() {
    return int(seq.getMicrosecondLength());
  }

  ArrayList<Bit> getBits() {

    ArrayList<Bit> bits = new ArrayList();
    
    // keep note of actively playing notes
    Note playing[] = new Note[100];
    
    // keep track of the current syllable
    Syllable syl = null;
    
    long tickmicros =  seq.getMicrosecondLength() / seq.getTickLength();

    // iterate over all the tracks
    Track[] tr = seq.getTracks();
    for (int j = 0; j < tr.length; j++) {

      println("Track " + j);  
      Track t = tr[j];

      for (int i = 0; i < t.size (); i++) {
        
        MidiEvent event = t.get(i);
        MidiMessage m = event.getMessage();
        long tick = event.getTick();
        long time = tick * tickmicros;

        if (m instanceof ShortMessage) {

          ShortMessage sm = (ShortMessage) m;
          int cmd = sm.getCommand();
          
          switch(cmd) {
          case 0x90:
            // println("Tick: " + tick + " Note ON: "+ sm.getData1() + " velocity: " + sm.getData2());

            int note = sm.getData1();
            int id = note;  // using the note as id
            
            int velocity = sm.getData2();
            if(playing[id] == null) {
              playing[id] = new Note(note, time);
            } else {
              Bit bit = playing[note];
              bit.setEnd(time);
              bits.add(bit);
              playing[note] = null;
              // println(bit);
            }

            break;
          case 0x80:
            //println("Note OFF "+ sm.getData1() + " velocity: " + sm.getData2());
            break;
          }
        } else if (m instanceof MetaMessage) {

          MetaMessage mm = (MetaMessage) m;
          byte[] msg = mm.getMessage();
          int type = mm.getType();
          byte[] data = mm.getData();
          String str = new String(data);

          switch(type) {
          case 1: 
            //println("Text :" + str);
            // no break here!
          case 5:
            //println("Lyrics :" + str);
            if(syl != null) {
               syl.setEnd(time);
               bits.add(syl);
            }
            // create a new syllable
            syl = new Syllable(str, time);
            break;

          }
        }
      }
    }
    return bits;
  }
}
