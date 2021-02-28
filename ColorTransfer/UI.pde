
void keyPressed() {
  switch (key) {
  case ' ':
    playing = !playing;
    if (playing) {
      frames[current].loop();
      syntheticMovie.loop();
    } else {
      frames[current].pause();
      syntheticMovie.pause();
    }
    break;
  case 'r':
    patch = null;
    frames[current] = new Movie(this, backgroundFilenames[current]);
    frames[current].play();
    frames[current].loop();
    currentAlgorithm = "currentAlgorithm";
    currentAlgorithmS = "currentAlgorithm";
    gainR = 0;gainB = 0;gainR_s = 0;gainB_s = 0;
    
    break;
  case 'l':
    current = (current + 1) % frames.length;
    frames[current] = new Movie(this, backgroundFilenames[current]);
    
    frames[current].play();
    frames[current].loop();
    break;
  case 'n':
    currentSythetic = (currentSythetic + 1) % syntheticFilenames.length;
    syntheticMovie = new Gif(this,syntheticFilenames[currentSythetic]);
    
    syntheticMovie.loop();
    break;
  case 't' :
    adjustColoursToL = !adjustColoursToL;
    break;
  case 'y' :
    adjustColoursToY = !adjustColoursToY;
    break;
   
 
  case CODED:
    adjustTransferAmount();
    
    break;
  }
}

void adjustTransferAmount() {
  switch (keyCode) {
  case UP:
    userVarianceScaling = min(userVarianceScaling + USER_VARIANCE_SCALING_DELTA, 1.0);
    break;
  case DOWN:
    userVarianceScaling = max(0, userVarianceScaling - USER_VARIANCE_SCALING_DELTA);
    break;
  }
}
