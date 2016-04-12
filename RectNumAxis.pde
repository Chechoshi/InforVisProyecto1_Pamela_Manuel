class RectNumAxis extends Group {

  float x,y;

  float extent = 100;
  int position = BOTTOM;

  float minValue=0;
  float maxValue=10;

  int tickInc = 20;
  int tickLen = 10;
  int tickpos;

  boolean tickEnable = true;
  boolean labelEnable = true;
  float[][] coords;
  
  Group ticks;
  Group labels;
  Line baseline;

  RectNumAxis(float a, float b, float c, int d, float e, float f) {
    x = a; y = b;
    extent = c; position = d;
    minValue = e; maxValue = f;
  }

  void update() {
    empty();
    if ((position == TOP)||(position == BOTTOM))
      baseline = newLine(x, y, x+extent, y);
    else if ((position == LEFT)||(position == RIGHT))
      baseline = newLine(x, y, x, y-extent);
    if (tickEnable)
      makeTicksNum();
    if (labelEnable)
      makeLabelsNum();
    add(ticks);
    add(labels);
    add(baseline);
  }

  void makeTicksNum() {
    ticks = new Group();
    
    int axisMode = -1;
    if ((position == LEFT)||(position == BOTTOM))
      axisMode = 1;

    for (float v=minValue; v<=maxValue; v+=tickInc) {
      float pos = map(v, minValue, maxValue, 0, extent);
      if ((position == TOP)||(position == BOTTOM))
        ticks.add(newLine(x+pos, y, x+pos, y-tickLen*axisMode));
      else if ((position == LEFT)||(position == RIGHT))
        ticks.add(newLine(x, y-pos, x-tickLen*axisMode, y-pos));
    }
  }

  void makeLabelsNum() {
    labels = new Group();
    int axisMode = 1;
    float cantes = ((maxValue - minValue)/tickInc) + 1;
    coords = new float[(int)cantes][2];
    if((position == LEFT)||(position == BOTTOM))
      axisMode = -1;
     
     int anchorMode = CENTER;
     if (position == LEFT)
       anchorMode = RIGHT;
     else if (position == RIGHT)
       anchorMode = LEFT;
     int posicion = 0; 

    for (float v=minValue; v<=maxValue; v+=tickInc) 
    {
      int pos;
      if ((position == LEFT)||(position == RIGHT))
        {pos = (int)map(v, minValue, maxValue, 0, extent);}
      else
        {pos = (int)map(v, maxValue, minValue, 0, extent);}
      String label = str(v);
      if ((position == TOP)||(position == BOTTOM))
        labels.add(newText(label, x+pos, y-(tickLen*2)*axisMode).fontAlign(anchorMode,CENTER));
      else if ((position == LEFT)||(position == RIGHT)){
        labels.add(newText(label, x+(tickLen*2)*axisMode,y-pos).fontAlign(anchorMode,CENTER));
        coords[posicion][0] = x+((tickLen*2)*axisMode);
        coords[posicion][1] = (y - pos);
        print("//y - pos->");
        print(coords[posicion][1]);
        posicion++;
      }
      tickpos = (int(coords[0][1]))-(int(coords[1][1]));
    }
  }
}