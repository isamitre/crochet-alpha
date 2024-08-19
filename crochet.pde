PImage photo;

String imagePath = "kenough.jpg";
int imageWidth = 564;
int imageHeight = 263;
int buffer = 20;

int stitches = 58;
int rows = 27;

float pps;
float ppr;

int currRow = 1;
int currStitch = 1;
boolean even = currRow % 2 == 0;

void setup() {
  size(564, 283);
  photo = loadImage(imagePath);
  ppr = (float) imageHeight/float(rows);
  pps = (float) imageWidth/float(stitches);
}

color fill = color(0);

void draw() {
  background(#E3EBFA);
  fill(0);
  image(photo, 00, 20);
  text("Row " + currRow + ", Stitch " + currStitch, 5, 15);

  calculate();

  highlightRow();
  highlightStitch();

  even = currRow % 2 == 0;

  //fill(color(-29293));
  fill(get(554, 278));
  rect(width/2, height/2, 50, 50);
}

// yellow to pink: -12185 -26729
// yellow to pink: -12432 -421997
