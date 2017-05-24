# word_clock_arduino
Building a word clock powered by an arduino.

In this project, I took inspiration from various online guides on how to make a word clock, particularly from this link
http://imgur.com/a/iMXmj

The way my word clock is different is the size (11x11) and the fact that all lights are controlled individually, instead of chaining lights together by word. By doing this, I increase the programability of the clock, meaning I can switch out different templates and change the code and the clock will change to the new clock.

The main guts of the clock come in the form of shift registers. Due the low amount of IO pins on a standard Arduino, a shift register allows 8 outputs for only 3 inputs. They can be put in series to allow for potentially infinite outputs. 

In order to control all 121 lights individually, I took the long route by daisychaining 16 shift registers together. In the previously posted link, the user had used 3 shift registers to control about 20-30 words. Other clocks, such as the one in this link,

http://imgur.com/a/dtLSy

used individually addressed LEDs, which have shift registers built into them. In hindsight, I would have preferred to use these individually addressable LEDs, but the journey was fun and exciting to jump into as a dip into the world of electrical engineering. Also, I have a word clock that I can proudly label as my own invention, with my own spin onto it.

The general layout of the design:
- Arduino provides power, ground, and the 3 IO pins needed to operate a shift register
- 16 shift registers are placed on a PCB, which was designed so that the end of each shift register leads to the beginning of another
- each shift register controls 8 LEDs, with the last shift register only controlling one LED
- all LEDs are grounded

Because the shift registers can only have 8 outputs, and my grid is 11x11, the spacing of the LEDS is up to discretion. I tried to make it in rows for ease of programability.

To light up the LEDs, you need to send 16 bytes of data to the shift registers. The first byte is sent to the last shift register, and the last byte is sent to the first shift register. To know which byte to send, look at the bottom right grid in my excel sheet titled lettering. The reading is from left to right, top to bottom. Just pick the words you want to light up, and convert the binary to decimal. 

