int instrX = 100;
float instrChangeX = 40;
// peace.jpg, indivColorCheck=20, colorCheck=50
int indivColorCheck = 20;
int colorCheck = 50;
boolean printed = false;

void calculate() {
  int y = int(height - ppr/2 - ppr*(currRow-1));
  color nextColor = color(0);
  int currNumColor = 1;
  int totalColors = 0;

  if (!printed)
    println("x", "\tcurrStitch", "\tcurrColor", "\tnextColor");

  float initialX = int(width - pps/2);
  color currColor = getAverageColor(int(initialX - pps*(currStitch-1)), y);
  if (even) {
    initialX = -pps/2;
    currColor = getAverageColor(int(initialX + pps*(currStitch-1)), y);
  }
  for (float i = currStitch; i <= stitches; i++) {
    int x = int(initialX - pps*i);
    if (even) {
      x = int(initialX + pps*i);
    }
    nextColor = getAverageColor(x, y);

    if (createInstructionsCheck(x, currColor, nextColor) || i==stitches) {
      writeInstructions(currNumColor, totalColors, currColor);
      currNumColor = 0;
      totalColors++;
      printChange();
    }
    // update variables
    currColor = nextColor;
    currNumColor++;
  }

  if (!printed) {
    println("----------------------------------------------------------\n\n");
  }
  printed = true;
}

void printChange() {
  if (!printed) {
    println("CHANGE");
    println("x", "\tcurrStitch", "\tcurrColor", "\tnextColor");
  }
}

// gets average color of square
color getAverageColor(int x, int y) {
  int totalNum = 361;
  float radius = pps*0.4;
  color middleColor = get(x, y);
  if (!printed) {
    println("\t\t\t\t\t" + middleColor);
  }
  float redSquareSum = red(middleColor);
  float greenSquareSum = green(middleColor);
  float blueSquareSum = blue(middleColor);

  for (int i = 0; i < 360; i++) {
    int currX = x + int(radius*cos(i));
    int currY = y + int(radius*sin(i));
    color currColor = get(currX, currY);
    redSquareSum += pow(red(currColor), 2);
    greenSquareSum += pow(green(currColor), 2);
    blueSquareSum += pow(blue(currColor), 2);
  }

  // gets mean of the sum (of squares) and return its square root
  float newRed = sqrt(redSquareSum/(totalNum));
  float newGreen = sqrt(greenSquareSum/(totalNum));
  float newBlue = sqrt(blueSquareSum/(totalNum));

  return color(newRed, newGreen, newBlue);
}

void calculateRows() {
  int numRows = 0;

  for (int i = 20; i < height-1; i++) {
    color prevC = get(10, i);
    color currC = get(10, i+1) ;
    float prevRed = red(prevC);
    float prevGreen = green(prevC);
    float prevBlue = blue(prevC);

    float currRed = red(currC);
    float currGreen = green(currC);
    float currBlue = blue(currC);

    float redChange = (currRed - prevRed)/prevRed;
    float greenChange = (currGreen - prevGreen)/prevGreen;
    float blueChange = (currBlue - prevBlue)/prevBlue;

    float metric = 0.4;
    if (redChange > metric && greenChange > metric && blueChange > metric) {
      numRows++;
    }
    prevC = currC;
  }
  rows = numRows-2;
}

void calculateStitches() {
  int numStitches = 0;

  for (int i = 0; i < width; i++) {
    color prevC = get(i, 25);
    color currC = get(i+1, 25);

    float prevRed = red(prevC);
    float prevGreen = green(prevC);
    float prevBlue = blue(prevC);

    float currRed = red(currC);
    float currGreen = green(currC);
    float currBlue = blue(currC);

    float redChange = (currRed - prevRed)/prevRed;
    float greenChange = (currGreen - prevGreen)/prevGreen;
    float blueChange = (currBlue - prevBlue)/prevBlue;

    print((int)currRed, (int)currGreen, (int)currBlue, ",");

    if (currGreen == 0 && currBlue == 0 && redChange > 0.2) {
      numStitches++;
    }
    prevC = currC;
  }
  println("numStitches:", numStitches);
  //stitches = numStitches;
}
