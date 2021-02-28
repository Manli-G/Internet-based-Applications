// Lab Transfer
PImage Lab_applyScalingsFromTo(PImage r, PImage t) {
  PImage n = t.copy();

  float [] s = new float[3];
  
  float [] sdRef = Lab_getStandardDeviationsFrom(r);
  float [] sdTarget = Lab_getStandardDeviationsFrom(t);
  float [] mTarget = Lab_getMeansFrom(t);

  for (int j = 0; j < s.length; j += 1) {
    s[j] = 1.0 - userVarianceScaling + userVarianceScaling * sdRef[j] / sdTarget[j];
  }

  n.loadPixels();

  for (int i = 0; i < t.pixels.length; i += 1) {
    if (alpha(n.pixels[i]) != 0) {
      int [] cp = rgb2Lab(red(n.pixels[i]), green(n.pixels[i]), blue(n.pixels[i]));
     for (int j = 0; j < cp.length; j += 1) {
        cp[j] = int(s[j] * (cp[j] - mTarget[j]) + mTarget[j]);
      }

      int [] rgb = lab2RGB(cp[0], cp[1], cp[2]);
      n.pixels[i] = color(rgb[0], rgb[1], rgb[2]);
    }
  }

  n.updatePixels();

  return n;
}

// YCbCr Transfer
PImage YCbCr_applyScalingsFromTo(PImage r, PImage t) {
  PImage n = t.copy();

  float [] s = new float[3];
  
  float [] sdRef = YCbCr_getStandardDeviationsFrom(r);
  float [] sdTarget = YCbCr_getStandardDeviationsFrom(t);
  float [] mTarget = YCbCr_getMeansFrom(t);

  for (int j = 0; j < s.length; j += 1) {
    s[j] = 1.0 - userVarianceScaling + userVarianceScaling * sdRef[j] / sdTarget[j];
  }

  n.loadPixels();

  for (int i = 0; i < t.pixels.length; i += 1) {
    if (alpha(n.pixels[i]) != 0) {
      int [] cp = rgb2YCbCr(red(n.pixels[i]), green(n.pixels[i]), blue(n.pixels[i]));

      for (int j = 0; j < cp.length; j += 1) {
        cp[j] = int(s[j] * (cp[j] - mTarget[j]) + mTarget[j]);
      }

      int [] rgb = YCbCr2RGB(cp[0], cp[1], cp[2]);
      n.pixels[i] = color(rgb[0], rgb[1], rgb[2]);
    }
  }

  n.updatePixels();

  return n;
}
