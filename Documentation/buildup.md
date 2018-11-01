# Buildup of Lync-Display-Light

## Electronics
Solder the female pin header to the Wemos D1 mini board:
<img src="Buildup_images/Wemos_D1_mini.jpg" alt="Wemos D1 mini with female pin headers" width="30%"/>

The WS2812b board has to be shortened at the lower part to fit into the housing. Then the pin
headers can be soldered.

<img src="Buildup_images/WS2812b.jpg" alt="WS2812b original" width="30%"/><img src="Buildup_images/WS2812b_shortened.jpg" alt="WS2812b shortened" width="30%"/>

To connect the display the black plastic of the connector has to be removed for the pins "5V", "GND", "D4" and "D3":
<img src="Buildup_images/WS2812b_removed_plastic.jpg" alt="WS2812b removed plastic" width="30%"/>

Then four short wires can be soldered from the WS2812b board to the SSD1306 OLED 128x32 I2C. I used
a ribbon cable for this purposes.

<img src="Buildup_images/SSD1306_OLED_128x32_I2C.jpg" alt="SSD1306 OLED 128x32 I2C" width="30%"/><img src="Buildup_images/SSD1306_OLED_128x32_I2C_wired_to_WS2812b.jpg" alt="OLED wired to WS2812b" width="30%"/>

## Put into housing
The Wemos D1 mini board can be inserted into the bottom part of the housing with the USB
connector first and should then just snap in.
<img src="Buildup_images/Bottom_with_WemosD1mini.jpg" alt="Wemos D1 mini board in bottom part" width="30%"/>

Remove the protective foil from the display. Then the display can be inserted into the groove
of the housing. Possibly the flat black cable foil on the right has to be folded to be able
to insert it.
<img src="Buildup_images/Bottom_with_display.jpg" alt="Bottom part with display" width="30%"/>

Then the WS2812b board can be connected on top of the Wemos D1 mini.
<img src="Buildup_images/Bottom_with_WS2812b.jpg" alt="Bottom part with WS2812b" width="30%"/>

Put the desired diffusor on top of the bottom part in an angle of 45°. Then just turn it to snap
in the diffusor to the bottom part. Connect the Lync display light to your PC and program it.
When it starts up, it sets the light to a dimm blue and the Welcome message is displayed.
<img src="Buildup_images/LyncDisplayLight_Assembled.jpg" alt="LyncDisplayLight completely assembled" width="30%"/>

## Author
[Marco Graf](https://github.com/grafmar)
