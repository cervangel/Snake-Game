ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();

int w=30, h=30, blocks=20, direction = 2, foodx = 15, foody =15;
int[] x_direction = {0, 0, 1, -1}, y_direction = {1, -1, 0, 0};
boolean gameover = false;

void setup(){
   size(700, 700); 
   x.add(0);
   y.add(15);
}

void draw(){
  background(0);
  fill(56, 168, 50);
  for(int i=0; i < x.size(); i++)
    rect(x.get(i)*blocks, y.get(i)*blocks, blocks, blocks);
  if(!gameover){
   fill(255);
   rect(foodx*blocks, foody*blocks, blocks, blocks);
   textAlign(LEFT); 
   textSize(25);
   fill(225);
   text("Score: " + x.size(), 10, 10, width - 20, 50);
  }
  if(frameCount%10 == 0){
    x.add(0, x.get(0) + x_direction[direction]);
    y.add(0, y.get(0) + y_direction[direction]);  
    
    if(x.get(0) == foodx && y.get(0) == foody){
     foodx = (int)random(0, w);
     foody = (int)random(0, h);
    }
    else{  
    x.remove(x.size() - 1);
    y.remove(y.size() - 1);
    }

    
  } 
  
}

void keyPressed(){
    int newDirection=keyCode ==DOWN? 0:(keyCode==UP? 1:(keyCode==RIGHT?2:(keyCode == LEFT?3:-1)));
    if(newDirection != -1) direction = newDirection;
  }
 
