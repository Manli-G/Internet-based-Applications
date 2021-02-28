int [] rgb2YCbCr(float r, float g, float b) {
  int [] YCbCr = new int[3];

  YCbCr[0] = floor(0.299 * r + 0.587 * g + 0.114 * b);
  YCbCr[1] = floor(128 - 0.168736 * r + 0.331264 * g - 0.5 * b);
  YCbCr[2] = floor(128 + 0.5 * r - 0.418688 * g - 0.081312 * b);

  return YCbCr;
}

int [] YCbCr2RGB(float Y, float Cb, float Cr) {
  int [] rgb = new int[3];

  rgb[0] = clip(floor(Y + 1.402 * (Cr -128)), 0, 255);
  rgb[1] = clip(floor(Y - 0.34414 *(Cb - 128) -  0.71414 *(Cr - 128)), 0, 255);
  rgb[2] = clip(floor(Y + 1.772 * (Cb - 128)), 0, 255);
  
  return rgb;
}
