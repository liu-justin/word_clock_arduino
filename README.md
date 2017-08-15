# word_clock_arduino
Building a word clock powered by an arduino.

In this project, I took inspiration from various online guides on how to make a word clock, particularly from this link
http://imgur.com/a/iMXmj

The way my word clock is different is the size (11x11) and the fact that all lights are controlled individually, instead of chaining lights together by word. By doing this, I increase the programability of the clock, meaning I can switch out different templates and change the code and the clock will change to the new clock.

The main guts of the clock come in the form of shift registers. Due the low amount of IO pins on a standard Arduino, a shift register allows 8 outputs for only 3 inputs. They can be put in series to allow for potentially infinite outputs. If you don't know how shift registers work, I learned from this video.

https://www.youtube.com/watch?v=6fVbJbNPrEU

It really doesn't matter which kind of shift register you use, you just have to understand which pins do what. For example, I used the 74hc595, and the pins can be found in this image: https://cdn.instructables.com/FHH/ICV1/H5TUC8B2/FHHICV1H5TUC8B2.MEDIUM.jpg . Looking at it, Pin 9 is labeled as Serial Out, which means that to chain shift registers A and B together, you need to connect Pin 9 (serial out) of A to Pin 3 (serial data in) of B. If you are having trouble, look for a guide online, such as this one:

https://www.arduino.cc/en/Tutorial/ShiftOut

In order to control all 121 lights individually, I took the long route by daisychaining 16 shift registers together. In the first posted link, the user had used 3 shift registers to control about 20-30 words. Other clocks, such as the one in this link,

http://imgur.com/a/dtLSy

used individually addressed LEDs, which have shift registers built into them. In hindsight, I would have preferred to use these individually addressable LEDs, but the journey was fun and exciting to jump into as a dip into the world of electrical engineering. Also, I have a word clock that I can proudly label as my own invention, with my own spin onto it.

The general layout of the design:
- Arduino provides power, ground, and the 3 IO pins needed to operate a shift register/chain of shift registers
- 16 shift registers are placed on a PCB, which was designed so that the end of each shift register leads to the beginning of another
- each shift register controls 8 LEDs, with the last shift register only controlling one LED (121%8 = 1)
- all LEDs are grounded

Because the shift registers can only have 8 outputs, and my grid is 11x11, the spacing of the LEDS is up to discretion. I tried to make it in rows for ease of programability, as shown in the excel file. I am absolutely positive that there is a better way of spacing them, but this setup works for me.

To light up the LEDs, I needed to send 16 bytes of data to the 16 shift registers, which each have 8 binary outputs (otherwise known as a byte). The first byte is sent to the last shift register, and the last byte is sent to the first shift register. To know which byte to send, look at the bottom right grid in my excel sheet titled lettering. The reading is from left to right, top to bottom. Just pick the words you want to light up, and convert the binary to decimal. 

