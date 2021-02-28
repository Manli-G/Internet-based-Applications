// For Nature Content
PImage applyGain(PImage p) {
  
  PImage q = createImage(p.width, p.height, RGB);
  
  p.loadPixels();
  q.loadPixels();
  for (int i = 0; i < q.pixels.length; i += 1) {
    if (alpha(p.pixels[i]) !=0){
      float r = min(red(backgroundMovie.pixels[i]) * gainR, 255);
      float g = green(backgroundMovie.pixels[i]);
      float b = min(blue(backgroundMovie.pixels[i]) * gainB, 255);
      q.pixels[i] = color(r, g, b);
    }else{
      q.pixels[i] = color(0, 0, 0,1);
    }
    
    
    
  }
  q.updatePixels();
  
  
  return q;
}

// For Synthetic Content

PImage applyGainS(PImage p) {
  
  PImage q = createImage(p.width, p.height, RGB);
  
  p.loadPixels();
  q.loadPixels();
  for (int i = 0; i < syntheticMovie.pixels.length; i += 1) {
    float r = min(red(syntheticMovie.pixels[i]) * gainR_s, 255);
    float g = green(syntheticMovie.pixels[i]);
    float b = min(blue(syntheticMovie.pixels[i]) * gainB_s, 255);
    
    syntheticMovie.pixels[i] = color(r, g, b);
  }
  q.updatePixels();
  
  
  return q;
}
