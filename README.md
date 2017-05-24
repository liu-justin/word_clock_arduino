# word_clock_arduino
Building a word clock powered by an arduino.

In this project, I took inspiration from various online guides on how to make a word clock, particularly from this link
http://imgur.com/a/iMXmj

The way my word clock is different is the size (11x11) and the fact that all lights are controlled individually, instead of chaining lights together by word. By doing this, I increase the programability of the clock, meaning I can switch out different templates and change the code and the clock will change to the new clock.

The main guts of the clock come in the form of shift registers. Due the low amount of IO pins on a standard Arduino, a shift register allows 8 outputs for only 3 inputs. They can be put in series to allow for potentially infinite outputs. 

In order to control all 121 lights individually, I took the long route by daisychaining 16 shift registers together. In the previously posted link, the user had used 3 shift registers to control about 20-30 words. Other clocks, such as the one in this link,

http://imgur.com/a/dtLSy

used individually addressed LEDs, which have shift registers built into them. In hindsight, I would have preferred to use these individually addressable LEDs, but the journey was fun and exciting to jump into as a dip into the world of electrical engineering. Also, I have a word clock that I can proudly label as my own invention, with my own spin onto it.

Most of the trouble came from the PCB that held all 16 shift registers. I printed about 9 of them before I could root out the problem and fix the diagram in Eagle.


