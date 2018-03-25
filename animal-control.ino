#define CAT_ON_BYTE  'C'
#define DOG_ON_BYTE  'D'
#define CAT_OFF_BYTE  'c'
#define DOG_OFF_BYTE  'd'
#define CAT_CRY_BYTE  'M'
#define DOG_CRY_BYTE  'B'

#define CAT_PIN   2
#define DOG_PIN   3

byte inputByte= 0;

void setup() {
  Serial.begin(9600);
  pinMode(CAT_PIN, OUTPUT);
  pinMode(DOG_PIN, OUTPUT);

  digitalWrite(CAT_PIN, LOW);
  digitalWrite(DOG_PIN, LOW);
}

void toggle(int pin, bool active) {
   digitalWrite(pin, active ? HIGH : LOW);
}

void cry(int pin) {
  digitalWrite(pin, HIGH);
  delay(1200);
  digitalWrite(pin, LOW);
  delay(200);
}

void bark() {
  Serial.println("BARK");
  cry(DOG_PIN);
}

void meow() {
  cry(CAT_PIN);
}

void loop() {
  if (Serial.available() > 0) {
    inputByte = Serial.read();

    Serial.print("Received byte: ");
    Serial.println(inputByte, DEC);

    Serial.println(inputByte == CAT_CRY_BYTE);
    Serial.println(inputByte == DOG_CRY_BYTE);

    if (inputByte == CAT_ON_BYTE) {
      toggle(CAT_PIN, true);
    } else if (inputByte == CAT_OFF_BYTE) {
      toggle(CAT_PIN, false);
    } else if (inputByte == DOG_ON_BYTE) {
      toggle(DOG_PIN, true);
    } else if (inputByte == DOG_OFF_BYTE) {
      toggle(DOG_PIN, false);
    } else if (inputByte == CAT_CRY_BYTE) {
      meow();
    } else if (inputByte == DOG_CRY_BYTE) {
      bark();
    }
  }
}
