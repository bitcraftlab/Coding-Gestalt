Structural Composition
======================

In this lecture you will learn how to:

* identify events as basic forms
* transmit events via OSC
* group events to forms using gestalt laws


## Setup


| Detector → Transmission → Composer      |
|-----------------------------------------|
| *Detector*  — Detect Events in the Data |
| *Composer*  —  Perceive + Create Forms  |


### Detector

*Input* — Continuous data  
*Process* — Identify events  
*Output* — Sequence of events

### Transmission

Open Sound Control


### Composer

*Perceive*

*Input:* — Sequence of Events  
*Process* — Group Events using Gestalt Laws  
*Output* — Nested Events 

*Create*

*Input* — Nested Events  
*Process* — Generate Visuals using Gestalt Laws  
*Output* — Visual Form or 3D Shape  


## Events

Typical Event Attributes are:

* Onset
* Type
* Intensity
* Duration

## Open Sound Control

### Demo

[osc_mouse_demo](demo/osc_mouse_demo) shows how to hook up two sketches via OSC.  
The demo is made up of two sketches, that need to run at the same time.

[OSC_Red_Mouse](demo/osc_mouse_demo(OSC_Red_Mouse) listens on port 50000 and sends to port 50001.  
[OSC_Blue_Mouse](demo/osc_mouse_demo(OSC_Blue_Mouse) listens on port 50001 and sends to port 50000.  

## Exercises 

The exercises can be found [here](exercises).