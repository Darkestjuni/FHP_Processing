int i = 0;
float s = 1;

void setup(){
 size(700, 700);
 background(255);
}

void draw(){
  fill(0);
 float t =  (float)frameCount;
 float vel = 20;
 float c = sin(t/vel)*100;
translate(0, height/2);
//pushMatrix();
//scale(s);
ellipse(t*2, c, 50, 50);
/*popMatrix();
i++;
if( i == 200){
  for( int j = 0; j < 1; j++){
    s = s+0.05;
  }
  i = 0;
}
println("Scale = "+s);*/
println(int(c));
int k = frameCount % 50;
println ("Modulo " +k);

if (k == 1){
  fill(255, 0, 0);
  ellipse (t*2, c, 50, 50);
 }
}
