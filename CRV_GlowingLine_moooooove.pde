final short NUM = 7;
PVector[] coords = new PVector[NUM];

int range = 10;

float[] ax = new float[NUM];
float[] ay = new float[NUM];

void setup(){
  size(900,600);
  background(0);
  
  coords[0] = new PVector(40,40);
  coords[1] = new PVector(40,40);
  coords[2] = new PVector(80,60);
  coords[3] = new PVector(300,300);
  coords[4] = new PVector(260,520);
  coords[5] = new PVector(650,450);
  coords[6] = new PVector(650,450);
}

void draw(){
 /*  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  */
 smooth();
 
 //Blur = glow behind the line
 stroke(255);
 noFill();
 beginShape();
for(int i = 0; i < coords.length; i++){
  curveVertex(coords[i].x, coords[i].y); //first control point
}
 endShape();
 filter( BLUR, 4);
 
 //line in front
 stroke(255);
 strokeWeight(6);
 noFill();
 
 beginShape();
for(int i = 0; i < coords.length; i++){
  curveVertex(coords[i].x, coords[i].y); //first control point
}
 endShape();
}
