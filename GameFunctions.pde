// Spawn new virus functionality

public void spawnVirus() {
    float randomAngle = random(TWO_PI);
    // Map the angle to the range 0-1
    float mappedAngle = map(randomAngle, 0, TWO_PI, 0, 1);
    currentEnemyPosition = mappedAngle;
    VirusProximity = 1.0;
    println("New virus spawned");
    //myBus.sendNoteOn(2, 20, 127);
    VirusExists = true;
  
}

// Increase virus sound/emulate it moving closer

void updateVirusProximity() {
  if (VirusProximity < VirusTargetProximity) {
    if(VirusExists == true){
      VirusProximity += VirusProximityIncrement;
    }
  }
}


// Check cube rotation/user rotation

float userDirection = 0.0; // Variable to store the user's pointing direction
float tolerance = 15.0; // Tolerance in degrees
public void checkUserDirection() {
  userDirection = map(GyroZ, -3.2, 3.2, 0, 1);
}

// is the user aligned with the virus

boolean isDirectionOverlapping(float generatedAngle) {
  // Check if the user's pointing direction overlaps with the generated angle
  return abs(userDirection - generatedAngle) <= tolerance / 180.0;
}
