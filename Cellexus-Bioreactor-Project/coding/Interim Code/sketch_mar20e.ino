#include <Servo.h>
#include "DFRobot_MICS.h"
#include <DHT11.h>
DHT11 dht11(2);
Servo myservo;


const int PUMPPIN = 9;      // Pin connected to the pump motor
const int sensorPin = A0;  // Connect the sensor's analog output to A0
const float offset = 0; // offset value for calibration
const int pump2Pin = 4;
int liquidLevel = 0;
#define samplingInterval 30
#define printInterval 1000
#define ArrayLenth  45    //times of collection
int pHArray[ArrayLenth];   //average value of the sensor feedback
int pHArrayIndex=0;
void setup() {
    myservo.attach(PUMPPIN);
  Serial.begin(9600);  
   Serial.println("pH meter");
     pinMode(5, INPUT);
  pinMode(pump2Pin, OUTPUT);
}

void loop() {
      int temperature = 0;
    int humidity = 0;

    // Attempt to read the temperature and humidity values from the DHT11 sensor.
    int result = dht11.readTemperatureHumidity(temperature, humidity);

    // Check the results of the readings.
    // If the reading is successful, print the temperature and humidity values.
    // If there are errors, print the appropriate error messages.
    if (result == 0) {
        Serial.print("Temperature: ");
        Serial.print(temperature);
        Serial.print(" °C\tHumidity: ");
        Serial.print(humidity);
        Serial.println(" %");
    } 
  static unsigned long samplingTime = millis();
  static unsigned long printTime = millis();
  static float pHValue,voltage;
  if(millis()-samplingTime > samplingInterval)
  {
      pHArray[pHArrayIndex++]=analogRead(sensorPin);
      if(pHArrayIndex==ArrayLenth)pHArrayIndex=0;
      voltage = avergearray(pHArray, ArrayLenth)*5.0/1024;
      pHValue = 3.5*voltage+offset;
      samplingTime=millis();
  }
  if(millis() - printTime > printInterval)   
  {
    Serial.print("Voltage:");
        Serial.print(voltage,2);
        Serial.print("    pH value: ");
    Serial.println(pHValue,2);
        liquidLevel = digitalRead(5);
  Serial.print("liquidLevel= "); Serial.println(liquidLevel, DEC);
  delay(1500);
if (digitalRead(5) == HIGH || pHValue < 7.0){
  // Code to be executed if the condition is true
 
  myservo.write(90); // pump stop
  digitalWrite(pump2Pin, HIGH);// Clockwise maximum speed rotation
} else {
  // Code to be executed if the condition is false
  // If liquid level is 0 or ph is above 7 start pump 
  myservo.write(0);   // Clockwise maximum speed rotation
    digitalWrite(pump2Pin, LOW);
 
    }
        printTime=millis();
  }
}
double avergearray(int* arr, int number){
  int i;
  int max,min;
  double avg;
  long amount=0;
  if(number<=0){
    Serial.println("Error number for the array to avraging");
    return 0;
  }
  if(number<5){   //less than 5, calculated directly statistics
    for(i=0;i<number;i++){
      amount+=arr[i];
    }
    avg = amount/number;
    return avg;
  }else{
    if(arr[0]<arr[1]){
      min = arr[0];max=arr[1];
    }
    else{
      min=arr[1];max=arr[0];
    }
    for(i=2;i<number;i++){
      if(arr[i]<min){
        amount+=min;        //arr<min
        min=arr[i];
      }else {
        if(arr[i]>max){
          amount+=max;    //arr>max
          max=arr[i];
        }else{
          amount+=arr[i]; //min<=arr<=max
        }
      }//if
    }//for
    avg = (double)amount/(number-2);
  }//if
  return avg;
  }
