class CircCatAxis extends Group {
  float x,y,w,h;

  float extent = 100;

  int tickInc = 20;
  int tickLen = 10;

  boolean tickEnable = true;
  boolean labelEnable = true;

  String[] items;

  Group ticks;
  Group labels;
  Circle baseline;

  CircCatAxis(int a, int b, int c, String[] d) {
    x = a; y = b; extent = c; items = d;
  }

  void update() {
    empty();
    baseline = newCircle(x,y,extent);
    baseline.fillColor(Style.NONE);
    if (tickEnable)
      makeTicksCat();
    if (labelEnable)
      makeLabelsCat();
    add(ticks);
    add(labels);
    add(baseline);
  }

  void makeTicksCat() {
    ticks = new Group();
    
    float posA[],posB[];
    int n = items.length;
    for (int i=0; i<n; i++) {
      posA = circScale(i-n/4, 0, n, extent);
      posB = circScale(i-n/4, 0, n, extent+tickLen);
      ticks.add(newLine(x+posA[0], y+posA[1], x+posB[0], y+posB[1]));
    }
  }

  void makeLabelsCat() {
    labels = new Group();
    labels.fontAlign(CENTER,CENTER);
    
    String label;
    float coord[];
    int n = items.length;
    for (int i=0; i<n; i++) {
      label = items[i];
      coord = circScale(i+0.5-n/4, 0, n, extent+tickLen*4);
      labels.add(newText(label, x+coord[0], y+coord[1]));
    }
  }
  
  float[] circScale(float v, float b, float s, float r) {
    float[] result = new float[2];
    result[0] = r/2*(float)Math.cos(((v-b)*(TWO_PI)/(s-b)));
    result[1] = r/2*(float)Math.sin(((v-b)*(TWO_PI)/(s-b)));
    return result;
  }
}