float F = 50;
float T = 70;
float millisOld, gTime, gSpeed = 8;

void IK(){

  float X = posX;
  float Y = posY;
  float Z = posZ;

  float L = sqrt(Y*Y+X*X);
  float dia = sqrt(Z*Z+L*L);
  
  println("X "+X+" Y "+Y+" Z "+Z);
  
  println("L   "+L);
  println("dia "+dia);
  
  
  alpha = PI/2-(atan2(L, Z)+acos((T*T-F*F-dia*dia)/(-2*F*dia)));
  
  println("alpha 1 "+ atan2(L, Z) );
  println("alpha 2 "+ (T*T-F*F-dia*dia) );
  println("alpha 3 "+ (-2*F*dia));
  println("alpha 4 "+ acos((T*T-F*F-dia*dia)/(-2*F*dia)));
  
  
  
  
  println("alpha rad "+alpha + " deg " + (alpha*180/PI) );
  beta = -PI+acos((dia*dia-T*T-F*F)/(-2*F*T));
  //println("beta  rad "+beta + " deg " + (beta*180/PI) );
  gamma = atan2(Y, X);
  //println("gamma rad "+gamma + " deg " + (gamma*180/PI) );

}

void setTime(){
  gTime += ((float)millis()/1000 - millisOld)*(gSpeed/4);
  if(gTime >= 4)  gTime = 0;  
  millisOld = (float)millis()/1000;
}

void writePos(){
  IK();
  setTime();
  posX = sin(gTime*PI/2)*20;
  posZ = sin(gTime*PI)*10;
  posY = 90 + sin(gTime*PI)*10;
}