import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


import  ddf.minim.*;
import processing.serial.*;
Minim minim;
AudioPlayer player;



Serial myPort;
void  setup() {
  smooth();
  colorMode(RGB, 1, 60, 60, 60);
  //size(1920, 1080);

  minim = new Minim(this);
  player = minim.loadFile("01.wav", 2048);
 
  String arduinoPort = Serial.list()[6];
  print (arduinoPort);
  myPort = new Serial(this, arduinoPort, 9600);
  
} 
void  draw() {

  while (myPort.available() > 0) {
  
    String inString = myPort.readStringUntil('\n');
    
      if(inString != null){
          if (inString.indexOf("TEMP")!=-1)
      {
        player = minim.loadFile("01.wav", 2048); //01: distance
        player.play();
      } else if (inString.indexOf("IR")!=-1)
      {
        player = minim.loadFile("02.wav", 2048); // 02: light
        player.play();
      }
      }    
  }
}