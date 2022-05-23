# VGA_Pong_FPGA
 
A VGA controller was developed using verilog by using counters to time the HSYNC and VSYNC VGA signals. R, G and B bits were used to set the colour of a pixel at a position defined by current counter values. The counters were chosen to form a 1920x1080 pixel image and refresh at 60Hz.

![display-timings](https://user-images.githubusercontent.com/22674430/169874479-ce131f59-286a-405e-93fc-41e912efb418.png)

A pong game was implemented by drawing simple shapes on the screen and detecting collisions using boundary overlap. Everytime the ball hits the paddle or walls it is bounced off in the opposite direction by reversing the velocity in the collision direction. If the ball hits the paddle then the score is incremented, the player loses if he lets the ball hit the floor.

The onboard buttons on the FPGA board were used as the inputs to the game and the score was displayed using the onboard LEDs.

![image](https://user-images.githubusercontent.com/22674430/169876504-840f4695-d701-4ba3-af7d-258faaec8b52.png)
