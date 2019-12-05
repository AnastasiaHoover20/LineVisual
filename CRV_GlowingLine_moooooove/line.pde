class Line {
  int x1;
  int y1;
  int x2;
  int y2;
  
final short NUM = 7;
PVector[] coords = new PVector[NUM];

int range = 6; //range of movement (we want to change the speed. slow it down the longer you're in front of it. range start 6

//--------[COLOR]-------------//
color linecolor = #F9557B;



//The line... why was this so difficult... Don't mess with it ever again. 

Line(int x, int y, int h, int w, color c){
  
 x1 = int(random(x,x+h));
 y1 = y; 
 x2 = int(random(x,x+h));
 y2 = y+w;
 
 linecolor = c;
  
  coords[0] = new PVector(x1,y1); //set int so it can repeat (first and last)
  coords[1] = new PVector(x1,y1);
  coords[2] = new PVector(int (random(x,x+h)), int (random(y,y+w))); //making a "box" x can exist from x to x+h same with y
  coords[3] = new PVector(int (random(x,x+h)), int (random(y,y+w)));
  coords[4] = new PVector(int (random(x,x+h)), int (random(y,y+w)));
  coords[5] = new PVector(x2,y2);
  coords[6] = new PVector(x2,y2);
}

//------------[RANGE CHANGE]-----------------//
void slowdown(){
  range = range -1;
  
  if(range < 0){
    range = range + 1;
  }  
}

void speedup(){
  range = range + 1;
}



void update(){

//------------------[BROWNIAN MOVEMENT]---------------------------------//
  
  for(int i = 0; i < coords.length; i++){
  // Put a new value at the end of the array
  coords[i].x += random(-range, range);
  coords[i].y += random(-range, range);

  // Constrain all points to the screen
  coords[i].x = constrain(coords[i].x, 0, width);
  coords[i].y = constrain(coords[i].y, 0, height);
  }

 
//----------------------[LINE AND GLOW LINE (COLOR)]----------------------------// 
 smooth();
 //Blur = glow behind the line
 stroke(linecolor);
 strokeWeight(1);
 noFill();
 
 
 /*stroke(colors[c]);
 strokeWeight(1);
 noFill();
*/
 
 beginShape();
for(int i = 0; i < coords.length; i++){
  curveVertex(coords[i].x, coords[i].y); //first control point
}
 endShape();
 
 
/*filter( BLUR, 4);
 
 //line in front
 stroke(255);
 strokeWeight(6);
 noFill();
 beginShape();
for(int i = 0; i < coords.length; i++){
  curveVertex(coords[i].x, coords[i].y); //first control point
}
 endShape();*/
 
 
}
}
