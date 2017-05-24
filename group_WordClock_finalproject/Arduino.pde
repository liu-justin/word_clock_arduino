//int datapin = 2; 
//int clockpin = 3;
//int latchpin = 4;
//byte data = 0;

//void setup()
//{
//  pinMode(datapin, OUTPUT);
//  pinMode(clockpin, OUTPUT);  
//  pinMode(latchpin, OUTPUT);

//  Serial.begin(9600);
//}

//byte lightArray[16][9] = {
//  {30,0,0,0,0,0,0,0,0} , // 0
//  {224,15,0,0,0,0,0,0,0} , // 1
//  {240,7,0,0,0,0,0,0,0} , // 2
//  {60,0,0,0,0,0,0,0,0} , // 3
//  {7,0,0,0,0,0,0,0,0} , // 4
//  {112,7,0,0,0,0,0,0,0} , // 5
//  {60,1,0,0,0,0,0,0,0} , // 6
//  {112,7,0,0,0,0,0,0,0} , // 7
//  {248,1,0,0,0,0,0,0,0} , // 8
//  {124,7,0,0,0,0,0,0,0} , // 9
//  {252,1,0,0,0,0,0,0,0} , // 10
//  {128,64,32,16,8,4,2,1,0} , // 11
//  {128,64,32,16,8,4,2,1,0} , // 12
//  {128,64,32,16,8,4,2,1,0} , // 13
//  {192,28,3,0,0,0,0,0,0} , // 14
//  {1,0,0,0,0,0,0,0,0} , // 15
//  };

//byte lightIndex[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

//void reset()
//{
//  for (int i = 0; i  < 16; i++)
//  {
//    lightIndex[i] = 0;
//  }
//}

//void convert(int val_)
//{
//  reset();
//  boolean inHour;
//  if (val_%100 <= 30) {inHour = true;}
//  else { inHour = false;}

//  lightIndex[11] = lightArray[11][0];
//  lightIndex[12] = lightArray[12][0];
//  lightIndex[13] = lightArray[13][0];
  
//  if ((val_/100 == 1 && inHour) || (val_/100 == 12 && !inHour)) // ONE
//  {
//    lightIndex[14] += lightArray[14][1];
//  }
//  else if ((val_/100 == 2 && inHour) || (val_/100 == 1 && !inHour)) // TWO
//  {
//    lightIndex[7] += lightArray[7][0];
//  }
//  else if ((val_/100 == 3 && inHour) || (val_/100 == 2 && !inHour)) // THREE
//  {
//    lightIndex[9] += lightArray[9][0];
//  }
//  else if ((val_/100 == 4 && inHour) || (val_/100 == 3 && !inHour)) // FOUR
//  {
//    lightIndex[10] += lightArray[10][1];
//    lightIndex[14] += lightArray[14][2];
//    lightIndex[15] += lightArray[15][0];
//  }
//  else if ((val_/100 == 5 && inHour) || (val_/100 == 4 && !inHour)) // FIVE
//  {
//    lightIndex[11] += lightArray[11][6];
//    lightIndex[12] += lightArray[12][6];
//    lightIndex[13] += lightArray[13][6];
//    lightIndex[6] += lightArray[6][1];
//  }
//  else if ((val_/100 == 6 && inHour) || (val_/100 == 5 && !inHour)) // SIX
//  {
//    lightIndex[14] += lightArray[14][0];
//    lightIndex[8] += lightArray[8][1];
//  }
//  else if ((val_/100 == 7 && inHour) || (val_/100 == 6 && !inHour)) // SEVEN
//  {
//    lightIndex[4] += lightArray[4][0];
//    lightIndex[11] += lightArray[11][4];
//    lightIndex[12] += lightArray[12][4];
//  }
//  else if ((val_/100 == 8 && inHour) || (val_/100 == 7 && !inHour)) // EIGHT
//  {
//    lightIndex[8] += lightArray[8][0];
//  }
//  else if ((val_/100 == 9 && inHour) || (val_/100 == 8 && !inHour)) // NINE
//  {
//    lightIndex[6] += lightArray[6][0];
//  }
//  else if ((val_/100 == 10 && inHour) || (val_/100 == 9 && !inHour)) // TEN
//  {
//    lightIndex[5] += lightArray[5][0];
//  }
//  else if ((val_/100 == 11 && inHour) || (val_/100 == 10 && !inHour)) // ELEVEN
//  {
//    lightIndex[7] += lightArray[7][1];
//    lightIndex[11] += lightArray[11][7];
//    lightIndex[12] += lightArray[12][7];
//    lightIndex[13] += lightArray[13][7];
//  }
//  else if ((val_/100 == 12 && inHour) || (val_/100 == 11 && !inHour)) // TWELVE
//  {
//    lightIndex[5] += lightArray[5][1];
//    lightIndex[11] += lightArray[11][5];
//    lightIndex[12] += lightArray[12][5];
//    lightIndex[13] += lightArray[13][5];
//  }

