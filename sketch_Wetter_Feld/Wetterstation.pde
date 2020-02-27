class Wetterstation
{
  private float temp[];
  
  private Netzwerk netzwerk;
  
  Wetterstation(Netzwerk n)
  {
    netzwerk = n;
    temp = new float[200];
    for (int i = 0; i < 200; i++)
    {
      temp[i] = netzwerk.getTemp(i);
    }
  } 
  
  void zeichnen()
  {    
    fill(0);
    textSize(16);
    text("Aktuelle Temperatur ",100,100);
    textSize(28);
    text(temp[0] + " °C",100,150);
    textSize(16);
    text("Werte davor ",100,250);
    text(temp[1] + " | " + temp[2] + " | " + temp[3] + " | " + temp[4] + " | " + temp[5], 100,300);
  }
}
