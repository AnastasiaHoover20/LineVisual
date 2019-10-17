ArrayList<Line> lines;
int numberOfLines = 10;



void setup(){
  lines = new ArrayList<Line>();
  size(900,600);
  background(0);
}
  //key press stand in functions. Add and remove (ArrayList)
  
<<<<<<< HEAD
void keyPressed(){ 
  if(key == 'a' || key == 'A') { //add a new line when 'A' is pressed
    lines.add(new Line());
=======
  for( int i = 0; i<= numberOfLines; i++){
    lines.add(new Line(int(random()), int(random())));
>>>>>>> 438330a7280b4c7741eac87f12befb809bdddb47
  }
  
  if(key == 'd' || key == 'D') { //subtract a line when 'D' is pressed
    lines.remove();
  }
}



void draw(){
  
  //loop through ArrayList
  for ( Line myLine : lines){
    myLine.update();
  }
}
