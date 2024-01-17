//Virus Proximity
void sendMessageVirusProximity(){
  OscMessage myMessage = new OscMessage("/VirusProximity");
  
  //ValueGyroX = map(GyroX, -1.6, 1.6, 1, 0);
  
  myMessage.add(VirusProximity);
  oscP5.send(myMessage, myRemoteLocation);
}

void sendMessageVirusPosition(){
  OscMessage myMessage = new OscMessage("/VirusPosition");
  
  //ValueGyroX = map(GyroX, -1.6, 1.6, 1, 0);
  
  myMessage.add(currentEnemyPosition);
  oscP5.send(myMessage, myRemoteLocation);
}

void sendMessageUserDirection(){
  OscMessage myMessage = new OscMessage("/UserDirection");
  
  //ValueGyroX = map(GyroX, -1.6, 1.6, 1, 0);
  
  myMessage.add(userDirection);
  oscP5.send(myMessage, myRemoteLocation);
}
