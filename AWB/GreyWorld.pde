// For Nature Content
void calculateAverages(PImage p) {
  float [] averages = new float [3];

  p.loadPixels();
  
  for (int i = 0; i< p.pixels.length; i += 1){
    if (alpha(p.pixels[i]) != 0) {
      averages[0] += red(p.pixels[i]);
      averages[1] += green(p.pixels[i]);
      averages[2] += blue(p.pixels[i]);
    }
  }
  for (int i = 0; i< averages.length; i += 1){
    averages[i] /= p.pixels.length;
  }
  gainR = averages[1]/averages[0];
  gainB = averages[1]/averages[2];
}

PImage adjustWhiteBalanceGW(PImage p) {
  calculateAverages(p);

  return applyGain(p);
}

// For Synthetic Content
void calculateAveragesS(PImage p) {
  float [] averages = new float [3];

  p.loadPixels();
  for (int i = 0; i< p.pixels.length; i += 1){
    averages[0] += red(p.pixels[i]);
    averages[1] += green(p.pixels[i]);
    averages[2] += blue(p.pixels[i]);
  }
  for (int i = 0; i< averages.length; i += 1){
    averages[i] /= p.pixels.length;
  }
  gainR_s = averages[1]/averages[0];
  gainB_s = averages[1]/averages[2];
}
PImage adjustWhiteBalanceGWS(PImage p) {
  calculateAverages(p);

  return applyGainS(p);
}
