ArrayList<Integer> freeman;
boolean commencer,fin;

void setup(){
  size(600,600);
  freeman=new ArrayList<Integer>();
  commencer=false;
  fin=false;
  background(255);
}

void draw(){
  if(commencer){
    line(pmouseX,pmouseY,mouseX,mouseY);
    int diffx=mouseX-pmouseX;
    int diffy=mouseY-pmouseY;
    if(diffx>0){
      if(diffy>0)
        freeman.add(8);
       else if(diffy==0)
         freeman.add(1);
       else
         freeman.add(2);
    }
    else if(diffx==0){
      if(diffy>0)
        freeman.add(7);
       else if(diffy<0)
         freeman.add(3);
       //else
         //freeman.add(0);
    }
    else{
      if(diffy>0)
        freeman.add(6);
       else if(diffy==0)
         freeman.add(5);
       else
         freeman.add(4);
    }
  }
  if(fin){
    //freeman sans le 0
    /*ArrayList<Integer> _freeman=new ArrayList<Integer>();
    for(int z=0;z<freeman.size();z++)
    if(freeman.get(z)!=0)
      _freeman.add(freeman.get(z));*/
    //freeman
    int[][] transition=new int[8][8];
    for(int i=0;i<8;i++)
      for(int j=0;j<8;j++)
        transition[i][j]=0;
    for(int i=0;i<freeman.size()-1;i++){
       int n=Integer.parseInt(freeman.get(i)+"");
       int n_1=Integer.parseInt(freeman.get(i+1)+"");
       transition[n-1][n_1-1]++;
    }
    println("matrice de transition");
    for(int i=0;i<8;i++){
      for(int j=0;j<8;j++)
        print(transition[i][j]+" ");
      println();
    }
    float[][] markov=new float[8][8];
    println("markov");
    for(int i=0;i<8;i++){
      float sum=0;
      for(int j=0;j<8;j++)
        sum+=transition[i][j];
      for(int j=0;j<8;j++)
        markov[i][j]=transition[i][j]/sum;
    }
    //reset
    fin=false;
  }
}

void reset(){
}

void mousePressed() {
  println("boutton pressé");
  if(commencer==false){
    commencer=true;
    fin=false;
  }
  else{
    commencer=false;
    fin=true;
  }
}
