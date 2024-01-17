import oscP5.*;
import netP5.*;
import themidibus.*;
MidiBus myBus;

OscP5 oscP5;
NetAddress myRemoteLocation;
float GyroX, GyroY, GyroZ;
float OrientationM11, OrientationM12, OrientationM13, OrientationM21, OrientationM22, OrientationM23, OrientationM31, OrientationM32, OrientationM33;
float AccelX, AccelY, AccelZ;
float MagnX, MagnY, MagnZ;
float ValueGyroX;
float ValueGyroY;
float ValueGyroZ;
boolean AccelXState = false;
boolean lastAccelXState = false;


void setup() {

  size(800, 400);
  //MidiBus.list(); // Liste aller Geräte ausgeben
  //myBus = new MidiBus(this, -1, "Bus 1");
  
  oscP5 = new OscP5(this, 8103);
  myRemoteLocation = new NetAddress("10.128.129.108", 8100);
  oscP5.plug(this, "Gyro", "/gyrosc/gyro");
  oscP5.plug(this, "OrientationMatrix", "/gyrosc/rmatrix");
  oscP5.plug(this, "Accelerometer", "/gyrosc/accel");
  oscP5.plug(this, "Magnetometer", "/gyrosc/mag");
}

public void Gyro(float X, float Y, float Z) {
  GyroX = X;
  GyroY = Y;
  GyroZ = Z;
}

public void OrientationMatrix(float m11, float m12, float m13, float m21, float m22, float m23, float m31, float m32, float m33) {
  OrientationM11 = m11;
  OrientationM12 = m12;
  OrientationM13 = m13;
  OrientationM21 = m21;
  OrientationM22 = m22;
  OrientationM23 = m23;
  OrientationM31 = m31;
  OrientationM32 = m32;
  OrientationM33 = m33;
}

public void Accelerometer(float X, float Y, float Z) {
  AccelX = X;
  AccelY = Y;
  AccelZ = Z;
}

public void Magnetometer(float X, float Y, float Z) {
  MagnX = X;
  MagnY = Y;
  MagnZ = Z;
}

// Game variables

float timer = 0;
boolean gameActive = false;
float initialGyroZ; // Variable to store the initial GyroZ value
float gyroZThreshold = 0.1; // Adjust the threshold based on the expected change
float currentEnemyPosition = 0.0; // Initial value of the generated angle
float VirusProximity = 1.0; // Initial size of the generated angle
float VirusTargetProximity = 10.0; // Target size of the generated angle
float VirusProximityIncrement = 1.0; // Increment for each frame to reach the target size
int virusSpawnDelay = 3000; // 3-second delay
int lastVirusEliminationTime;
boolean VirusExists = false;
 

void draw() {
 
  if (!gameActive && abs(GyroZ - initialGyroZ) > gyroZThreshold) {
    gameActive = true;
    //myBus.sendNoteOn(1, 70, 127);
    println("Game is now active!");
  }
  
  if(gameActive){
    
    if (VirusExists == false){
      
      if (millis() - lastVirusEliminationTime >= virusSpawnDelay) {
        spawnVirus();
      }
    }
  
  // activate message you want to send
      sendMessageVirusProximity();
      sendMessageVirusPosition();
      sendMessageUserDirection();
      

    println("");
    println("");
    println(currentEnemyPosition);
    println(userDirection);
    println(VirusProximity);
  
    if (millis() >= 500+timer) {
      timer = millis();
      updateVirusProximity();
    }
 
  
    checkUserDirection();
  
  
  
    if (isDirectionOverlapping(currentEnemyPosition)) {
    
      if(VirusProximity == 10.0){
        println("You have caught the virus! But there's more coming!");
        lastVirusEliminationTime = millis(); // Update the last elimination time
        
        VirusProximity = 1.0;
        VirusExists = false;
      }
      
    } else {
      if(VirusProximity == 10.0){
        gameActive = false;
        //myBus.sendNoteOn(3, 40, 127);
        println("GAME OVER OOPSIES");
      } 
    }
  }
}
