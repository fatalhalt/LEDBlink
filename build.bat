REM  HOWTO
REM    make a copy of C:\Program Files (x86)\Arduino\hardware to and place it alongside side of README.md
REM    adjust the COM port of your arduino on line 63
REM
REM

set PATH=hardware\tools\avr\bin;%PATH%

DEL /Q /F *.o
DEL /Q /F *.d
DEL /Q /F *.a
DEL /Q /F *.eep
DEL /Q /F *.elf
DEL /Q /F *.hex
pause

REM  Compiling C wrapper code  (only exception being first one an assembly file)
avr-gcc -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega328p                                                      -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\wiring_pulse.S" -o "wiring_pulse.S.o"
avr-gcc -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\wiring.c" -o "wiring.c.o"
avr-gcc -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\WInterrupts.c" -o "WInterrupts.c.o"
avr-gcc -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\wiring_analog.c" -o "wiring_analog.c.o"
avr-gcc -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\hooks.c" -o "hooks.c.o"
avr-gcc -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\wiring_pulse.c" -o "wiring_pulse.c.o"
avr-gcc -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\wiring_shift.c" -o "wiring_shift.c.o"
avr-gcc -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\wiring_digital.c" -o "wiring_digital.c.o"

REM  Compiling C++ wrapper code
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\CDC.cpp" -o CDC.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\HardwareSerial1.cpp" -o HardwareSerial1.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\IPAddress.cpp" -o IPAddress.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\HardwareSerial.cpp" -o HardwareSerial.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\HardwareSerial2.cpp" -oHardwareSerial2.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\HardwareSerial3.cpp" -o HardwareSerial3.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\PluggableUSB.cpp" -o PluggableUSB.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\HardwareSerial0.cpp" -o HardwareSerial0.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\Print.cpp" -o Print.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\Stream.cpp" -o Stream.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\Tone.cpp" -o Tone.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\USBCore.cpp" -o USBCore.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\WMath.cpp" -o WMath.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\WString.cpp" -o WString.cpp.o
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\abi.cpp" -o abi.cpp.o
REM  we're not compiling hardware\\arduino\\avr\\cores\\arduino\\main.cpp here, we do it further down
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "hardware\\arduino\\avr\\cores\\arduino\\new.cpp" -o new.cpp.o


REM  LEDBlink program
avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR "-Ihardware\\arduino\\avr\\cores\\arduino" "-Ihardware\\arduino\\avr\\variants\\standard" "main.cpp" -o main.cpp.o

REM  Archiving core.a
avr-gcc-ar rcs core.a wiring_pulse.S.o WInterrupts.c.o hooks.c.o wiring.c.o wiring_analog.c.o wiring_digital.c.o wiring_pulse.c.o wiring_shift.c.o CDC.cpp.o HardwareSerial.cpp.o HardwareSerial0.cpp.o HardwareSerial1.cpp.o HardwareSerial2.cpp.o HardwareSerial3.cpp.o IPAddress.cpp.o PluggableUSB.cpp.o Print.cpp.o Stream.cpp.o Tone.cpp.o USBCore.cpp.o WMath.cpp.o WString.cpp.o abi.cpp.o new.cpp.o

REM Linking everything together...
avr-gcc -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=atmega328p -o LEDBlink.elf main.cpp.o core.a -L . -lm
avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 LEDBlink.elf LEDBlink.eep
avr-objcopy -O ihex -R .eeprom LEDBlink.elf LEDBlink.hex

avr-size -A LEDBlink.elf

echo Hit any key to continue flashing...
pause
REM  Uploading final .hex to Arduino using avrdude
avrdude -C hardware\tools\avr\etc\avrdude.conf -v -patmega328p -carduino -PCOM4 -b115200 -D -Uflash:w:LEDBlink.hex:i 

pause
exit
