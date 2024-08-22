void writeInstructions(int currNumColor, int totalColors, color currColor) {
  // write instruction for curr color
  fill(0);
  String instructions = "     (" + nf(currNumColor, 2, 0) + ")";
  text(instructions, instrX+totalColors*instrChangeX, 15);
  // draw rect for curr color
  strokeWeight(1);
  fill(currColor);
  rect(instrX + totalColors*instrChangeX, 6, pps, ppr);
}

boolean createInstructionsCheck(int x, color currColor, color nextColor) {
  // get currColor components
  float currRed = red(currColor);
  float currGreen = green(currColor);
  float currBlue = blue(currColor);

  // get nextColor components
  float nextRed = red(nextColor);
  float nextGreen = green(nextColor);
  float nextBlue = blue(nextColor);

  // get diff
  float diffRed = abs(nextRed - currRed);
  float diffGreen = abs(nextGreen - currGreen);
  float diffBlue = abs(nextBlue - currBlue);
  float diffSum = diffRed + diffGreen + diffBlue;

  //boolean diffCheck = abs(diff) >= 213731;
  boolean diffCheck = diffSum >= colorCheck;
  boolean indivDiffCheck = abs(diffRed) >= indivColorCheck
    || abs(diffGreen) >= indivColorCheck
    || abs(diffBlue) >= indivColorCheck;

  //float[] nums = {x, currStitch, currColor, nextColor, diffSum};
  //printNums(nums);
  //float[] diffs = {diffRed, diffGreen, diffBlue};
  //printNums(diffs);

  return indivDiffCheck || diffCheck;
}
