
void printColumnHeaders() {
  if (!printed)
    println("x", "\tcurrStitch", "\tcurrColor", "\tnextColor");
}

void printBreak() {
  if (!printed) {
    println("----------------------------------------------------------\n\n");
  }
}

void printChange() {
  if (!printed) {
    println("CHANGE");
    printColumnHeaders();
  }
}

void printNums(float[] nums) {
  if (!printed) {
    for (float num : nums) {
      print(num+"\t");
    }
    println();
  }
}
