Skeletons of Shapes
===================

## Silhouettes

Two men, one cutting a silhouette:

[![](http://images.metmuseum.org/CRDImages/dp/web-large/DP140863.jpg =x400)](http://metmuseum.org/Collections/search-the-collections/370831)

from the Collection of the Metropolitan Museum of Art.

### Silhouettes in the Arts

* [Silhouettes](http://en.wikipedia.org/wiki/Silhouette)
* [Shadowplay](http://en.wikipedia.org/wiki/Shadow_play)
* [Shadowgraphy](http://en.wikipedia.org/wiki/Shadowgraphy_%28performing_art%29)

### Photo Sensitive Paper

* [SunPrint Kit](http://www.sunprints.org/)
* [Solar-Fotopapier](http://astromedia.eu/Bastelspass-der-Wissen-schafft/Das-Solar-Fotopapier-21-5-x-28-cm::88.html)

### Binary Image Database

* [A Large Binary Image Database](http://www.lems.brown.edu/~dmc/main.html)


## Pixel Processing

Sequence matters.

* How many ways are there to process 3 x 3 pixels?
* How many ways are there to walk a grid of 3 x 3 pixels, visiting each pixel once?
* When will the sequnce influence the result of the image processing?


### Scan-Line

Most popular way to iterate over pixels + easily implemented.

* inspired by good old raytube television
* single or nested for-loop.


### Space Filling Curves

Pixels can be processed in any order you like. 

* [Self Avoiding Walks](http://en.wikipedia.org/wiki/Self-avoiding_walk) 
* Look-Up Table to get pixel position from pixel index (Custom walks)
* Formula to get pixel position from pixel index (Fractal space filling curves)


### Pixel Order

Pixel processing order depending on the input image!

***Examples***

* filling algorithms
* contour detection
* peeling off layers of pixels

### Parallel Processing

* Using the GPU to speed things up
* Which Pixel-Operations can be run in parallel, which can't?

## Thinning and Skeletonization

### Scan-Line Algorithms
* Scan the Image removing pixels (pixel templates)
  * How many pixel templates do you need?
  * How do you represent them?
* Make sure to preserve the topology

### Onion Peeling Algorithm

* Walk around the Structure, peeling of layer by layer.

### Medial Axis Transform

* Get the distance of each pixel to the border
* Pixels with maximum distance = Skeleton Pixels
* Weighted Skeleton can be used to reconstruct the original shape!

### Grassfire Transform

* See: [Grassfire Transform](http://en.wikipedia.org/wiki/Grassfire_transform)
* Setting Pixels on Fire
* Metrics: Measuring Distances, Math Style. 
  * Metrics based on Moore + VanNeumann Neighborhoods
  * Approximating the Euclidian Metric

## Skeletons

***What are skeletons?***

[Topological Skeleton](http://en.wikipedia.org/wiki/Topological_skeleton) on Wikipedia

The original Idea goes back to Blum's paper on [Biological Shape and Visual Science][BLU73].  
It's a fantastic paper. Read it!

Possible Problems:

* Connectedness of bones
* Small pertubations may lead to erraneous bones
* Similar Shapes may result in different skeletons

Recently a couple of variants have emerged, to take care of these problems:

* Shock Graph (See Grassfire Transform)
* Flux Graph [Flux Graphs for 2D Shape Analysis][REZ13], Morteza Rezanejad 2013


***Things you can do with them...***

* Identify "identical" Shapes
* Measure Shape Similarity
* Create Intermediate Shapes
* etc...


## Visualizing Algorithms

Starting with this lecture, we will be inventing our own algorithms.  
At the same time your processing sketches should be able to visualize the
algorithms you developed.

### Example 

Visualization of a [Knight's Tour](http://en.wikipedia.org/wiki/Knight%27s_tour):

![](http://upload.wikimedia.org/wikipedia/commons/0/0f/Knight%27s_tour_anim.gif)


### Animating (Sequential)

You can animate the process, by moving one step forward with every single 
draw loop. You can use `saveFrame("Movie-####.png")` to save individual frames, and then turn those into a video with your favorite movie editing software.

### Debugging (Interactive)

A Debugger Sketch lets you walk through the algorithm in a step by step manner.
Provide the user with keyboard shortcuts to walk back and forth in the history of the algorithm.

For going back in time you either need to keep track of previous steps (and reverse them) krrp track of previous states, or simply calculate all the steps over and over.


### Drawing (Graphical)

  * Connect successive loci of activity with a line
  * Color pixels based on time, state ...
  
### Small Multiples (Graphical)
   
   * Show several runs of your algorithm side by side
   * Show the result of your algorithm when applied to different inputs
   ## Exercises
### Exercise 01 — Crate a Silhouette
1. Create a Silhouette + Document the process (1 image, 3 sentences)
2. Turn the silouette into a 400x400 PNG
3. Create a Processing sketch to display the image

### Exercise 02 — Image Thinning

1. Pick one of those approaches 
2. Implement it in Processing
3. Visualize the Process of Thinning

### Exercise 03 — Skeletonization

1. Write a function that identifies critical pixels
   (i.e. Pixels which cannot be deleted without changing the topology)
2. Use the function to turn your thinning algorithm into a skeletonization algorithm

Answer the following questions:

* What makes a "good" skeleton
* Does your algorithm create a good skeleton. Why?

### Exercise 04 — Growing Muscles

Can you reconstruct the original shape from a skeleton?


## Literature

* [Biological shape and visual science (part I)][BLU73], Journal of Theoretical Biology, 1973
* [Shape description using weighted symmetric axis features][BLU78], Pattern Recognition, 1978
* [Flux Graphs for 2D Shape Analyisis][REZ13], PHD Thesis, 2013

[BLU73]:http://www.sciencedirect.com/science/article/pii/0022519373901756
[BLU78]:http://www.sciencedirect.com/science/article/pii/0031320378900250
[REZ13]:http://cim.mcgill.ca/~morteza/publications/MortezaRezanejadMScThesis.pdf

