ArrayList<Line> lines = new ArrayList<Line>();
int numberOfLines = 5;


void setup(){
  size(900,600);
  background(0);
  
  for( int i = 0; i<= numberOfLines; i++){
    lines.add(new Line(int(random(0,250)), int(random(0,height)), int(random(500,width)), int(random(0,height)))); //make box
  }
}

 //key press stand in functions. Add and remove (ArrayList)
  
void keyPressed(){ 
  if(key == 'a' || key == 'A') { //add a new line when 'A' is pressed
    lines.add(new Line(int(random(0,250)), int(random(0,height)), int(random(300,width)), int(random(0,height))));  
  }
  
  if(key == 'd' || key == 'D') { //subtract a line when 'D' is pressed
    lines.remove(0); //how can we remove the first line created?
    
  }
}


void draw(){
  background(0);
  
  //loop through ArrayList
  for ( Line myLine : lines){
    myLine.update();
  }
}
