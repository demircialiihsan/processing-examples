int changeScale = 4;
float sizeScale = 0.6;
float rotationScale = 0.7;

int colorScale = 0;
int colorChange;
float scale;

void setup()
{
  size(800, 800);
  frameRate (30);
}

void SetColor()
{
  if(colorScale <= 0)
  {
     colorChange = 1 * changeScale;
  }
  if(colorScale >= 255)
  {
    colorChange = -1 * changeScale;
  }
  
  colorScale += colorChange;
}

void InstantiateSnow(float a, float b, float c, float d)
{
  for(int i = 0; i < 6; i++)
  {
      PShape particle = snowParticle(colorScale);
      particle.rotate(radians((60 * i)) + (scale * rotationScale));
      particle.scale(scale * sizeScale);
      shape(particle, a, b, c, d);
  }
}

PShape snowParticle(int colorScale)
{
  PShape snow;
  
  snow = createShape();
  snow.beginShape();
  
  snow.fill(colorScale, colorScale, colorScale);
  snow.stroke(0, 190, 200);
  
  snow.vertex(22, 50);
  snow.vertex(17, 42);
  snow.vertex(17, 23);
  snow.vertex(0, 16);
  snow.vertex(0, 10);
  snow.vertex(4, 7);
  snow.vertex(17, 12);
  snow.vertex(17, 2);
  snow.vertex(22, 0);
  snow.vertex(27, 2);
  snow.vertex(27, 12);
  snow.vertex(40, 7);
  snow.vertex(44, 10);
  snow.vertex(44, 16);
  snow.vertex(27, 23);
  snow.vertex(27, 42);
  
  snow.endShape(CLOSE); 
  
  return snow;
}

void draw()
{
  background(50, 12, 70);
  SetColor();
  scale = 1 + (colorScale / 255.0);
  strokeWeight(scale);
  InstantiateSnow(400, 400, 250, 250);
}
