int i = 0,
    k = 0;
float s = 1;

void setup(){
 size(700, 700);
 background(255);
 frameRate(500);
}

void draw(){
 float t =  (float)frameCount;
 float vel = 20;
  
translate(height/2, width/2);
pushMatrix();
scale(s);
ellipse(sin(t/vel)*100, cos(t/vel)*100, 50, 50);
popMatrix();
i++;
k++;
if ( k == 23000){
 noLoop(); 
}
if( i == 200){
  for( int j = 0; j < 1; j++){
    s = s+0.05;
  }
  i = 0;
}
println("Scale = "+s +" End-Counter "+k);
}
