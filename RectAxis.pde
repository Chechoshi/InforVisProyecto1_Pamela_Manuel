class RectAxis extends Group {

  int x,y;

  int extent = 100;
  int position = BOTTOM;

  float minValue=0;
  float maxValue=10;

  int tickInc = 20;
  int tickLen = 10;
  int tickColor = 0;
  int tickWidth = 1;

  boolean tickEnable = true;
  boolean labelEnable = true;

  int labelColor = 0;
  int labelSize = 10;

  String[] items;
  float[] values;
  float[][] coords;

  Group ticks = newGroup();
  Group labels = newGroup();
  Line baseline;

  RectAxis(int _x, int _y, int _extent, int _position) {
    x = _x; 
    y = _y; 
    extent = _extent; 
    position = _position;
  }

  void update() {
    if((values != null)&&(values.length > 0))
    {
      items = new String[values.length];
      for(int i = 0; i < values.length; i++)
      {
        items[i] = str(values[i]);
      }
    }
    if ((position == TOP)||(position == BOTTOM))
      baseline = newLine(x, y, x+extent, y);
    else if ((position == LEFT)||(position == RIGHT))
      baseline = newLine(x, y, x, y+extent);
    if (tickEnable&&items!=null)
      makeTicksCat();
    if (tickEnable&&items==null)
      makeTicksNum();
    if (labelEnable&&items!=null)
      makeLabelsCat();
    if (labelEnable&&items==null)
      makeLabelsNum();
    add(ticks);
    add(labels);
    add(baseline);
  }

  void makeTicksNum() {
    ticks.strokeWidth(tickWidth);
    ticks.fillColor(tickColor);
    
    int axisMode = 1;
    if ((position == LEFT)||(position == BOTTOM))
      axisMode = -1;

    for (float v=minValue; v<=maxValue; v+=tickInc) {
      int pos = (int)rectScale(v, minValue, maxValue, 0, extent);
      if ((position == TOP)||(position == BOTTOM))
        ticks.add(newLine(x+pos, y, x+pos, y-tickLen*axisMode));
      else if ((position == LEFT)||(position == RIGHT))
        ticks.add(newLine(x, y+pos, x+tickLen*axisMode, y+pos));
    }
  }

  void makeTicksCat() {
    ticks.strokeWidth(tickWidth);
    ticks.fillColor(tickColor);
    coords = new float[items.length + 1][2];
    int axisMode = 1;
    if ((position == LEFT)||(position == BOTTOM))
      axisMode = -1;

    float inc = extent*1.0/items.length;
    int n = 0;
    for (float pos=0; pos<=extent; pos+=inc,n++)
    {
      if ((position == TOP)||(position == BOTTOM))
        {
          ticks.add(newLine(x+pos, y, x+pos, y-tickLen*axisMode));
          coords[(int)n][0] = x+pos;
          coords[(int)n][1] =  y;
        }
      else if ((position == LEFT)||(position == RIGHT))
        {ticks.add(newLine(x, y+pos, x+tickLen*axisMode, y+pos));}
        
    }
  }

  void makeLabelsNum() {

    labels.fontSize(labelSize);
    labels.fillColor(labelColor);
    
    int axisMode = 1;
    if ((position == LEFT)||(position == BOTTOM))
      axisMode = -1;
     
     int anchorMode = CENTER;
     if (position == LEFT)
       anchorMode = RIGHT;
     else if (position == RIGHT)
       anchorMode = LEFT;

    for (float v=minValue; v<=maxValue; v+=tickInc) {
      int pos;
      if ((position == LEFT)||(position == RIGHT))
        pos = (int)rectScale(v, maxValue, minValue, 0, extent);
      else
        pos = (int)rectScale(v, minValue, maxValue, 0, extent);
      String label = str(v);
      if ((position == TOP)||(position == BOTTOM))
        labels.add(newText(label, x+pos, y-(tickLen*2)*axisMode));
      else if ((position == LEFT)||(position == RIGHT))
        labels.add(newText(label, x+(tickLen*2)*axisMode,y+pos+labelSize/2));
    }
  }

  void makeLabelsCat() {
    labels.fontSize(labelSize);
    labels.fillColor(labelColor);
    
    int axisMode = 1;
    if ((position == LEFT)||(position == BOTTOM))
      axisMode = -1;

    int anchorMode = CENTER;
     if (position == LEFT)
       anchorMode = RIGHT;
     else if (position == RIGHT)
       anchorMode = LEFT;
    
    float inc = extent*1.0/items.length;
     
    int n=0;
    for (float pos=0; n<items.length; pos+=inc, n++) {
      String label = items[n];
      if ((position == TOP)||(position == BOTTOM))
         {labels.add(newText(label,x+pos+(inc/2), y-(tickLen*2)*axisMode));}
      else if ((position == LEFT)||(position == RIGHT))
        labels.add(newText(label, x+(tickLen*2)*axisMode, y+pos+(inc+labelSize)/2));
    }
  }
  
  float rectScale(float v, float b1, float s1, float b2, float s2) {
    return ((v - b1)*(s2-b2)/(s1-b1) + b2);
  }
}