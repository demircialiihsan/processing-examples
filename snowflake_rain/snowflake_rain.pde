int quantity = 100;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 2;
int maxFlakeSize = 15;

void setup() {
  
  size(800,800);
  frameRate(30);
 
  stroke(255);
  strokeWeight(1);
  
  smooth();
  
  for(int i = 0; i < quantity; i++)
  {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(5, width);
    yPosition[i] = random(10, height);
    direction[i] = round(random(0, 5));
  }
  
  snowParticle();
}

void draw() {
  
  background(0);
  
  for(int i = 0; i < xPosition.length; i++)
  {
    instantiateSnow(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    
    if(direction[i] == 0)
    {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    else
    {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    
    yPosition[i] += flakeSize[i] + direction[i];
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) 
    {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    }
  }
}

void instantiateSnow(float a, float b, float c, float d){
  
  for(int i = 0; i < 6; i++)
  {
      PShape particle = snowParticle();
      particle.rotate(radians(60 * i));
      shape(particle, a, b, c, d);
  }
}

PShape snowParticle(){

  PShape snow;
  
  snow = createShape();
  
  snow.beginShape();
  
  snow.fill( 153, 255, 255 );
  
  snow.stroke( 0, 190, 200 );
  
  snow.vertex( 22, 50 );
  snow.vertex( 17, 42 );
  snow.vertex( 17, 23 );
  snow.vertex( 0, 16 );
  snow.vertex( 0, 10 );
  snow.vertex( 4, 7 );
  snow.vertex( 17, 12 );
  snow.vertex( 17, 2 );
  snow.vertex( 22, 0 );
  snow.vertex( 27, 2 );
  snow.vertex( 27, 12 );
  snow.vertex( 40, 7 );
  snow.vertex( 44, 10 );
  snow.vertex( 44, 16 );
  snow.vertex( 27, 23 );
  snow.vertex( 27, 42 );
  
  snow.endShape(CLOSE); 
  
  return snow;
}
