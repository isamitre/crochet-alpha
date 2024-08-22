int instrX = 100;
float instrChangeX = 40;
int indivColorCheck = 20;
int colorCheck = 50;
boolean printed = false;

void calculate() {
  int y = int(height - ppr/2 - ppr*(currRow-1));
  color nextColor = color(0);
  int currNumColor = 1;
  int totalColors = 0;

  //printColumnHeaders();

  float initialX = int(width - pps/2);
  color currColor = getAverageColor(int(initialX - pps*(currStitch-1)), y);
  if (even) {
    initialX = pps/2;
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
      //printChange();
    }
    // update variables
    currColor = nextColor;
    currNumColor++;
  }

  //printBreak();
  printed = true;
}

// gets average color of square
color getAverageColor(int x, int y) {
  int totalNum = 361;
  float radius = pps*0.4;
  color middleColor = get(x, y);
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
