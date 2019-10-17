ArrayList<Line> lines = new ArrayList<Line>();
int numberOfLines = 10;


void setup(){
  size(900,600);
  background(0);
  
  for( int i = 0; i<= numberOfLines; i++){
    lines.add(new Line(int(random()), int(random())));
  }
}

  //key press stand in functions. Add and remove (ArrayList)
  
void keyPressed(){ 
  if(key == 'a' || key == 'A') { //add a new line when 'A' is pressed
    lines.add(new Line());  
  }
  
  if(key == 'd' || key == 'D') { //subtract a line when 'D' is pressed
    lines.remove(); //how can we remove the first line created?
    
  }
}


void draw(){
  
  //loop through ArrayList
  for ( Line myLine : lines){
    myLine.update();
  }
}
