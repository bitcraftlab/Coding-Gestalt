
  /////////////////////////////////////////
  //                                     //
  //        C A N V A S - C A M          //
  //                                     //
  /////////////////////////////////////////
  
  // Like PeasyCam, but for 2D ... 
  // (c) 2013 Martin Schneider @bitcraftlab
  // Optimized for compatibility with Processing 2.1 +


import processing.core.*;
import processing.event.*;


public class CanvasCam  {
  
  PApplet app;
  
  float minzoom;
  float maxzoom;
  
  float cx, cy;
  
  public int mouseX, mouseY;
  public int pmouseX, pmouseY;

  public float zoom;
  public float width;
  public float height;

  public CanvasCam(PApplet sketch, float zoom) {
    
    minzoom = zoom;
    maxzoom = 16 * minzoom;
    app = sketch;

    app.registerMethod("pre", this);
    app.registerMethod("mouseEvent", this);
    
    reset();
    
  }
  
  // reset camera position and zoom
  public void reset() {
    width = app.width / minzoom;
    height = app.height / minzoom;
    cx = width / 2;
    cy = height / 2;
    zoom = minzoom;
  }
  
  // by default zoom towards the mouse pointer positon
  public void zoomBy(float delta) {
    zoomBy(delta, app.mouseX, app.mouseY);
  }
  
  // return the zoom-factor
  public float getZoom() {
    return zoom;
  }
  
  // zoom by a relative value ( greater 1.0 = zoom in) 
  // center coordinates serve as focus of the zooming operation
  public void zoomBy(float delta, float centerX, float centerY) {
    
    float newZoom = zoom * delta;
    float epsilon = 0.0001f;
    
    // only adjust zoom if it is within the valid range
    if(newZoom == PApplet.constrain(newZoom, minzoom - epsilon , maxzoom + epsilon)) {
       
      // zoom at the center
       float dx = centerX - app.width/2;
       float dy = centerY - app.height/2;
       cx += dx/zoom - dx/newZoom;
       cy += dy/zoom - dy/newZoom;
       zoom = newZoom;
       
    }

  }
  
  public float camX(float x) {
    return cx + (x - app.width/2 ) / zoom;
  }
  
  public float camY(float y) {
    return cy + ( y - app.height/2 ) / zoom;
  }
  
  public void pre() {
    app.translate(app.width/2, app.height/2);
    app.scale(zoom); 
    app.translate(-cx, -cy);
    getCoords();
  }
  
  void getCoords() {
    mouseX = Math.round(camX(app.mouseX));
    mouseY = Math.round(camY(app.mouseY));
    pmouseX = Math.round(camX(app.mouseX));
    pmouseY = Math.round(camY(app.mouseY));
  }
  
  public void strokeWeight(float sw) {
    app.strokeWeight( sw / zoom );
  }
  
  public void mouseEvent(MouseEvent evt) {
    
    if(evt.getAction() == MouseEvent.DRAG) {
      cx -= (app.mouseX - app.pmouseX) / zoom;
      cy -= (app.mouseY - app.pmouseY) / zoom;
    }
    
    /*
    if(evt.getAction() == MouseEvent.WHEEL) {
      zoomBy( evt.getCount() < 0 ? 1.05f : 1.0f / 1.05f);
    }
    */

  }
  
  
}

