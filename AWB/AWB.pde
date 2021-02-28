import gifAnimation.Gif;
import processing.video.*;

final int PATCH_WIDTH = 30;
final int PATCH_HEIGHT = 30;
int patchX, patchY;
PImage patch = null;


String backgroundFilename = "run-01.mp4";
String syntheticFilename = "t-rex.gif";

PImage backgroundImage;
PImage syntheticImage;

Gif syntheticMovie;
Movie backgroundMovie;

//Movie [] frames = new Movie[backgroundFilename];


String currentAlgorithm = "currentAlgorithm";
String currentAlgorithmS = "currentAlgorithm";

int current = 0;

float gainR, gainB,gainR_s, gainB_s;

boolean playing = true;

//boolean patch = false;


void setup() {
  frameRate(30);
  size(1280, 720);
  
  //frameRate(30);
  
  backgroundMovie = new Movie(this, backgroundFilename);
  syntheticMovie = new Gif(this,syntheticFilename);
 
  backgroundMovie.loop();
  syntheticMovie.loop();
  
  
}


void draw() {
  background(0);
  image(backgroundMovie,0,0, 1280, 720);
  backgroundImage = backgroundMovie.copy();
  
  //image(backgroundImage, 0, 0,1280,720);
  //image(getRGBHistogram(backgroundMovie), 0 , height - 200);
  image(getRGBHistogram(backgroundMovie), width - 200 , height - 200);
  
  syntheticImage = syntheticMovie.copy();
  showMoviesInfo();
  
  image(getRGBHistogram(syntheticMovie),0, height - 200);
  //backgroundImage = adjustWhiteBalanceGW(frames[current]);
  //backgroundImage = adjustWhiteBalanceWP(frames[current], frames[current]);
  //backgroundImage = adjustWhiteBalanceWP(frames[current], frames[current]);
  
  
 
  if (patch != null) {
    backgroundImage = adjustWhiteBalanceGW(backgroundMovie);
    syntheticImage = adjustWhiteBalanceGWS(syntheticMovie);
    currentAlgorithm = "greyworld";
  }
  
  if (patch != null) {
    noFill();
    stroke(color(255,0,0));
    rect(patchX, patchY, PATCH_WIDTH, PATCH_HEIGHT);
  }
 
  
}
void movieEvent(Movie m) {
  m.read();
}
