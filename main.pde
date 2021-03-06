Group view;

void setup() {
  size(850,600);
  
  //Ejemplo 1
  String[] months = new String[] {"Jan","Feb","Mar", "Abr"};
  String[] investments = new String[] {"Agua","Elec","Tel", "Com"};
  float[][][] values0 = new float[][][] {{{50,40,30},{40,30,20},{30,20,10},{20,10,10}}, {{50,50,30},{40,30,20},{50,40,10},{20,10,5}},{{50,50,30},{40,30,20},{30,20,40},{20,10,50}},{{40,50,30},{40,30,20},{30,20,20},{20,10,50}}, {{40,50,30},{40,30,20},{30,20,30},{20,40,50}}};
  float[][][] values1 = new float[][][] {{{50,40,30},{50,30,40},{30,20,10},{20,10,10}}, {{50,50,30},{40,30,20},{50,40,10},{20,10,5}},{{50,50,30},{40,30,20},{30,20,40},{20,10,50}}};
  float[][][] values2 = new float[][][] {{{20,40,30},{20,50,20},{30,10,10},{20,10,50}}, {{50,50,30},{40,30,20},{50,40,10},{20,10,5}},{{50,50,30},{40,30,20},{30,20,40},{20,10,50}},{{40,50,30},{40,30,20},{30,20,20},{20,10,50}}};
  float[][][] values3 = new float[][][] {{{50,40,30},{40,30,20},{30,20,10},{20,10,10}}, {{50,50,30},{40,30,20},{50,40,10},{20,10,5}},{{50,50,30},{40,30,20},{30,20,40},{20,10,50}},{{40,50,30},{40,30,20},{30,20,20},{20,10,50}}};
  float[][][][] values = new float[][][][] {values0, values1, values2, values3};
  
  float val = 50; //agregue esto para dar una maximo de valores
  int min = 10;
  int[] colors = new int[] {#ff0000,#00ff00,#0000ff,#ff00ff};
  
  /*
  //Ejemplo 2
  String[] months = new String[] {"Jan","Feb","Mar", "Abr", "May"};
  String[] investments = new String[] {"Agua","Elec","Tel", "Com"};
  float[][][] values0 = new float[][][] {{{50,40,30,50},{40,30,20,30},{30,20,10,20},{20,10,10,10}}, {{50,50,30,20},{40,30,20,10},{50,40,10,20},{20,10,5,20}},{{50,50,30,10},{40,30,20,20},{30,20,40,40},{20,10,50,10}},{{40,50,30,30},{40,30,20,10},{30,20,20,40},{20,10,50,10}}, {{40,50,30,10},{40,30,20,20},{30,20,30,50},{20,40,50,40}}};
  float[][][] values1 = new float[][][] {{{50,50,30,20},{40,30,20,10},{50,40,10,20},{20,10,5,20}},{{50,50,30,10},{40,30,20,20},{30,20,40,40},{20,10,50,10}},{{40,50,30,30},{40,30,20,10},{30,20,20,40},{20,10,50,10}}, {{40,50,30,10},{40,30,20,20},{30,20,30,50},{20,40,50,40}}};
  float[][][] values2 = new float[][][] {{{40,50,30,30},{40,30,20,10},{30,20,20,40},{20,10,50,10}}, {{40,50,30,10},{40,30,20,20},{30,20,30,50},{20,40,50,40}}};
  float[][][] values3 = new float[][][] {{{50,40,30,50},{40,30,20,30},{30,20,10,20},{20,10,10,10}}, {{50,50,30,20},{40,30,20,10},{50,40,10,20},{20,10,5,20}},{{50,50,30,10},{40,30,20,20},{30,20,40,40},{20,10,50,10}},{{40,50,30,30},{40,30,20,10},{30,20,20,40},{20,10,50,10}}};
  float[][][][] values = new float[][][][] {values0, values1, values2, values3};
  
  float val = 100; //agregue esto para dar una maximo de valores
  int min = 20;
  int[] colors = new int[] {#ff0000,#00ff00,#0000ff,#ff00ff};
  */
  /*
  //Ejemplo 3
  String[] months = new String[] {"Inversion","Gasto","Costo"};
  String[] investments = new String[] {"Agua","Elec","Tel"};
  float[][][] values0 = new float[][][] {{{50,50,20},{30,20,10},{50,40,10},{20,5,20}},{{50,50,30},{40,20,25},{20,40,40},{20,10,50}},{{40,50,30},{40,30,20},{30,20,40},{20,10,50}}, {{40,50,10},{40,30,20},{30,20,30},{20,40,30}}};
  float[][][] values1 = new float[][][] {{{50,30,20},{30,20,10},{40,10,20},{20,5,20}},{{40,50,30},{40,30,10},{30,20,20,40},{20,10,50}}, {{40,30,10},{40,30,20},{30,20,50},{20,40,50}}};
  float[][][] values2 = new float[][][] {{{40,50,30},{40,30,10},{30,20,40},{20,10,50}}, {{40,30,10},{40,30,20},{30,20,30},{20,50,30}}};
  float[][][][] values = new float[][][][] {values0, values1, values2};
  
  float val = 100; //agregue esto para dar una maximo de valores
  int min = 20;
  int[] colors = new int[] {#ff0000,#00ff00,#0000ff,#ff00ff};
  */
  view = new Group();
  Group chart1 = new Group();
      
  Faceted recursiva = new Faceted(months, investments, val, min, values); //le meti entradas al faceted
  recursiva.update();
  chart1.add(recursiva);

  view.add(chart1);
}

void draw() {
  background(220);
  view.draw();
}