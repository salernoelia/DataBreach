//AccelX
void sendMessageAccelX(){
  OscMessage myMessage = new OscMessage("/toLiveAccelX");
  myMessage.add(AccelX);
  
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

//AccelY
void sendMessageAccelY(){
  OscMessage myMessage = new OscMessage("/toLiveAccelY");
  myMessage.add(AccelY);
  
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

//AccelZ
void sendMessageAccelZ(){
  OscMessage myMessage = new OscMessage("/toLiveAccelZ");
  myMessage.add(AccelZ);
  
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}  
