Netzwerk n;
Wetterstation w;


void setup()
{
  size(400,400);
  background(255);
  n = new Netzwerk();
  w = new Wetterstation(n);
 
}

void draw()
{
  background(255);
  w.zeichnen();
}
