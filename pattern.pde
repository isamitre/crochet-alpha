
void createPattern() {
  for (int i = 1; i <= rows; i++) {
    int y = int(height - ppr/2 - ppr*(i-1));
    color nextColor = color(0);
    int currNumColor = 1;
    int totalColors = 0;

    printColumnHeaders();

    float initialX = int(width - pps/2);
    color currColor = getAverageColor(int(initialX), y);
    if (even) {
      initialX = pps/2;
    }
    for (float j = currStitch; j <= stitches; j++) {
      int x = int(initialX - pps*j);
      if (even) {
        x = int(initialX + pps*j);
      }
      nextColor = getAverageColor(x, y);

      if (createInstructionsCheck(currColor, nextColor) || j==stitches) {
        int currY = 10+int(i*ppr);
        writeInstructions(currNumColor, totalColors, currColor, currY);

        // write row num
        fill(0);
        textAlign(RIGHT);
        text(i, 8, currY);
        textAlign(LEFT);

        currNumColor = 0;
        totalColors++;
        printChange();
      }
      // update variables
      currColor = nextColor;
      currNumColor++;
    }
  }

  printBreak();
  printed = true;
}
