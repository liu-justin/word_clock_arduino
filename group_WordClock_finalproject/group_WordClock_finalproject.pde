// NOTE: I HAVE COMMENTED OUT SOME PORTIONS OF THE CODE THAT REQUIRE THE USB
//       TO BE PLUGGED IN, BECAUSE THE PROGRAM WILL NOT RUN IF THESE LINES OF
//       CODE ARE PROCESSED AND THERE IS NO CONNECTION IN THE USB

// NOTE: THE ARDUINO CODE IS IN THE TAB LABELED ARDUINO, ALL COMMENTED

import processing.serial.*;

Serial myPort;

radioButtonSet hours;
radioButtonSet minutes;

void setup()
{
  size(500,500);
  
  // COMMENTED OUT FOR GRADING
  
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  
  // COMMENTED OUT FOR GRADING
  
  textSize(25);
  background(100);
  text("Enter the time: ", 150,100);
  
  // initialize the radio buttons
  hours = new radioButtonSet(12,10,200,1,0);
  minutes = new radioButtonSet(12,10,300,5,1);
  
  // display the radio buttons
  hours.displayButtons();
  minutes.displayButtons();
}

// This is converted and sent to the Arduino
String value = "";

void keyPressed()
{
  background(100);
  hours.displayButtons();
  minutes.displayButtons();
  text("Enter the time: ", 150,100);

  // If enter is pressed and the time is valid, send it to the Arduino
  if (keyCode == ENTER && value.length() >= 3)
  {
    // convert value to int
    int numberValue = Integer.parseInt(value);
    // convert value into a number less than 255;
    int code = convert(numberValue);
    int lastDigit = Integer.parseInt(value.substring(value.length()-1, value.length()));
    // COMMENTED OUT FOR GRADING
    
    //myPort.write(code);
    
    // COMMENTED OUT FOR GRADING
  }
}

void mousePressed()
{
  for (int i = 0; i < hours.power.length; i++)
  {
    if (hours.hoverCheck(hours.startX + 25*i, hours.startY) == true)
    {
      hours.switchFeeds(i);
    }
  }
  for (int j = 0; j < minutes.power.length; j++)
  {
    if (minutes.hoverCheck(minutes.startX + 25*j, minutes.startY) == true)
    {
      minutes.switchFeeds(j);
    }
  }
}

// for some reason, i can only send ints less than 255 to the Arduino
// so I convert the value, 100 --> 0, 105 --> 1 and so on
int convert(int value_)
{
  // algorithm to convert to values less than 255
  int code = (value_%100/5)+12*(value_/100-1);
  println(code);
  return code;
}



void draw()
{
  background(100);
  hours.displayButtons();
  minutes.displayButtons();
  text("Enter the time: ", 150,100);
  text("Press Enter to set the time.",75,400);
  if ((minutes.current+1)*5 == 5 || (minutes.current+1)*5 == 10)
  {
    value = str(hours.current+1) + "0" + str((minutes.current)*5);
    textSize(50);
    text(str(hours.current+1) + ":0" + str((minutes.current)*5),335,270);
    textSize(25);
  }
  else
  {
    value = str(hours.current+1) + str((minutes.current)*5);
    textSize(50);
    text(str(hours.current+1) + ":" + str((minutes.current)*5),335,270);
    textSize(25);
  }

  
}