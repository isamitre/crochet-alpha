import processing.pdf.*;

PImage photo;

BufferedReader reader;
PImage photo;

String imageName;
int imageWidth;
int imageHeight;
int stitches;
int rows;

int buffer = 20;

float pps;
float ppr;

int currRow = 1;
int currStitch = 1;
boolean even = currRow % 2 == 0;

boolean hasCreatedPattern = false;
boolean parsedInputFile = false;

void setup() {
  size(600, 600);
  reader = createReader("input.txt");
}


void draw() {
  background(#E3EBFA);

  if (!parsedInputFile) {
    parseFile();
    photo = loadImage(imageName + ".jpg");
    parsedInputFile = true;
    ppr = (float) imageHeight/float(rows);
    pps = (float) imageWidth/float(stitches);
  }

  image(photo, 0, buffer, imageWidth, imageHeight);

  fill(0);
  text("Row " + currRow + ", Stitch " + currStitch, 5, 15);

  calculate();

  highlightRow();
  highlightStitch();

  even = currRow % 2 == 0;

  if (!hasCreatedPattern) {
    beginRecord(PDF, imageName + ".pdf");
    createPattern();
    endRecord();
    hasCreatedPattern = true;
  }
}
