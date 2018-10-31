# LyncDisplayLight
This device is just a simple RGB-LED with a display which can be controlled by the virtual serial port on its USB connection.
In combination with the appropriate desktop application [Lync-Presence-Bridge](https://github.com/grafmar/Lync-presence-bridge)
it shows the active Lync / Skype for Business state and in the case of a call or chat it displays the counterpart of the
conversation. This is especially useful, if the monitor is locked. That's why I implemented this device.

<img src="Documentation/LyncDisplayLight_ActionWithCallerID_NormalDiffusor.jpg" alt="LyncDisplayLight in action" width="50%"/>

## Requirements
* [Arduino IDE](https://www.arduino.cc/en/main/software)
* [ESP8266 board support](https://github.com/arduino/Arduino/wiki/Unofficial-list-of-3rd-party-boards-support-urls): http://arduino.esp8266.com/stable/package_esp8266com_index.json
* Adafruit_NeoPixel library
* Adafruit_GFX library
* Adafruit_SSD1306 library
* [Visual Studio](https://visualstudio.microsoft.com/) to have a comfortable IDE
* [Visual Micro](https://www.visualmicro.com/) to integrate Arduino IDE in Visual Studio

## Hardware
The hardware consists of:
* Wemos D1 mini (available on [Aliexpress](https://www.aliexpress.com/item/D1-mini-Mini-NodeMcu-4M-bytes-Lua-WIFI-Internet-of-Things-development-board-based-ESP8266-by/32644199530.html))
* WS2801b board for Wemos D1 mini (available on [Aliexpress](https://www.aliexpress.com/item/WS2812B-RGB-expansion-board-for-D1-mini-BMP180/32806935855.html))
* 128x32 OLED display SSD1306 (soldered) (available on [Aliexpress](https://www.aliexpress.com/item/0-91-Inch-128x32-IIC-I2C-White-Blue-OLED-LCD-Display-DIY-Module-SSD1306-Driver-IC/32879702750.html))

## Housing / Enclosure
The housing is 3D printed using black PLA for the base and clear PLA for the diffusor. I also made different types with
smaller diffusors or special diffusors.

<img src="Documentation/LyncDisplayLight_ActionWithoutCallerID_SmallDiffusor.jpg" alt="LyncDisplayLight with small diffusor" width="30%"/> <img src="Documentation/LyncDisplayLight_CollectionOfDiffusors.jpg" alt="Different diffusors" width="30%"/>
  
<img src="Documentation/LyncDisplayLight_DarthVader.jpg" alt="LyncDisplayLight with Darth Vader diffusor" width="30%"/> <img src="Documentation/LyncDisplayLight_CoreBlade.jpg" alt="LyncDisplayLight with Bass Guitar Amplifier diffusor" width="30%"/>

## Author
[Marco Graf](https://github.com/grafmar)
