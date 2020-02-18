int x,y,haut,bas,droite,gauche,SEUIL;

void setup(){
  size(600,600);
  background(255);
  reset();
  SEUIL=15;
}

void draw(){
  x=mouseX-pmouseX;
  y=mouseY-pmouseY;
  //horizontal X
  if(x>0){//vers la droite
    droite++;
  }
  else if(x<0){//vers la gauche
    gauche++;
  }
  //vertical
  if(y>0){//vers le bas
    bas++;
  }
  else if(y<0){//vers le haut
    haut++;
  }
  line(mouseX, mouseY, pmouseX, pmouseY);
  //verifier le pattern
  //disons un test bidon d'un carré
  if(abs(droite-gauche)<SEUIL&&abs(bas-haut)<SEUIL&&droite!=0&&bas!=0&&gauche!=0&&haut!=0){
    println("carre");
    reset();
  }
  //println(mouseX+" "+mouseY); 
}

void reset(){
  haut=0;
  bas=0;
  droite=0;
  gauche=0;
}

void mousePressed() {
  reset();
  println("boutton pressé");
}
