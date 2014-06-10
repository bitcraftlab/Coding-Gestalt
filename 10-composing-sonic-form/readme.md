Composing Sonic Form
====================

Sound composition can be tackled at different levels.

### Waveforms

* Composition = Sequence of raw samples
* Physical Waveform
* Processing Libraries: [Minim][]
* File Formats: [WAV][], [RAW][]

### Timbre

* Composition = Sound of an Instrument
* Combination of Frequencies
* Attack, Decay, Sustain, Release (ADSR)
* File Formats: [SoundFont]
* Processing Libraries: [Minim][], [Beads][]

### Notes

* Composition = Sequence of Notes
* File Formats: [Midi][], [OSC][]
* Libraries [midiBus][], [oscP5][], [Beads][]

### Samples

* Composition = Mix of Samples
* Granular Synthesis
* Libraries: [Beads][]



## The Gestalt of Sound

### Experiments

* Timbre
	* [Reversed Notes](http://www1.appstate.edu/~kms/classes/psy3215/AudioDemos/ReversedNotes.swf)
	* [Harmonics](http://www1.appstate.edu/~kms/classes/psy3215/AudioDemos/AddHarmonics.swf)

* Form + Gestalt
	* [Good Continuation](http://www1.appstate.edu/~kms/classes/psy3215/AudioDemos/GoodContinuation.swf)
	* [Melody Separation](http://www1.appstate.edu/~kms/classes/psy3215/AudioDemos/MelodySeparation.swf)
	* [Natural Sound Separation](http://www1.appstate.edu/~kms/classes/psy3215/AudioDemos/LayeredSounds.swf)

* Grouping
	* [Repetition](http://www1.appstate.edu/~kms/classes/psy3215/AudioDemos/)
	* [Similarity](http://www1.appstate.edu/~kms/classes/psy3215/AudioDemos/SimilarityGrouping.swf)
	* [Temporal Proximity](http://www1.appstate.edu/~kms/classes/psy3215/AudioDemos/TemporalGrouping.swf)


# The Sound of Code

  * **SID files** — C64 executables using the SID chip
  	* [Sid Play](http://www.sidmusic.org/sidplay/mac/) (OSX) and [jSidPlay V2](http://sourceforge.net/projects/jsidplay2/) (Java 8.0)
    * Any C64, or C64 emulator
    * More info on the SID 6581 [here](http://www.dopeconnection.net/C64_SID.htm) + [here](http://www.waitingforfriday.com/index.php/Commodore_SID_6581_Datasheet)
    
  * **ByteBeat** — Music from very short Programs
    * [Video I](http://www.youtube.com/watch?v=GtQdIYUtAHg), [Video II](http://www.youtube.com/watch?v=qlrs2Vorw2Y), [Video III](http://www.youtube.com/watch?v=tCRPUv8V22o)  — more info [here](http://countercomplex.blogspot.de/2011/10/algorithmic-symphonies-from-one-line-of.html) and [here](http://countercomplex.blogspot.de/2011/10/some-deep-analysis-of-one-line-music.html)
    * [HTML5 Version](http://greggman.com/downloads/examples/html5bytebeat/html5bytebeat.html) — more info [here](http://games.greggman.com/game/html5-bytebeat/)
    * [Flash Version](http://entropedia.co.uk/generative_music/)

## Gestalt Coding with Sound

* Alex McLean
  * Acid Sketch [Code](https://github.com/yaxu/acidsketch) + [Video](http://vimeo.com/7492566) 
  * Texture [Video](http://www.youtube.com/watch?v=kr4DdQuNAKc)
  * Body Code (with Kate Sicchio)  
   [Code](https://github.com/yaxu/soundchoreographer) + [Interview](http://www.imperica.com/en/in-conversation-with/in-conversation-with-kate-sicchio-and-alex-mclean)  + [Video]() 
  
* Martin Kaltenbrunner
  * [Reactivision](http://reactivision.sourceforge.net/) — toolkit for tangible multi-touch surfaces
  * [Reactable](http://www.reactable.com/) — Product Page  
    [TEDx Video](http://www.youtube.com/watch?v=C4wIeZU57nQ) — Talk by Martin Kaltenbrunner


## Demo

Here are a couple of demos for your inspiration:

* [Music Visualizer](demo/MusicVisualizer) — using Minim + Frequency Analysis (FFT) to visualize music
* [Drum Sound](demo/DrumSound) — by Asher Salomon (via [OpenProcessing]((http://www.openprocessing.org/sketch/62120))
* [Vibrating String](demo/VibratingString) — by Asher Salomon (via [OpenProcessing](http://www.openprocessing.org/sketch/44311))
* [OSC to TTS](demo/OSC_to_TTS) — turning OSC signals into sonic events
      
## Exercises

The exercises can be found [here](exercises).

## Solutions

Solutions will be made available [here](solutions).

## Links

### Workshops

* [Changing Rules While They Are Followed](http://vimeo.com/69687342)  
  *Live Coding the Embodied Loop* — NODE13 Talk by Alex McLean  
* [Sound as Data](https://github.com/mariuswatz/ITP2013Parametric/tree/master/ITP-workshops/20131111-ITP-Sound-As-Data) — Processing Workshop by Marius Watz.   
*(to play with it you need to create a **Music** folder inside the repo!)*

   
### Processing Libraries

* [Minim][] — [Music Programming in Minim](http://tcts.fpms.ac.be/publications/papers/2010/nime2010_musicinminim_jamddfnb.pdf) (PDF)
* [Beads][] — Sonifying Processing [Website](http://computermusicblog.com/blog/sonifyingprocessing/) + [Book](http://www.computermusicblog.com/SonifyingProcessing/Sonifying_Processing_The_Beads_Tutorial.pdf) (PDF)
* [MidiBus][]
* [oscP5][]


### Literature Online
* [Illusion Songs](http://illusionsongs.tumblr.com/) — Blog by Meara O'Reilly
* [Gestalt theory: Visual and Sonic Gestalt](http://doc.gold.ac.uk/~ma503am/essays/gestalt/)  — Article by Alex McLean
* [Artist-Programmers and Programming Languages for the Arts](http://yaxu.org/thesis/) — Alex McLean's PHD Thesis

### Books

* *Tanz in Körper und Gehirn*  (Sonification of Biological Rhythms) — by Gerold Baier 
* *Composing Music with Computers* — by Eduardo Miranda
* *Principles of Vibration and Sound* by Thomas Rossing & Neville Fletcher


[WAV]:	http://en.wikipedia.org/wiki/WAV
[RAW]:	http://en.wikipedia.org/wiki/Raw_audio_format
[SoundFont]: http://de.wikipedia.org/wiki/SoundFont
[MIDI]: http://de.wikipedia.org/wiki/MIDI
[OSC]: http://de.wikipedia.org/wiki/Open_Sound_Control

[Minim]: http://code.compartmental.net/tools/minim/
[Beads]: http://www.beadsproject.net/
[oscP5]: http://www.sojamo.de/libraries/oscP5/
[midiBus]: http://www.smallbutdigital.com/themidibus.php