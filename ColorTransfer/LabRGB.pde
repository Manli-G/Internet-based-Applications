int [] rgb2Lab(float r, float g, float b) {
  int [] lab = new int[3];

  lab[0] = floor(0.3475 * r + 0.8231 * g + 0.5559 * b);
  lab[1] = floor(0.2162 * r + 0.4316 * g - 0.6411 * b);
  lab[2] = floor(0.1304 * r - 0.1033 * g - 0.0269 * b);

  return lab;
}

int [] lab2RGB(float l, float a, float b) {
  int [] rgb = new int[3];

  rgb[0] = clip(floor(0.5773 * l + 0.2621 * a + 5.6947 * b), 0, 255);
  rgb[1] = clip(floor(0.5774 * l + 0.6072 * a - 2.5444 * b), 0, 255);
  rgb[2] = clip(floor(0.5832 * l - 1.0627 * a + 0.2073 * b), 0, 255);
  
  return rgb;
}

int clip(int v, int a, int b) {
  return max(a, min(v, b));
}
