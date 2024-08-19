int instrX = 100;
float instrChangeX = 40;
int indivColorCheck = 57;
boolean printed = false;

void calculate() {
  float initialX = int(width - pps/2);
  int y = int(height - ppr/2 - ppr*(currRow-1));
  color currColor = get(int(initialX - pps*(currStitch-1)), y);
  int currNumColor = 1;
  int totalColors = 0;

  for (float i = currStitch; i <= stitches; i++) {
    int x = int(initialX - pps*i);
    color nextColor = get(x, y);

    if (createInstructionsCheck(x, y, currColor, nextColor) || i==stitches) {
      // write instruction for curr color
      fill(0);
      String instructions = "     (" + nf(currNumColor, 2, 0) + ")";
      text(instructions, instrX+totalColors*instrChangeX, 15);
      // draw rect for curr color
      strokeWeight(1);
      fill(currColor);
      rect(instrX + totalColors*instrChangeX, 6, pps, ppr);

      // update variables
      currNumColor = 0;
      totalColors++;

      if (!printed) {
        println("CHANGE");
      }
    }

    // get currColor
    currColor = nextColor;

    // update count variables
    currNumColor++;
  }

  if (!printed) {
    println("----------------------------------------------------------\n\n");
  }
  printed = true;
}

void writeInstructions() {
}

boolean createInstructionsCheck(int x, int y, color currColor, color nextColor) {
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

  boolean diffCheck = abs(diff) >= 213731;
  boolean indivDiffCheck = abs(diffRed) >= indivColorCheck
    || abs(diffGreen) >= indivColorCheck
    || abs(diffBlue) >= indivColorCheck;

  if (!printed) {
    println(x, currStitch, currColor, nextColor);
    println("\t", diff, diffRed, diffGreen, diffBlue);
    println("\t", diffCheck, indivDiffCheck);
  }
  return diffCheck && indivDiffCheck;
}
