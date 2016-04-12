class Faceted extends Group
{
  String[] namesX;
  float[] valuesX;
  String[] Val2X; 
  float[][][][] namesW;
  float[] valuesW;
  String[] investments = new String[] {"Agua","Elec","Tel", "Com"};
  float max;
  int min;
  String Externo;
  String Interno;
  int[] colors = new int[] {#ff0000,#00ff00,#0000ff,#ff00ff};
  
  Faceted(String[] namese, String[] Valuex, float maxValue, int minx, float[][][][] naW)/*(String[] namese, float[] valuese, String[][] namesi, float[][] valuesi, String exter, String inter)*/
  {
    namesX = namese;
    namesW = naW;
    Val2X = Valuex;
    max = maxValue;
    min = minx;
  }
  void update()
  {
      Legend legend1 = new Legend(280,80,investments,colors,Legend.VERTICAL);
      legend1.update();
      add(legend1);
      RectAxis rect = new RectAxis(150,520,400,BOTTOM);
      rect.tickInc = 10;
      rect.tickLen = 5;
      rect.items = namesX;
      rect.update();
      add(rect);
      RectNumAxis rect2 = new RectNumAxis(150,520,400,LEFT,0,max/*max(valuesX)*/);
      rect2.tickInc = min;
      rect2.tickLen = 5;
      rect2.update();
      add(rect2);
        float inc = ((rect.extent*1.0)/(rect.items.length))/2;/*Distancias medias entre un tick y el siguiente en el eje x*/
        float inc2 = rect2.tickpos/2;/*Distancias medias entre un tick y el siguiente en el eje y*/
        for(int i = 0; i < rect.coords.length - 1; i++)
        {
          try
          {
            for(int j = 0; j < rect2.coords.length - 1; j++)
            {
              CircPointGraph bar1 = new CircPointGraph(int(rect.coords[i][0] + inc),int(rect2.coords[j][1] - inc2),int(inc),int(inc),namesW[i][j]);
              bar1.colors = colors;
              bar1.update();
              add(bar1);
              RectNumAxis re = new RectNumAxis(int(rect.coords[i][0] + inc),int(rect2.coords[j][1] - inc2),int(inc/2),BOTTOM,0,50);
              re.tickInc = 20;
              re.tickLen = 5;
              re.update();
              add(re);
              CircCatAxis circ = new CircCatAxis(int(rect.coords[i][0] + inc), int(rect2.coords[j][1] - inc2), int(inc), Val2X);
              circ.update();
              add(circ);
            }
          }
          catch(Exception e)
          {
          }
        }
      
   
  }
}