void setup() {

  background(0);
  size(300, 300);
  
  instantiateSnow(150, 150, 50, 50);
}

void instantiateSnow(float a, float b, float c, float d){
  
  for(int i = 0; i < 6; i++)
  {
      PShape particle = snowParticle();
      particle.rotate(radians(60 * i));
      particle.scale(1.5);
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
