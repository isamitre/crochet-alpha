void keyPressed() {
  if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
    calculated=false;
  }
  if (keyCode == UP && currRow < rows) {
    currRow++;
  } else if (keyCode == DOWN && currRow > 1) {
    currRow--;
  } else if (keyCode == LEFT) {
    if (currStitch < stitches) {
      currStitch++;
    } else if (currRow < rows) {
      currStitch = 1;
      currRow++;
    }
  } else if (keyCode == RIGHT) {
    if (currStitch > 1) {
      currStitch--;
    } else if (currRow > 1){
      currStitch = stitches;
      currRow--;
    }
  }
}
 
void mouseClicked() {
  fill = get(mouseX, mouseY);
}
