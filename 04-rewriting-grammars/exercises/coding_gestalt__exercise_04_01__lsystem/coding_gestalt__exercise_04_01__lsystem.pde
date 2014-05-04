/** 
 * Copyright (c) 2012 Martin Prout
 * 
 * This demo & library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
import java.text.CharacterIterator;
import lsystem.Grammar;
import lsystem.SimpleGrammar;              
import lsystem.util.*;

/**
 * A 3D LSystem example with a SimpleGrammar (if you want to do a tree use StochasticGrammar)
 * Relies on the processing primitive box, and thereafter it makes sense to use Processing
 * translate and rotate (cf my 2D eamples where I use trignometry rather than these tools)
 * Uses 'conventional 3D grammar'. Features PeasyCam to allow easy manipulation of the object.
 * To create "Ben Tilbert" set theta to 90.5 deg and phi to 89.5
 */

ArcBall arcball;
Grammar grammar;

float distance = 300;
int mdepth = 3;
float theta = radians(90);
float phi = radians(90);
// adjust center of hilbert
float[] adjust = {
  0.0, 0.5, 1.5, 3.5, 7.5, 15
};


void setup() {
  size(500, 500, P3D);
  grammar = new SimpleGrammar(this, "X");   // this only required to allow applet to call dispose()
  grammar.addRule('X', "^<XF^<XFX-F^>>XFX&F+>>XFX-F>X->");
  /**
  NB: ArcBall now centers the sketch and updates rotation in "pre()" draw
  */
  arcball = new ArcBall(this);
  setupGrammar();
  noStroke();
}

void setupGrammar() {
  grammar.generateGrammar(mdepth);
  distance *= pow(0.5, mdepth);
}

void draw() {
  background(0, 0, 10);
  lights();
  render();
}

void render() {
  translate(-distance * adjust[mdepth], distance * adjust[mdepth], -distance * adjust[mdepth]);    // center the hilbert 
  fill(0, 75, 152); 
  lightSpecular(204, 204, 204); 
  specular(255, 255, 255); 
  shininess(1.0); 
  CharacterIterator it = grammar.getIterator();
  for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()) {
    switch (ch) {
    case 'F': 
      translate(0, distance/-2, 0);
      box(distance/9, distance, distance/9);
      translate(0, distance/-2, 0);
      break;
    case '-':
      rotateX(theta);
      break;
    case '+':
      rotateX(-theta);
      break;
    case '>':
      rotateY(theta);
      break;
    case '<':
      rotateY(-theta);
      break;
    case '&':
      rotateZ(-phi);
      break;
    case '^':
      rotateZ(phi);
      break;
    case 'X':
      break;  
    default:
      System.err.println("character " + ch + " not in grammar");
    }
  }
}

void keyPressed() {

  if ((key == '+') && (mdepth <= 4)) { 
    mdepth++;
    distance = 300f;
    setupGrammar();
  }
  else if ((key == '-') && (mdepth > 1)) { 
    mdepth--;
    distance = 300f;
    setupGrammar();
  }
}





