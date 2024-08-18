void highlightRow() {
  noStroke();
  fill(color(0), 50);
  float rectHeight = (rows - currRow)*ppr;
  rect(0, buffer, width, rectHeight);
  rectHeight = (currRow-1)*ppr;
  rect(0, buffer+(rows - currRow + 1)*ppr, width, rectHeight);
}

void highlightStitch() {
  noFill();
  stroke(0);
  strokeWeight(2);
  //fill(0);
  float rectX = width - currStitch*pps;
  float rectY = height - currRow*ppr;
  rect(rectX, rectY, pps, ppr);
}
