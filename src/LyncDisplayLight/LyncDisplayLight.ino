#include <ESP8266WiFi.h>
#include <Wire.h>
#include <SPI.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <Adafruit_NeoPixel.h>
#include "FreeSans9pt8b.h"


#define OLED_SDA    D3
#define OLED_SCK    D4
#define OLED_RESET  D5
#define LED_PIN     D2

Adafruit_SSD1306 display(128, 32, &Wire, OLED_RESET);
Adafruit_NeoPixel ledPixel = Adafruit_NeoPixel(1, LED_PIN, NEO_GRB + NEO_KHZ800);
String inData;

uint32_t lastUpdate;
#define UPDATE_THRESHOLD 120000UL

void OnSetLed(uint8_t red, uint8_t green, uint8_t blue) {
    ledPixel.setPixelColor(0, ledPixel.Color(red, green, blue));
    ledPixel.show();
}


void OnSetDisplay(String callerid) {
    display.clearDisplay();
    display.setCursor(0, 21);
    display.println(callerid);
    display.display();
}


void setup() {
    // Listen on serial connection for messages from the PC
    Serial.begin(115200);

    // Turn WiFi off
    WiFi.mode(WIFI_OFF);

    delay(2000);  // delay to sattle all voltages (for display)

    // setup RGB-LED
    ledPixel.begin();
    ledPixel.setPixelColor(0, ledPixel.Color(0, 0, 50));
    ledPixel.show();

    delay(2000);  // delay to sattle all voltages (for display)

    Wire.begin(OLED_SDA, OLED_SCK); // Initialize I2C for OLED Display (GPIO0 and GPIO2)
    display.begin(SSD1306_SWITCHCAPVCC, 0x3C);  // initialize with the I2C addr 0x3D (for the 128x64)
    display.setFont(&FreeSans9pt8b);
    display.setTextColor(WHITE);
    display.setTextWrap(false);
    OnSetDisplay("     Welcome");
    delay(2000);
    OnSetDisplay("");
    lastUpdate = millis();
}


void loop() {
    while (Serial.available() > 0) {
        char recieved = Serial.read();
        inData += recieved;

        // Process message when new line character is recieved
        if ((recieved == '\n') || (recieved == '\r')) {
            if (inData.startsWith("rgb:")) {
                lastUpdate = millis();
                int ind;
                uint8_t red;
                uint8_t green;
                uint8_t blue;

                ind = inData.indexOf(',');  //finds location of first ,
                red = inData.substring(4, ind).toInt();
                inData = inData.substring(ind + 1);
                ind = inData.indexOf(',');  //finds location of first ,
                green = inData.substring(0, ind).toInt();
                inData = inData.substring(ind + 1);
                ind = inData.indexOf(',');  //finds location of first ,
                blue = inData.substring(0, ind).toInt();

                OnSetLed(red, green, blue);
            }
            else if (inData.startsWith("callerid:")) {
                OnSetDisplay(inData.substring(9));
            }

            inData = ""; // Clear recieved buffer
        }
    }

    // Nothing communicating: Clear display and show light blue -> OFF
    if (millis() - lastUpdate > UPDATE_THRESHOLD) {
        lastUpdate = millis();
        ledPixel.setPixelColor(0, ledPixel.Color(0, 0, 50));
        ledPixel.show();
        OnSetDisplay("");
    }
}

