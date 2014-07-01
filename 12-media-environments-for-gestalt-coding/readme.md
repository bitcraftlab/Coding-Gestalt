Media Environements for Gestalt Coding
======================================

# A little Taxonomy of Sequencers

* Synthesizers are tools to construct sounds.
* Sequencer are tools to construct sequences of sounds.

## Linear Sequencers

In linear sequencer a linear scanline moves across the screen, triggering a sound event whenever the scanline hits a target.

#### Bird Step Sequencer ####

![](http://kathyhinde.co.uk/wp-content/uploads/2011/06/birdsequencer.jpg)

[Bird Step Sequncer](http://kathyhinde.co.uk/bi]rd-step-sequencer/) by Kathy Hinde and Ivan Franco.  
Watch the Video [here](http://vimeo.com/24324458).

#### Drone Music ####

[Robot Quadcopters](http://www.youtube.com/watch?v=_sUeGC-8dyk) performing the James Bond Theme - can you spot the sequencer? 

## Circular Sequencers

Circular sequencers work very much like the well known radar interface.
The scanline rotates around the center, triggering a *BLIP* whenever it hits a target.

A nice article about circular + other sequencers by Peter Kirn can be found [here](http://createdigitalmusic.com/2011/03/circles-and-euclidian-rhythms-off-the-grid-a-few-music-makers-that-go-round-and-round/)

* [Collaborative Circular Sequencer](http://nmf.cappel-nord.de/) runs in the browser using WebAudio
* [Ball keeper](https://www.youtube.com/watch?v=uLDm8DDCmuM#t=44) – a circular Blockout clone (and a circluar sequencer too?)

## Track Sequencers

In track sequencers, objects move along predefined tracks. Whenever they cross a certain point on the track a sound event is triggered.

#### Isle of Tune ####

![](http://isleoftune.com/apps/wp-content/uploads/2011/10/mini2.jpg)

[Isle of Tune](http://isleoftune.com/) is a track sequencer.  
The tracks are miniature roads on an island, the moving objects are little cars, and sound events can be attached to trees, buildings and other roadside objects.

#### IanniX ####

IanniX is an open source graphical track sequencer, that let's you create OSC events.

![](http://www.iannix.org/wp-content/uploads/2011/10/324373_343853132304762_2016969661_o-505x318.jpg)

See an example Video [here](http://www.youtube.com/watch?v=Yv5jWBa1lzM)

## Geometric Sequencers

#### Dial ####

![](http://dominofactory.net/images/thumb/dial_2013_update_t.png)

[Dial](http://dominofactory.net/works/dial.html) is a tool by Dominofactory – watch the video [here](http://vimeo.com/18929819).

#### Overbug ####

[Overbug](http://dominofactory.net/works/Overbug.html) is a tool by Dominofactory – watch the video [here](http://vimeo.com/6994418).


## Physical Sequencers

  
#### 2D Physics ####

* [Ball Droppings](http://balldroppings.com/js/) + [Source Code](https://github.com/craftoid/BallDroppings)
* [Melody Ball](http://www.melodyball.com/) works like Ball Droppings. But the arrangement is evolved, to create a target melody.

#### 3D Physics ####

* [Animusic](www.animusic.com) - animation of a physical music machine.
  * [PipeDream Video](http://www.youtube.com/watch?v=hyCIpKAIFyo)
  * [Resonant Chamber Video](http://www.youtube.com/watch?v=toXNVbvFXyk)

* [The Musical Turk](http://ulysse.io/turk/music.html) - animation of a physical music machine / circular piano.



## Bottom-Up Sequencers

Bottom-Up sequencers the exact sequence is a result of how individual nodes, are linked up to form a network or graph structure.


#### NodeBeat ####

In NodeBeat, nodes placed by the musician, automatically link up to form
a network based on proximity.

![](http://nodebeat.com/wp-content/themes/jquerymobile/img/slideshow/ipad-004.jpg)  
[NodeBeat](http://nodebeat.com/) is an opensource geometric sequencer.
Watch the video [here](http://vimeo.com/22681027).

#### Reactivision + Reactable ####

Reactivision sequencer relys on the same bottom-up process as Nodebeat, but the individual nodes are more closely linked to specific functions, so it's more of a node-based Synthesizer rather than just a sequencer.

Watch an intro video [here](http://www.youtube.com/watch?v=I9AeUISg-Og)

* [Reactable](www.reactable.com) (the product)
* [Reactivision](http://reactivision.sourceforge.net/) (the opensource software)

#### Texture ###

*Texture* is a visual programming environment, which is based on [Tidal](http://yaxu.org/demonstrating-tidal/) – a programming language for sound patterns, developed by [Alex McLean](http://yaxu.org).

In *Texture* both proximity and the grammar of the *Tidal* programming language determins how the nodes get connected to form a program (i.e. a turing-complete sequencer)

#### Acid Sketch ####

Acid sketch identified shapes inside an image, using their properties (diameter, elongation) to change timbre and pitch.
Again bottom up approach is used to create a network (or a spannig tree) between the shapes, thus determining the musical sequence.

Check out the [Video](http://vimeo.com/7492566) the open source [Code](https://github.com/yaxu/acidsketch).


## Gestalt Sequencers
*Bottom-Up Sequencers* are a first step towards actual Gestalt coding systems, since these systems use the law of proximity to form Programs.

If the connections made between nodes are based on a grammar, this is one step further towards Gestalt coding.

- How can the various Gestalt Laws be embedded in a Live-Coding System?
  (Similarity, Closure, Symmetry, Common Fate, Continuity, Good Gestalt ,Past Experience ...)
- Can you envision of a system where connections between nodes, are based on Gestalt Laws?
- Do you want to create something that has never been done before?
  

## Musical Instruments

The instruments below may serve as inspiration for designing your own sequencers...

#### Webcam Music ####

[Webcam Music](http://www.karenlabs.com/music/) is a browser-based app that uses webcam input to trigger sound events

#### Air-Harp ####

The [Air Harp](https://ccrma.stanford.edu/~adam/airharp/) is an OSX app that uses the *Leap Motion* as input device.  
Watch the video [here](http://www.youtube.com/watch?v=U2HFcfOwDtI) + check out the source [here](https://github.com/adamsomers/airharp).


## Exercises ##

Exercises can be found [here](exercises).

## Links ##

* [http://www.sequencer.de/]()
* [Circles and Euclidan Rhythms off the Grid](http://createdigitalmusic.com/2011/03/circles-and-euclidian-rhythms-off-the-grid-a-few-music-makers-that-go-round-and-round/)
