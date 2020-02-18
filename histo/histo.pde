ArrayList<Integer> x,y;
ArrayList<Float> vx,vy,v,t;
boolean commencer,fin;
int MULT=50;
int[] histox,histoy;

void setup(){
  size(600,600);
  x=new ArrayList<Integer>();
  y=new ArrayList<Integer>();
  t=new ArrayList<Float>();
  vx=new ArrayList<Float>();
  vy=new ArrayList<Float>();
  v=new ArrayList<Float>();
  histox=new int[width];
  histoy=new int[height];
  for(int i=0;i<width;i++)
    histox[i]=0;
  for(int i=0;i<height;i++)
    histoy[i]=0;
  commencer=false;
  fin=false;
  background(255);
}

void draw(){
  if(commencer){
    x.add(mouseX*MULT);
    y.add(mouseY*MULT);
    t.add(Float.parseFloat(""+millis()));
    line(pmouseX,pmouseY,mouseX,mouseY);
    histox[mouseX]++;
    histoy[mouseY]++;
  }
  if(fin){
    for(int i=1;i<x.size();i++){
      vx.add( ( x.get(i)-x.get(i-1) ) / ( t.get(i)-t.get(i-1) ) );
      vy.add( ( y.get(i)-y.get(i-1) ) / ( t.get(i)-t.get(i-1) ) );
      v.add(sqrt(vx.get(i-1)*vx.get(i-1)+vy.get(i-1)*vy.get(i-1)));
    }
    //tracer les amplitudes
    int i;
    line(0,0,2,v.get(0));
    i=2;
    for(int j=1;j<v.size();j++){
      line(i,v.get(j-1),i+2,v.get(j));
      i=i+2;
    }
    //histo
    for(int a=0;a<width;a++){
      line(a,height,a,height-histox[a]);
    }
    for(int a=height-1;a>=0;a--){
      line(0,a,histoy[a],a);
    }
    //reset
    x=new ArrayList<Integer>();
    y=new ArrayList<Integer>();
    t=new ArrayList<Float>();
    vx=new ArrayList<Float>();
    vy=new ArrayList<Float>();
    v=new ArrayList<Float>();
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
