import guru.ttslib.*;
TTS tts;

// Inspired by Kurt Schwitters (Ursonate)
String[][] words = {
  {"ah", "eh", "ee", "o", "ew"},
  {"rahketeh", "rinnzaketeh ", "Boeoeo", "boe", "foe"},
  {"rahketehteh", "rinnzaketehteh ", "Boeoeoeoeoe", "boeoe", "foewoe"},
  {"fuems boe", "fuems bo wota", "fuems bo wotah za","fuems bo wota za", "fuems bo wota zapo giff"}
};

int xwords = words[0].length;
int ywords = words.length;

void setupTTS() {
   tts = new TTS();
}

void ttsEvent(int x, int y) {
   tts.speak(words[y % ywords][x % xwords]); 
}
