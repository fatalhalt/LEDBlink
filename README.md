# Arduino LED Blink without IDE

The included build.bat contains all individual commands needed to compile all Arduino wrapper/library code located at ```C:\Program Files (x86)\Arduino\hardware``` that ships with an IDE. The build.bat is based on IDE's "verbose" output and the included main.cpp is based off Blink.ino example; it blinks built-in LED via digital pin 13.

The point of all of this is for education purposes to better understand what Arduino's IDE is doing underneath. The build.bat and this tutorial assumes that ATmega328P w\ bootloader is being used (an Arduino).

## How Arduino Boilerplate Works

Arduino provides a wrapper functions like pinMode() and digitalWrite() that abstract some lower level operations such as setting a GPIO pin to be used as Digital Output and the pulling it HIGH or LOW. Otherwise without the wrappers this would be done by setting 6th bit ON of DDRB (Data Direction Register B) to turn PB5 (Digital 13) into an OUTPUT pin, and similarly setting the 6th bit ON/OFF of PORTB to pull Digital 13 HIGH and LOW to blink the LED. This is what I meant by referring to it as wrapper/library.

## Arduino's core.a wrapper/library archive

All of the wrapper/library .o object files are archived into a core.a (collection of object files). The core.a is composed of .o from these files:
```
C wrapper code  (only exception being first one an assembly file)
hardware\arduino\avr\cores\arduino\wiring_pulse.S
hardware\arduino\avr\cores\arduino\wiring.c
hardware\arduino\avr\cores\arduino\WInterrupts.c
hardware\arduino\avr\cores\arduino\wiring_analog.c
hardware\arduino\avr\cores\arduino\hooks.c
hardware\arduino\avr\cores\arduino\wiring_pulse.c
hardware\arduino\avr\cores\arduino\wiring_shift.c
hardware\arduino\avr\cores\arduino\wiring_digital.c
```
```
C++ wrapper code
hardware\arduino\avr\cores\arduino\CDC.cpp
hardware\arduino\avr\cores\arduino\HardwareSerial1.cpp
hardware\arduino\avr\cores\arduino\IPAddress.cpp
hardware\arduino\avr\cores\arduino\HardwareSerial.cpp
hardware\arduino\avr\cores\arduino\HardwareSerial2.cpp
hardware\arduino\avr\cores\arduino\HardwareSerial3.cpp
hardware\arduino\avr\cores\arduino\PluggableUSB.cpp
hardware\arduino\avr\cores\arduino\HardwareSerial0.cpp
hardware\arduino\avr\cores\arduino\Print.cpp
hardware\arduino\avr\cores\arduino\Stream.cpp
hardware\arduino\avr\cores\arduino\Tone.cpp
hardware\arduino\avr\cores\arduino\USBCore.cpp
hardware\arduino\avr\cores\arduino\WMath.cpp
hardware\arduino\avr\cores\arduino\WString.cpp
hardware\arduino\avr\cores\arduino\abi.cpp
hardware\arduino\avr\cores\arduino\main.cpp
hardware\arduino\avr\cores\arduino\new.cpp
```
and relevant Include dirs are:
```
hardware\arduino\avr\cores\arduino
hardware\arduino\avr\variants\standard
```
That all there's to it. Files of interest include main.cpp, wiring.c, and Arduino.h

## Usage

Copy ```C:\Program Files (x86)\Arduino\hardware``` and paste it alongside of this README.me. Adjust the ```-PCOM4``` COM Port on line 63 of build.bat to corresponds to your Arduino. Execute included ```build.bat```

## How Arduino links and uses avrdude to uploaded the finished .hex
avr-gcc-ar is used to create the archive:
```bash
avr-gcc-ar rcs core.a *.o
```
and then the files are linked
```bash
avr-gcc -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=atmega328p -o LEDBlink.elf main.cpp.o core.a -L . -lm
avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 LEDBlink.elf LEDBlink.eep
avr-objcopy -O ihex -R .eeprom LEDBlink.elf LEDBlink.hex
```
then avrdude uploads the finished program
```bash
avrdude -C hardware\tools\avr\etc\avrdude.conf -v -patmega328p -carduino -PCOM4 -b115200 -D -Uflash:w:LEDBlink.hex:i 
```
The avrdude works and relies on ~2KB burnt-in bootloader that your Arduino comes with out-of-the-box. Among things, the bootloader allows USB-to-UART communication between PC and Arduino without having to resort to TX and RX serial pins. How nice.

## main.cpp
```c
/*
  LEDBlink

  Turns an LED on for one second, then off for one second, repeatedly.
*/

#include <Arduino.h>

// Declared weak in Arduino.h to allow user redefinitions.
int atexit(void (* /*func*/ )()) { return 0; }

// Weak empty variant initialization function.
// May be redefined by variant files.
void initVariant() __attribute__((weak));
void initVariant() { }

void setupUSB() __attribute__((weak));
void setupUSB() { }


// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);                       // wait for a second
}

int main(void)
{
	init();
	initVariant();
#if defined(USBCON)
	USBDevice.attach();
#endif
	setup();

	for (;;) {
		loop();
		if (serialEventRun) serialEventRun();
	}
        
	return 0;
}
```

## Linux?
This will also work on GNU/Linux distro, MacOS, or *BSD, you just need to replace backslashes with forward slashes. Actually in Ubuntu it is very convenient to install ```apt-get install arduino-mk``` and create small Makefile that includes Arduino.mk, albeit this approach isn't as bare and doesn't give you a clear overview what's going on under the hood.

## What's Next?
Next would be to use <avr/io.h> <util/delay.h> without any of the Arduino's core.a to blink a LED.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)