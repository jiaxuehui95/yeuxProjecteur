#define PHOPIN A0
#define IRPIN 2
#define MOTORPIN 4 
#define DEBUG 1
void setup() {
	Serial.begin(9600);
	pinMode(IRPIN, INPUT);
  pinMode(PHOPIN,INPUT);
}

void loop() {
	
	delay(100);
	if(DEBUG){
	Serial.print(analogRead(PHOPIN));
	Serial.print(",");
	Serial.println(digitalRead(IRPIN));
	}

	if (digitalRead(IRPIN)==HIGH) {
		Serial.println("TEMP");
		weng();
	}
	if (analogRead(PHOPIN) <560)
	{
		Serial.println("IR");
		weng();
	}
	}
void weng()
{
  for (int i=0;i<3;i++)
 {
  digitalWrite(MOTORPIN,HIGH);
  delay(500);

	digitalWrite(MOTORPIN,LOW);
	delay(800);
 }
}