//  if (val_%100 == 0) // OCLOCK
//  {
//    lightIndex[10] += lightArray[10][0];
//  }
//  else if (val_%100 == 5) // FIVE PAST
//  {
//    lightIndex[2] += lightArray[2][0];
//    lightIndex[3] += lightArray[3][0];
//  }
//  else if (val_%100 == 10) // TEN PAST
//  {
//    lightIndex[1] += lightArray[1][0];
//    lightIndex[3] += lightArray[3][0];
//  }
//  else if (val_%100 == 15) // QUARTER PAST
//  {
//    lightIndex[1] += lightArray[1][1];
//    lightIndex[3] += lightArray[3][0];  
//    lightIndex[11] += lightArray[11][1];
//    lightIndex[12] += lightArray[12][1];
//    lightIndex[13] += lightArray[13][1];
//  }
//  else if (val_%100 == 20) // TWENTY PAST
//  {
//    lightIndex[2] += lightArray[2][1];
//    lightIndex[3] += lightArray[3][0];
//    lightIndex[11] += lightArray[11][2];
//    lightIndex[12] += lightArray[12][2];
//    lightIndex[13] += lightArray[13][2];
//  }
//  else if (val_%100 == 25) // TWENTY FIVE PAST
//  {
//    lightIndex[2] += lightArray[2][0];
//    lightIndex[2] += lightArray[2][1];
//    lightIndex[3] += lightArray[3][0];
//    lightIndex[11] += lightArray[11][2];
//    lightIndex[12] += lightArray[12][2];
//    lightIndex[13] += lightArray[13][2];
    
//  }
//  else if (val_%100 == 30) // HALF PAST
//  {
//    lightIndex[0] += lightArray[0][0];
//    lightIndex[3] += lightArray[3][0];
//  }
//  else if (val_%100 == 35) // TWENTY FIVE TIL
//  {
//    lightIndex[2] += lightArray[2][0];
//    lightIndex[2] += lightArray[2][1];
//    lightIndex[11] += lightArray[11][2];
//    lightIndex[12] += lightArray[12][2];
//    lightIndex[13] += lightArray[13][2];
//    lightIndex[11] += lightArray[11][3];
//    lightIndex[12] += lightArray[12][3];
//    lightIndex[13] += lightArray[13][3];
//  }
//  else if (val_%100 == 40) // TWENTY TIL
//  {
//    lightIndex[2] += lightArray[2][1];
//    lightIndex[11] += lightArray[11][2];
//    lightIndex[12] += lightArray[12][2];
//    lightIndex[13] += lightArray[13][2];
//    lightIndex[11] += lightArray[11][3];
//    lightIndex[12] += lightArray[12][3];
//    lightIndex[13] += lightArray[13][3];
//  }
//  else if (val_%100 == 45) // QUARTER TIL
//  {
//    lightIndex[1] += lightArray[1][1]; 
//    lightIndex[11] += lightArray[11][1];
//    lightIndex[12] += lightArray[12][1];
//    lightIndex[13] += lightArray[13][1];
//    lightIndex[11] += lightArray[11][3];
//    lightIndex[12] += lightArray[12][3];
//    lightIndex[13] += lightArray[13][3];
//  }
//  else if (val_%100 == 50) // TEN TIL
//  {
//    lightIndex[1] += lightArray[1][0];
//    lightIndex[11] += lightArray[11][3];
//    lightIndex[12] += lightArray[12][3];
//    lightIndex[13] += lightArray[13][3];
//  }
//  else if (val_%100 == 55) // FIVE TIL
//  {
//    lightIndex[2] += lightArray[2][0];
//    lightIndex[11] += lightArray[11][3];
//    lightIndex[12] += lightArray[12][3];
//    lightIndex[13] += lightArray[13][3];
//  }

//}

//int lightArrays[16]= {255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

//void checking()
//{
//  int delayTime = 10;
//  for (int i = 15; i >= 0; i--)
//  {
//    shiftOut(datapin, clockpin, MSBFIRST, lightIndex[i]);
//  }
  
//  digitalWrite(latchpin, HIGH);
//  digitalWrite(latchpin, LOW);

//  delay(delayTime);
//}

//void test()
//{
//  int delayTime = 10;

//  for (int i = 15; i >= 0; i--)
//  {
//    shiftOut(datapin, clockpin, MSBFIRST, lightIndex[i]);
//  }

//  digitalWrite(latchpin, HIGH);
//  digitalWrite(latchpin, LOW);

//  delay(delayTime);  
//}

//long currentTime = 0;
//long waitTime = 300000;
//int code = 0;
//int val = 100;

//void loop()
//{
//  if (Serial.available())
//  {
//    code = Serial.read();
//    val = 100 + 100*(code/12) + 5*(code%12);
//    currentTime = millis();
//  }
  
//  convert(val);
//  test();
//  if ((millis() - currentTime) >= waitTime)
//  {
//    code = code + 1;
//    if (code == 144) { code = 0;}
//    val = 100 + 100*(code/12) + 5*(code%12);
//    currentTime = millis();
//  }

//  //checking();
//}