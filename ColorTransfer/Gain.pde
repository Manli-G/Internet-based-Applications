// For Nature Content
PImage applyGain() {
  
  //PImage q = createImage(p.width, p.height, RGB);
  
  //p.loadPixels();
  frames[current].loadPixels();
  for (int i = 0; i < frames[current].pixels.length; i += 1) {
    float r = min(red(frames[current].pixels[i]) * gainR, 255);
    float g = green(frames[current].pixels[i]);
    float b = min(blue(frames[current].pixels[i]) * gainB, 255);
    
    frames[current].pixels[i] = color(r, g, b);
  }
  frames[current].updatePixels();
  
  
  return frames[current];
}

// For Synthetic Content

PImage applyGainS() {
  
  //PImage q = createImage(p.width, p.height, RGB);
  
  //p.loadPixels();
  syntheticMovie.loadPixels();
  for (int i = 0; i < syntheticMovie.pixels.length; i += 1) {
    float r = min(red(syntheticMovie.pixels[i]) * gainR_s, 255);
    float g = green(syntheticMovie.pixels[i]);
    float b = min(blue(syntheticMovie.pixels[i]) * gainB_s, 255);
    
    syntheticMovie.pixels[i] = color(r, g, b);
  }
  syntheticMovie.updatePixels();
  
  
  return syntheticMovie;
}
