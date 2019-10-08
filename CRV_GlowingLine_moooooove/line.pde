class Line {
  
final short NUM = 7;
PVector[] coords = new PVector[NUM];

int range = 6;

//Set middle 3 to random within the constraints of (x,y,h,w)

Line(int x, int y, int h, int w){
  coords[0] = new PVector(40,40);
  coords[1] = new PVector(40,40);
  coords[2] = new PVector(int (random(x,w)), int (random(y,h)));
  coords[3] = new PVector(int (random(x,w)), int (random(y,h)));
  coords[4] = new PVector(int (random(x,w)), int (random(y,h)));
  coords[5] = new PVector(650,450);
  coords[6] = new PVector(650,450);
}


void update(){

//--------------------------------------------------------------------//
  
  for(int i = 0; i < coords.length; i++){
  // Put a new value at the end of the array
  coords[i].x += random(-range, range);
  coords[i].y += random(-range, range);

  // Constrain all points to the screen
  coords[i].x = constrain(coords[i].x, 0, width);
  coords[i].y = constrain(coords[i].y, 0, height);
  }

 
//----------------------------[THIS STUFF WORKS]-------------------------------------------// 
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
}
