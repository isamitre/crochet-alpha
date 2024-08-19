void keyPressed() {
  printed = false;
  if (keyCode == UP && currRow < rows) {
    currRow++;
    currStitch = abs(stitches + 1- currStitch);
  } else if (keyCode == DOWN && currRow > 1) {
    currRow--;
    currStitch = abs(stitches + 1 - currStitch);
  } else if (keyCode == LEFT) {
    if (currStitch < stitches && !even) {
      currStitch++;
    }
    if (currStitch > 1 && even) {
      currStitch--;
    }
  } else if (keyCode == RIGHT) {
    if (currStitch > 1 && !even) {
      currStitch--;
    }
    if (currStitch < stitches && even) {
      currStitch++;
    }
  }
}

void mouseClicked() {
  println(get(mouseX, mouseY));
}
