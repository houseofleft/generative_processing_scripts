void donut(float cX, float cY, float startRadius, float endRadius, float startAngle, float endAngle, float cStep, float noiseScale, float red, float green, float blue, float cVar, float noiseRStart, float noiseGStart, float noiseBStart) {
  //looping through distances from the centre
  for (float h = startRadius; h <= endRadius; h++) {
  // now figure out the circumference at this point
  // so we can draw the right amount of pixels
  // (this still doesn't quite work, can be levelled out with the cStep argument)
  float circumference = (endRadius * 2) * PI;
  // figuring out which points we want to start on
  float startC = map(startAngle, 0, 360, 0, circumference);
  float endC = map(endAngle, 0, 360, 0, circumference);
    for (float c = startC; c <= endC; c+= cStep) {
      // but we need to convert point in the circumference to an angle now
      // which we can do pretty quickly with mapping
      float angle = map(c, 0, circumference, 0, 360);
      float opposite = sin(radians(angle)) * h;
      float adjacent = cos(radians(angle)) * h;
      // now affecting colour based on noise of x and y
      float rNoise = noise(((cX + adjacent)*noiseScale)+noiseRStart, ((cY+opposite)*noiseScale)+noiseRStart);
      float gNoise = noise(((cX + adjacent)*noiseScale)+noiseGStart, ((cY+opposite)*noiseScale)+noiseGStart);
      float bNoise = noise(((cX + adjacent)*noiseScale)+noiseBStart, ((cY+opposite)*noiseScale)+noiseBStart);
      float rColour = map(rNoise, 0, 1, max(0, red-cVar), min(255, red+cVar));
      float gColour = map(gNoise, 0, 1, max(0, green-cVar), min(255, green+cVar));
      float bColour = map(bNoise, 0, 1, max(0, blue-cVar), min(255, blue+cVar));
      stroke(rColour, gColour, bColour);
      point(cX + adjacent, cY + opposite);
    }
  }
}

