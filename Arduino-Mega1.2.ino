#include <OneWire.h>
#include <DallasTemperature.h>
#include <U8glib.h>
#include <stdlib.h>
#include <HX711_ADC.h>
#include <EEPROM.h>
#include<Servo.h>
String Final_Values;

#define relay 8//****************************

//**********ULTRASONIC SENSOR**********
#define echoPin 4
#define trigPin 5

//**********LOAD CELL**********
const int HX711_dout = 7; //mcu > HX711 dout pin
const int HX711_sck = 6; //mcu > HX711 sck pin

HX711_ADC LoadCell(HX711_dout, HX711_sck);
const int calVal_eepromAdress = 0;
long t;
float final_Weight1;

//**********ULTRASONIC SENSOR**********
long duration;
int distance; 

//**********SERVO MOTOR**********
Servo S_Motor1;
Servo S_Motor2;
Servo S_Motor3;
int var = 0;

void setup() 
{
 pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(relay, OUTPUT);
  digitalWrite(relay, HIGH);

  S_Motor1.attach(13);
  S_Motor1.write(125);
  S_Motor2.attach(12);
  S_Motor2.write(150);
  S_Motor3.attach(11);
  S_Motor3.write(90);

  Serial.begin(57600);

  LoadCell.begin();
  float calibrationValue; // calibration value (see example file "Calibration.ino")
  calibrationValue = 696.0; // uncomment this if you want to set the calibration value in the sketch
  #if defined(ESP8266)|| defined(ESP32)
  //EEPROM.begin(512); // uncomment this if you use ESP8266/ESP32 and want to fetch the calibration value from eeprom
  #endif
  EEPROM.get(calVal_eepromAdress, calibrationValue); // uncomment this if you want to fetch the calibration value from eeprom
  long stabilizingtime = 2000; // preciscion right after power-up can be improved by adding a few seconds of stabilizing time
  boolean _tare = true; //set this to false if you don't want tare to be performed in the next step
  LoadCell.start(stabilizingtime, _tare);
  if (LoadCell.getTareTimeoutFlag()) {
    //Serial.println("Timeout, check MCU>HX711 wiring and pin designations");
    while (1);
  }
  else {
    LoadCell.setCalFactor(calibrationValue); // set calibration value (float)
    //Serial.println("Startup is complete");
  }
}

void loop() 

{ 
  //**********ULTRASONIC SENSOR**********
   //Clears the trigPin condition
 digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
   //Sets the trigPin HIGH (ACTIVE) for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
   //Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
   //Calculating the distance
  distance = duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
   //Displays the distance on the Serial Monitor

  if (var == 1) //**********************
  {
    S_Motor3.write(30);
    delay(250);
  }
  
  if (var == 1)//**********************
  {
    S_Motor3.write(90);
    delay(250);
  }
  //**********LOAD CELL**********
  for(int a = 0 ; a<=1000 ; a++)
  {
    static boolean newDataReady = 0;
    const int serialPrintInterval = 0; //increase value to slow down serial print activity

    //check for new data/start next conversion:
    if (LoadCell.update()) newDataReady = true;

   // get smoothed value from the dataset:
    if (newDataReady) 
    {
      if (millis() > t + serialPrintInterval) 
      {
        float i = LoadCell.getData();
        //Serial.print("Load_cell output val: ");
        //Serial.println(i);
        final_Weight1 = i;
      newDataReady = 0;
      t = millis();
     }
    }
      }

      if (var == 1)//**********************
  {
    S_Motor3.write(150);
    delay(250);
  }

  int val = Serial.read() - '0';
  
  if(val == 1) // Fist Motor_Opening
  {
    S_Motor1.write(115);
    var = 1; 
  }

  else if(val == 2 ) // Fist Motor_Closing
  {
   
     S_Motor1.write(125);
     S_Motor3.write(90);
     var = 0;
  }

  else if (val == 3) //Second Motor_Opening
  {
    S_Motor2.write(55);
    digitalWrite(relay, LOW);
    delay(100); 
  }

  else if (val == 4) //Second Motor_Closing
  {
    S_Motor2.write(150);
    digitalWrite(relay, HIGH);
  }

  if (var == 1)//**********************
  {
    S_Motor3.write(90);
    delay(250);
  }
distance = 1;
 Final_Values = Final_Values + distance + "," + final_Weight1 + ",";
    //Final_Values = Final_Values + distance + "," + phValue + ",";
  Serial.println(Final_Values);

Final_Values = "";

if (var != 1)
  {
  delay(500);
  }
  }
  
  
  
