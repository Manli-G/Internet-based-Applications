float [] Lab_getMeansFrom(PImage p) {
  float [] m = new float [3];
  int count = 0;

  p.loadPixels();
  
  for (int i = 0; i < p.pixels.length; i += 1) {
    if (alpha(p.pixels[i]) != 0) {
      //int [] cp = rgb2Lab(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));
      int [] cp = rgb2YCbCr(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));
      for (int j = 0; j < m.length; j += 1) {
        m[j] += cp[j];
      }
      count += 1;
    }
  }

  for (int j = 0; j < m.length; j += 1) {
    m[j] /= count;
  }

  return m;
}

float [] Lab_getStandardDeviationsFrom(PImage p) {
  float [] m = Lab_getMeansFrom(p);
  float [] sd = new float [3];
  int count = 0;

  p.loadPixels();

  for (int i = 0; i < p.pixels.length; i += 1) {
    if (alpha(p.pixels[i]) != 0) {
      //int [] cp = rgb2Lab(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));
      int [] cp = rgb2YCbCr(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));


      for (int j = 0; j < sd.length; j += 1) {
        sd[j] += ((cp[j] - m[j]) * (cp[j] - m[j]));
      }
      count += 1;
    }
  }

  for (int j = 0; j < sd.length; j += 1) {
    sd[j] = sqrt(sd[j] / count);
  }

  return sd;
}
// YCbCr
float [] YCbCr_getMeansFrom(PImage p) {
  float [] m = new float [3];
  int count = 0;

  p.loadPixels();
  
  for (int i = 0; i < p.pixels.length; i += 1) {
    if (alpha(p.pixels[i]) != 0) {
      //int [] cp = rgb2Lab(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));
      int [] cp = rgb2YCbCr(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));
      for (int j = 0; j < m.length; j += 1) {
        m[j] += cp[j];
      }
      count += 1;
    }
  }

  for (int j = 0; j < m.length; j += 1) {
    m[j] /= count;
  }

  return m;
}

float [] YCbCr_getStandardDeviationsFrom(PImage p) {
  float [] m = YCbCr_getMeansFrom(p);
  float [] sd = new float [3];
  int count = 0;

  p.loadPixels();

  for (int i = 0; i < p.pixels.length; i += 1) {
    if (alpha(p.pixels[i]) != 0) {
      //int [] cp = rgb2Lab(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));
      int [] cp = rgb2YCbCr(red(p.pixels[i]), green(p.pixels[i]), blue(p.pixels[i]));


      for (int j = 0; j < sd.length; j += 1) {
        sd[j] += ((cp[j] - m[j]) * (cp[j] - m[j]));
      }
      count += 1;
    }
  }

  for (int j = 0; j < sd.length; j += 1) {
    sd[j] = sqrt(sd[j] / count);
  }

  return sd;
}
