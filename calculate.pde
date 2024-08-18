
void calculate() {
  int y = int(height - ppr/2 + ppr*(currRow-1));    
  color currColor = get(int(width-pps/2), y);
  int currNumColor = 1;
  int totalColors = 0;
  
    for (float i = pps/2+pps; i < width - pps; i+= pps) {
    // calculate position of curr stitch
    int x = int(width - i - (currStitch-1)*pps);

    // get components of currColor
    float currRed = red(currColor);
    float currGreen = green(currColor);
    float currBlue = blue(currColor);
    
    // get nextColor
    color nextColor = (get(x, y));
    float nextRed = red(nextColor);
    float nextGreen = green(nextColor);
    float nextBlue = blue(nextColor);
    
    // get diff
    float diff = abs(nextColor - currColor);
    float diffRed = abs(nextRed - currRed);
    float diffGreen = abs(nextGreen - currGreen);
    float diffBlue = abs(nextBlue - currBlue);

    //println(num, x, ",", y, currColor, nextColor);
    //println("\t",diff, diffRed, diffGreen, diffBlue);

    if ((abs(diff) >= 213731) && (abs(diffRed) >= 66 || abs(diffGreen) >= 66 || abs(diffBlue) >= 66)) {
      // write instruction for curr color
      fill(0);
      String instructions = "     (" + nf(currNumColor,2,0) + ")";
      text(instructions, instrX+totalColors*instrChangeX, 15);
      // draw rect for curr color
      strokeWeight(1);
      fill(currColor);
      rect(instrX + totalColors*instrChangeX, 6, pps, ppr);
      
      // update variables
      currNumColor = 0;
      totalColors++;
    }
    
    // get currColor
    currColor = nextColor;
    
    // update count variables
    currNumColor++;
  }
  

  
}

// overall: 4330975.0, 5361798.0, 213731.0, 8694926.0, 7254157.0
// indiv: 66, 122, 67, 133, 115, 
