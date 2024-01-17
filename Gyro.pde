//GyroX (Nick)
void sendMessageGyroX(){
  OscMessage myMessage = new OscMessage("/toLiveGyroX");
  
  //Map GyroZ to 0 and 1 for Ableton Input
  ValueGyroX = map(GyroX, -1.6, 1.6, 1, 0);
  
  myMessage.add(ValueGyroX);
  
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

//GyroY (Roll)
void sendMessageGyroY(){
  OscMessage myMessage = new OscMessage("/toLiveGyroY");
  myMessage.add(GyroY);
  
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

//GyroZ (Gier)
void sendMessageGyroZ(){
  OscMessage myMessage = new OscMessage("/toLiveGyroZ");
  
  ValueGyroZ = map(GyroZ, -3.2, 3.2, 1, 0);
  myMessage.add(ValueGyroZ);
  
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}  
