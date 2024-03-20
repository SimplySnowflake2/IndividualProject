//Sarah Zhang | Monday, October 23rd, 2023 | Buttons

Button b1;

void setup() {
  size(500, 500);
  b1 = new Button(150, 100, 100, 50);
}

void draw () {
  background(255);
  b1.display();
  b1.hover();
}
