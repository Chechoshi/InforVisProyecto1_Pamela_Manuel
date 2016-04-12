class CircPointGraph extends Group{
  
  static final int HORIZONTAL = 0;
  static final int VERTICAL = 1;
  float x,y,w,h;
  int m = 0;
  int n = 0;
  int mode = VERTICAL;

  float minValue = 0;
  float maxValue = MIN_FLOAT;

  float[][] data;
  int[] colors;

  CircPointGraph(int a, int b, int c, int d, float[][] v) {
    x = a; y = b; w = c; h = d; data = v;
  }

  void update() {
    empty();
    m = data.length;
    n = data[0].length;

    if (maxValue==MIN_FLOAT)
      for (int i=0; i<n; i++) {
        float value = max(data[i]);
        if (value > maxValue) 
          maxValue = value;
      }
    makeCircPoints(); 
  }

  void makeCircPoints() {
    float interval = w/n;
    for (int i=0; i<m; i++) {
      float[] coords = new float[n*2];
      for (int j=0; j<n; j++) {
        float[] value = circScale(j+0.5,0,n,data[i][j]*m);
        coords[j*2] = (x)+(((value[0])*w)/200);
        coords[j*2+1] = (y)+(((value[1])*h)/200);
      }
      add(newPolyline(coords).strokeColor(colors[i]).fillColor(colors[i]));
    }
    
  }
  
  float[] circScale(float v, float b, float s, float r) {
    float[] result = new float[2];
    result[0] = r/2*(float)Math.cos(((v-b)*(TWO_PI)/(s-b)));
    result[1] = r/2*(float)Math.sin(((v-b)*(TWO_PI)/(s-b)));
    return result;
  }
}