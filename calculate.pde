int instrX = 100;
float instrChangeX = 40;
int indivColorCheck = 46;
boolean printed = false;

void calculate() {
  int y = int(height - ppr/2 - ppr*(currRow-1));
  color nextColor = color(0);
  int currNumColor = 1;
  int totalColors = 0;

  if (!printed)
    println("x", "\tcurrStitch", "\tcurrColor", "\tnextColor");

  float initialX = int(width - pps/2);
  color currColor = get(int(initialX - pps*(currStitch-1)), y);
  if (even) {
    initialX = -pps/2;
    currColor = get(int(initialX + pps*(currStitch-1)), y);
  }
  for (float i = currStitch; i <= stitches; i++) {
    int x = int(initialX - pps*i);
    if (even) {
      x = int(initialX + pps*i);
    }
    nextColor = get(x, y);

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
  }
}

void writeInstructions(int currNumColor, int totalColors, color currColor) {
  // write instruction for curr color
  fill(0);
  String instructions = "     (" + nf(currNumColor, 2, 0) + ")";
  text(instructions, instrX+totalColors*instrChangeX, 15);
  // draw rect for curr color
  strokeWeight(1);
  fill(currColor);
  rect(instrX + totalColors*instrChangeX, 6, pps, ppr);
  if (!printed) {
    println(currNumColor);
  }
}

boolean createInstructionsCheck(int x, color currColor, color nextColor) {
  // get components of currColor
  float currRed = red(currColor);
  float currGreen = green(currColor);
  float currBlue = blue(currColor);

  // get nextColor
  float nextRed = red(nextColor);
  float nextGreen = green(nextColor);
  float nextBlue = blue(nextColor);

  // get diff
  float diff = abs(nextColor - currColor);
  float diffRed = abs(nextRed - currRed);
  float diffGreen = abs(nextGreen - currGreen);
  float diffBlue = abs(nextBlue - currBlue);

  //boolean diffCheck = abs(diff) >= 213731;
  boolean diffCheck = true;
  boolean indivDiffCheck = abs(diffRed) >= indivColorCheck
    || abs(diffGreen) >= indivColorCheck
    || abs(diffBlue) >= indivColorCheck;

  if (!printed) {
    println(x, "\t"+currStitch, "\t\t"+currColor, "\t"+nextColor);
    println("\t", diff, diffRed, diffGreen, diffBlue);
    println("\t", diffCheck, indivDiffCheck);
  }
  return diffCheck && indivDiffCheck;
}
