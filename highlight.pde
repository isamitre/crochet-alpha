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
  float rectX;
  if (even) {
    rectX = (currStitch-1)*pps;
  } else {
    rectX = width - currStitch*pps;
  }
  float rectY = height - currRow*ppr;
  rect(rectX, rectY, pps, ppr);
}
