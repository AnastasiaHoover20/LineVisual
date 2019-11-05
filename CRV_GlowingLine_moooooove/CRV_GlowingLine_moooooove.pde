ArrayList<Line> lines = new ArrayList<Line>();
int numberOfLines = 5;


void setup(){
  size(900,600);
  background(0);
  
  for( int i = 0; i<= numberOfLines; i++){
    int minwidth = 10;
    int minheight = 20;
    
    int y = 250;
   
    
    lines.add(new Line(int(random(minwidth,250)), int(random(minheight,height - y)), int(random(500,width - y)), int(random(minheight,height - y))));
    
  }
}

 //key press stand in functions. Add and remove (ArrayList)
  
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
}


void draw(){
  background(0);
  
  //loop through ArrayList
  for ( Line myLine : lines){
    myLine.update();
  }
}
