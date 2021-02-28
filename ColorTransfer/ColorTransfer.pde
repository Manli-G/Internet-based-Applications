import gifAnimation.Gif;
import processing.video.*;



final float USER_VARIANCE_SCALING_DELTA = 0.05;
float userVarianceScaling = 0.1;

int currentSythetic = 0;
String [] backgroundFilenames = { "Water-21551.mp4","run-01.mp4"};
String [] syntheticFilenames = {"t-rex.gif","yoga-01.gif"};

Gif syntheticMovie;
PImage backgroundImage;
Movie [] frames = new Movie[backgroundFilenames.length];
PImage syntheticImage;
PImage patch = null;

String currentAlgorithm = "currentAlgorithm";
String currentAlgorithmS = "currentAlgorithm";

int current = 0;

float gainR, gainB,gainR_s, gainB_s;

boolean playing = true;
boolean adjustColoursToL = false;
boolean adjustColoursToY = false;
//boolean patch = false;


void setup() {
  frameRate(30);
  size(1280, 720);
  loadFrames();
  
  //backgroundMovie = new Movie(this, backgroundFilenames[current]);
  syntheticMovie = new Gif(this,syntheticFilenames[currentSythetic]);
  
  frames[current].loop();
  syntheticMovie.loop();
  
  
}
void loadFrames() {
  for (int i = 0; i < frames.length; i += 1) {
    frames[i] = new Movie (this,backgroundFilenames[i]);
  }
}

void draw() {
  background(0);
  image(frames[current],0,0, 1280, 720);
  backgroundImage = frames[current].copy();
  
  //image(backgroundImage, 0, 0,1280,720);
  //image(getRGBHistogram(backgroundMovie), 0 , height - 200);
  image(getRGBHistogram(frames[current]), width - 200 , height - 200);
  
  syntheticImage = syntheticMovie.copy();
  
  image(getRGBHistogram(syntheticMovie),0, height - 200);
  
  // labRGB transfer
  
  if (adjustColoursToL) {
    fill(0);
    rect(width - 110, 5, 100, 40);
    fill(255);
    text("Lab: "+nf(userVarianceScaling, 1, 3), width - 100, 30);
    syntheticImage = Lab_applyScalingsFromTo(frames[current], syntheticImage);
  }
  
  // YCbCrRGB transfer
  
  if (adjustColoursToY) {
    fill(0);
    rect(width - 110, 50, 100, 40);
    fill(255);
    text("YCbCr: "+nf(userVarianceScaling, 1, 3), width - 100, 75);
    syntheticImage = YCbCr_applyScalingsFromTo(frames[current], syntheticImage);
  }
  
  
  
  // syntheticMovie postions 
  if(currentSythetic != 0){
      image(syntheticImage, 0, height-700);
    }else{
      image(syntheticImage, 0, height/5,620,360);
    }
  

  
}
void movieEvent(Movie m) {
  m.read();
}
