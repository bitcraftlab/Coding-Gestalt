
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
 
 
import peasy.PeasyCam;
import java.text.CharacterIterator;
import lsystem.*;

Grammar grammar;
PeasyCam cam;

color backgroundColor = #333333;
int mdepth = 3;
float theta = HALF_PI;
float phi = HALF_PI ;

int pick;

Turtle turtle;

void setup() {

  size(500, 500, P3D);
  cam = new PeasyCam(this, width);

  // simple hilbert curve
  generate(0, mdepth);

  smooth(8);
  noStroke();
  
}

void draw() {

  background(backgroundColor);
  
  // lights
  ambientLight(200, 200, 200);
  directionalLight(30, 30, 30, 0, 1, 0);
  directionalLight(30, 30, 30, 0, -1, 0);
  directionalLight(70, 70, 70, 0, 0, 1);
  directionalLight(70, 70, 70, 0, 0, -1);


  turtle.draw();
  
}


void keyPressed() {
  
  switch(key) {
    
    case ' ':    
      turtle.reset();
      return;
      
    case '1': 
      pick = 0;
      break;
      
    case '2':
      pick = 1;
      break;
      
     case '3':
       pick = 2;
       break;
       
     case '4':
       pick = 3;
       break;
      
     case CODED:
     
       switch(keyCode) {
         case UP:
           mdepth++;
           break;
           
         case DOWN:
           mdepth--;
           break;
       }
       
       break;
         
  }
  
  generate(pick, mdepth);

}




