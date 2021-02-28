// For Nature Content
void calculateMaxima(PImage p, int lower, int upper) {
  float [] maximums = new float[3];
  int brightesPixelCount = 0;
  

  p.loadPixels();
  
  for (int i =0; i < p.pixels.length; i += 1){
    if (lower < brightness (p.pixels[i]) && brightness(p.pixels[i]) < upper){
      maximums [0] += red(p.pixels[i]);
      maximums [1] += green(p.pixels[i]);
      maximums [2] += blue(p.pixels[i]);
      brightesPixelCount += 1;
    }
  }
  for (int i =0; i < maximums.length; i += 1){
    maximums[i]/=brightesPixelCount;
  }
  gainR = maximums[1]/maximums[0];
  gainB = maximums[1]/maximums[2];
}

PImage adjustWhiteBalanceWP(PImage wp, PImage p) {
  int lower = 240;
  int upper = 255;
  
  if (wp != p) { // using user selected patch, be more lenient with range
    lower = 140;
  }
  calculateMaxima(wp, lower, upper);

  return applyGain(p);
}

// For Synthetic Content
void calculateMaximaS(PImage p, int lower, int upper) {
  float [] maximums = new float[3];
  int brightesPixelCount = 0;
  

  p.loadPixels();
  
  for (int i =0; i < p.pixels.length; i += 1){
    if (lower < brightness (p.pixels[i]) && brightness(p.pixels[i]) < upper){
      maximums [0] += red(p.pixels[i]);
      maximums [1] += green(p.pixels[i]);
      maximums [2] += blue(p.pixels[i]);
      brightesPixelCount += 1;
    }
  }
  for (int i =0; i < maximums.length; i += 1){
    maximums[i]/=brightesPixelCount;
  }
  gainR_s = maximums[1]/maximums[0];
  gainB_s = maximums[1]/maximums[2];
}

PImage adjustWhiteBalanceWPS(PImage wp, PImage p) {
  int lower = 240;
  int upper = 255;
  
  if (wp != p) { // using user selected patch, be more lenient with range
    lower = 140;
  }
  calculateMaximaS(wp, lower, upper);

  return applyGainS(p);
}
