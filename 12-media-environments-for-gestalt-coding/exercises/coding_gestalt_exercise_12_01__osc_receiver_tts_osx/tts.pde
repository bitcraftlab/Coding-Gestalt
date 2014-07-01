import guru.ttslib.*;
TTS tts;

// Inspired by Kurt Schwitters (Ursonate)
String[][] words = {
  {"ah", "eh", "ee", "o", "ew"},
  {"rahketeh", "rinnzaketeh ", "Boeoeo", "boe", "foe"},
  {"rahketehteh", "rinnzaketehteh ", "Boeoeoeoeoe", "boeoe", "foewoe"},
  {"fuems boe", "fuems bo wota", "fuems bo wotah za","fuems bo wota za", "fuems bo wota zapo giff"}
};

String[] voices = { "Alex", "Bubbles", "Pipe Organ"};

int xwords = words[0].length;
int ywords = words.length;
int xvoices = voices.length;

void setupTTS() {
   // nothing to do here ...
}

void ttsEvent(int x, int y) {
  
  String voiceStr = "default";
  
  switch(voice) {
    case 0: voiceStr = voices[0]; break;
    case 1: voiceStr = voices[1]; break;
    case 2: voiceStr = voices[2]; break;
    case 3: voiceStr = voices[1 + (x + y) % 2]; break;
  }
  
  String[]  cmd = { "say", "-v", voiceStr,  words[y % ywords][x % xwords] }; 
  exec(cmd);
  
}
