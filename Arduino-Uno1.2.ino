#include <HX711_ADC.h>
#include <EEPROM.h>
#include <OneWire.h>
#include <U8glib.h>
#include <stdlib.h>
#include <DallasTemperature.h>
String Final_Values1;

//**************LOADCELL***************
const int HX711_dout = 4; //mcu > HX711 dout pin
const int HX711_sck = 5; //mcu > HX711 sck pin

//HX711 constructor:
HX711_ADC LoadCell(HX711_dout, HX711_sck);

const int calVal_eepromAdress = 0;
long t;
float final1;

//**********ULTRASONIC SENSOR**********
//#define echoPin 6
//#define trigPin 7

//long duration;
//int distance; 

//****************WATERTEMP************
#define ONE_WIRE_BUS 3

OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature water_temp_probe(&oneWire);

//const char DEGREE_SYMBOL[] = { 0xB0, '\0' };
double water_temp=0;
double ideal_min_temperature = 28.00;
double ideal_max_temperature = 33.00;

//****************PH*******************
#define PHSensorPin A0 
int buf[10],temp; 
unsigned long int avgValue;

void setup() 
{
 // pinMode (trigPin, OUTPUT);
  //pinMode (echoPin, INPUT);
  Serial.begin(9600); delay(10);
  water_temp_probe.begin();
  
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

void loop() {
  

  static boolean newDataReady = 0;
  const int serialPrintInterval = 0; //increase value to slow down serial print activity

  // check for new data/start next conversion:
  if (LoadCell.update()) newDataReady = true;

  // get smoothed value from the dataset:
  if (newDataReady) {
    if (millis() > t + serialPrintInterval) {
      float i = LoadCell.getData();
      //Serial.print("Load_cell output val: ");
      //Serial.println(i);
      final1 = i;
      newDataReady = 0;
      t = millis();
    }
  }

  // receive command from serial terminal, send 't' to initiate tare operation:
  if (Serial.available() > 0) {
    float i;
    char inByte = Serial.read();
    if (inByte == 't') LoadCell.tareNoDelay();
  }

  // check if last tare operation is complete:
  if (LoadCell.getTareStatus() == true) {
    //Serial.println("Tare complete");
  }

//****************WATERTEMP************
  water_temp_probe.requestTemperatures(); 
  water_temp=water_temp_probe.getTempCByIndex(0);

    //**********ULTRASONIC SENSOR**********
   //Clears the trigPin condition
 // digitalWrite(trigPin, LOW);
 // delayMicroseconds(2);
   //Sets the trigPin HIGH (ACTIVE) for 10 microseconds
  //digitalWrite(trigPin, HIGH);
  //delayMicroseconds(10);
  //digitalWrite(trigPin, LOW);
   //Reads the echoPin, returns the sound wave travel time in microseconds
 // duration = pulseIn(echoPin, HIGH);
   //Calculating the distance
  //distance = duration * 0.034 / 10; // Speed of sound wave divided by 2 (go and back)
   //Displays the distance on the Serial Monitor

//****************PH*******************

for(int i=0;i<10;i++)       //Get 10 sample value from the sensor for smooth the value
  { 
    buf[i]=analogRead(PHSensorPin);
    //delay(10);
  }
  for(int i=0;i<9;i++)        //sort the analog from small to large
  {
    for(int j=i+1;j<10;j++)
    {
      if(buf[i]>buf[j])
      {
        temp=buf[i];
        buf[i]=buf[j];
        buf[j]=temp;
      }
    }
  }
  avgValue=0;
  for(int i=2;i<8;i++)                      //take the average value of 6 center sample
  avgValue+=buf[i];
  float phValue=(float)avgValue*5.0/1024/6; //convert the analog into millivolt
  phValue=3.5*phValue;                      //convert the millivolt into pH value
  //Serial.print("ph: ");

  Final_Values1 = Final_Values1  + water_temp + ","  + phValue + "," + final1 + ",";
  Serial.println(Final_Values1);
  
  Final_Values1 = "";
  delay(100);
}

  
