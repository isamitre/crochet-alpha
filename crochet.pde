PImage photo;

String imagePath = "peace.jpg";
int imageWidth = 563;
int imageHeight = 386;

// kenough.jpg, width=564, height=283
// peace.jpg, width=563, height=386;

int buffer = 20;

int stitches = 70;
int rows = 48;

float pps;
float ppr;

int currRow = 1;
int currStitch = 1;
boolean even = currRow % 2 == 0;

void setup() {
  size(563, 406);
  photo = loadImage(imagePath);
  ppr = (float) imageHeight/float(rows);
  pps = (float) imageWidth/float(stitches);
  calculateRows();
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
}
