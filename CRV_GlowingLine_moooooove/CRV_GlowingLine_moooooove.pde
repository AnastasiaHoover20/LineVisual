ArrayList<Line> lines = new ArrayList<Line>();
int numberOfLines = 5;

//---------COUNTER-----------//
int counter;
int t = 0;

//-------CAMERA STUFF-------//
import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

OpenCV opencv;
Rectangle[] faces;
Capture capture;


void setup(){
  size(1280,720);
  background(0);
  
//-------------------------------------[COUNTER]-------------------------------------------//

counter = millis();
  
//----------------------------------[CAMERA]----------------------------------------------//

String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      //println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    capture = new Capture(this, width, height, cameras[0]);
    capture.start();  
    
    opencv = new OpenCV(this, capture.width, capture.height); 
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
   
    faces = opencv.detect();
  }
  
  
//-------------------------------------------[LINES]------------------------------------------------//
  for( int i = 0; i<= numberOfLines; i++){
    int minwidth = 10;
    int minheight = 20;
    int y = 250;
    
    lines.add(new Line(int(random(minwidth,250)), int(random(minheight,height - y)), int(random(500,width - y)), int(random(minheight,height - y)))); 
  }
}


//key press stand in functions. Add and remove (ArrayList) // and chage the range at which the lines are moving
void keyPressed(){ 
if(key == 'a' || key == 'A') { //add a new line when 'A' is pressed
    int minwidth = 10;
    int minheight = 20 ;
    int y = 250;
   
    lines.add(new Line(int(random(minwidth,250)), int(random(minheight,height - y)), int(random(500,width - y)), int(random(minheight,height - y))));
  }
  
if(key == 'd' || key == 'D') { //subtract a line when 'D' is pressed
    lines.remove(0); //how can we remove the first line created? 
  }

if(key == 's'){ //change range
    for ( Line myLine : lines){
    myLine.slowdown();
  }
}

if(key == 'f'){ //change range
    for ( Line myLine : lines){
    myLine.speedup();
  }
}
}

void draw(){
background(0);
  
//--------------------------[COUNTER]----------------------------------//
if ( (counter+1000) < millis() ){ //counter set for 1 minute
 t++;
 counter=millis();
}

//println(t);
  
//--------------------------------[CAMERA]----------------------------------//
  opencv.loadImage(capture);
  faces = opencv.detect();
  //image(capture, 0, 0);

if (faces!=null){ //draws the box around faces
  for (int i = 0; i < faces.length; i++) {
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
 }
 
//-----------------------------------[ADD LINES]------------------------------------//
int a = t % 12 ; //using remainder 12

if(faces.length > 0 && 0 == a ){ //add line every 12 seconds ( % 12 {0 - 12}) 
  int minwidth = 10;
  int minheight = 20 ;
  int y = 250;
 
  lines.add(new Line(int(random(minwidth,250)), int(random(minheight,height - y)), int(random(500,width - y)), int(random(minheight,height - y)))); 
}

//-----------------------------------[DELETE LINES]----------------------------------//
int d = t % 12;
println(d);

if(faces.length == 0 && 0 == d) {
  lines.remove(0); 
  
  if(lines.size() < 5){ //keep 5 lines on screen
  int minwidth = 10;
  int minheight = 20 ;
  int y = 250;
 
  lines.add(new Line(int(random(minwidth,250)), int(random(minheight,height - y)), int(random(500,width - y)), int(random(minheight,height - y)))); 
  }
}

//------------------------------[SLOW DOWN]----------------------------------------//
int s = t % 15;

if(faces.length > 0 && 0 == s){
  for ( Line myLine : lines){
    myLine.slowdown();
  }
}

//-------------------------------[SPEED UP]---------------------------------------//
int f = t % 10;

if(faces.length == 0 && 0 == f){
   for ( Line myLine : lines){
    myLine.speedup();
  }
}


//------------------------------[LINES]------------------------------------------//  
  //loop through ArrayList
  for ( Line myLine : lines){
    myLine.update();
  }
}


void captureEvent(Capture capture){
  capture.read();
}
