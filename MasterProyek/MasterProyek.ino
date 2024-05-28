extern "C"{
  void I2C_init();
  void RESET();
}

void setup() {
  I2C_init();
}

void loop() {
  RESET();
}
