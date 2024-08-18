void keyPressed() {
  printed = false;
  if (keyCode == UP && currRow < rows) {
    currRow++;
  } else if (keyCode == DOWN && currRow > 1) {
    currRow--;
  } else if (keyCode == LEFT) {
    if (currStitch < stitches) {
      currStitch++;
    }
  } else if (keyCode == RIGHT) {
    if (currStitch > 1) {
      currStitch--;
    }
  }
}

void mouseClicked() {
  fill = get(mouseX, mouseY);
}
