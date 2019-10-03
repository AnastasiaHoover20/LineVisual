ArrayList<Line> lines = new ArrayList<Line>();
int numberOfLines = 10;

void setup(){
  size(900,600);
  background(0);
  
  for(int i = 0; i<= numberOfLines; i++){
    lines.add(new Line( int(random(100,400)), int(random(100,400)) ));
  }
  
}

void draw(){
  
}
