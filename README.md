# Animal Control

Gives you influence over the cries of various animals connected to an Arduino

### Usage

1. Connect animals to Arduino. E.g. 3.3V + GND for normal operation, and a signal wire connected to the push button. Pins 2 and 3 given current implementation.
1. Connect Arduino to computer using USB. Adjust script if device is anything other than `/dev/cu.usbmodem1411`.
1. Run `./animal-control D` to acticate dog, `./animal-control D` to deactive and `./animal-control B` to bark once.
