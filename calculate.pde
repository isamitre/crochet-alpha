boolean printed = false;

void calculate() {

  int instrX = 100;
  float instrChangeX = 40;

  float initialX = int(width - pps/2);
  int y = int(height - ppr/2 - ppr*(currRow-1));
  color currColor = get(int(initialX - pps*(currStitch-1)), y);
  int currNumColor = 1;
  int totalColors = 0;
  int indivColorCheck = 61;

  for (float i = currStitch; i <= stitches; i++) {
    // calculate position of curr stitch
    int x = int(initialX - pps*i);

    // get components of currColor
    float currRed = red(currColor);
    float currGreen = green(currColor);
    float currBlue = blue(currColor);

    // get nextColor
    color nextColor = get(x, y);
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
      println(x, currStitch, currNumColor, currColor, nextColor);
      println("\t", diff, diffRed, diffGreen, diffBlue);
      println("\t", diffCheck, indivDiffCheck);
    }

    if (diffCheck && indivDiffCheck) {
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

// overall: 4330975.0, 5361798.0, 213731.0, 8694926.0, 7254157.0
// indiv: 66, 122, 67, 133, 115,
// 4330975.0 66.0 22.0 33.0
