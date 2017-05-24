class radioButtonSet
{
  boolean[] power;
  int current = 0;
  
  float startX;
  float startY;
  int size = 12;
  int mod;
  int shift;
  
  radioButtonSet(int size, float x_, float y_, int mod_, int shift_)
  {
    power = new boolean[size];
    power[current] = true;
    startX = x_;
    startY = y_;
    mod = mod_;
    shift = shift_;
  }
  
  void displayButtons()
  {
    for (int i = 0; i < power.length; i++)
    {
      if (power[i] == true) { fill(0);}
      rect(startX + 25*i, startY, 25, 25);
      textSize(10);
      if (power[i] == true) {fill(255);}
      else {fill(0);}
      text((i+1-shift)*mod,startX + 25*i+10,startY+15);
      fill(255);
    }
    textSize(25);
  }
  
  boolean hoverCheck(float x, float y)
  {    
    if (mouseX > x && mouseX < x +25 && mouseY > y && mouseY < y + 25) {return true;}
    return false;
  }
  
  void switchFeeds(int toIndex)
  {
    power[current] = false;
    current = toIndex;
    power[current] = true;
  }
}