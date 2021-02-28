
void keyPressed() {
  switch (key) {
  case ' ':
    playing = !playing;
    if (playing) {
      backgroundMovie.loop();
      syntheticMovie.loop();
    } else {
      backgroundMovie.pause();
      syntheticMovie.pause();
    }
    break;
  case 'r':
    patch = null;
    currentAlgorithm = "currentAlgorithm";
    currentAlgorithmS = "currentAlgorithm";
    gainR = 0;gainB = 0;gainR_s = 0;gainB_s = 0;
    
    break;
  
  case 't' :
  case 'g':
    backgroundImage = adjustWhiteBalanceGW(backgroundMovie);
    syntheticImage = adjustWhiteBalanceGW(syntheticMovie);
    patch = null;
    //backgroundImage = adjustWhiteBalanceGW(frames[current]);
    currentAlgorithm = "greyworld";
    break;
  //The greyworld of synthetic content 
  /*case 's':
    patch = null;
    syntheticImage = adjustWhiteBalanceGWS(syntheticMovie);
    currentAlgorithmS = "greyworld";
    //syntheticMovie.loop();
    break;*/
  case 'w':
    if (patch != null) {
      backgroundImage = adjustWhiteBalanceWP(patch, backgroundMovie);
      currentAlgorithm = "whitepatch";
      patch = null;
    }
    break;
  case 'W':
    backgroundImage = adjustWhiteBalanceWP(backgroundMovie, backgroundMovie);
    currentAlgorithm = "whitepatch-full";
    patch = null;
    break;
 
  case CODED:
    
    break;
  }
}



void showTransferAmount() {
  fill(0);
  rect(width - 510, 5, 100, 40);
  fill(255);
  
}
void showMoviesInfo() {
  fill(0);
  rect(width - 300, 5, width - 1000, 100);
  fill(255);
  text("Nature Content: " + currentAlgorithm, 990, 30);
  text(" gain red = " + nf(gainR,1,3) +" , gain blue = " + nf(gainB,1,3), 990, 45);
  text("Synthetic Content: " + currentAlgorithmS, 990, 70);
  text(" gain red = " + nf(gainR_s,1,3) +" , gain blue = " + nf(gainB_s,1,3), 990, 85);
  
}

void mouseClicked() {
  patchX = mouseX - PATCH_WIDTH / 2;
  patchY = mouseY - PATCH_HEIGHT / 2;
  patch = get(patchX, patchY, PATCH_WIDTH, PATCH_HEIGHT);
}
