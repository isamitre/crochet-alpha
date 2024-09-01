void parseFile() {
  try {
    imageName = reader.readLine();

    String imageSizeLine = reader.readLine();
    String[] imageSizes = split(imageSizeLine, ",");
    imageWidth = int(imageSizes[0]);
    imageHeight = int(imageSizes[1]);
    float factor;

    // adjust image width/height to fill screen
    if (imageWidth > imageHeight) {
      factor = (float) imageWidth/width;
      imageWidth = width;
      imageHeight /= factor;
    } else {
      factor = (float) imageHeight/(height - buffer);
      imageHeight = (int) height-buffer;
      imageWidth /= factor;
    }

    String crochetDetailsLine = reader.readLine();
    String[] crochetDetails = split(crochetDetailsLine, ",");
    stitches = int(crochetDetails[0]);
    rows = int(crochetDetails[1]);
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}
