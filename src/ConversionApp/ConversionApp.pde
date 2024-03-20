//Sarah Zhang | Monday, September 25th, 2023 | Conversion App

void setup() {
  size(1000, 500);
}

void draw() {
  background(125);

  //Title Text

  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("Conversion App | by Sarah Zhang", width/2, 80);

  //Reference Line/Shape with Labels

  line(width/4, height/2, width/2 - 100, height/2);
  line(width/2, height/2, (width/4) * 3.0 + 150, height/2);
  if (mouseX > width/4.0 && mouseX < height - 100 && mouseY > height/2 - 40 && mouseY < height/2 + 40) {
    circle (width/4, height/2, (mouseX - (width/4.0)) * 2.0);
    line (width/4, height/2, mouseX, width/4);
    fill(0);
    textSize(18);
    text("Area: " + rToArea(mouseX - width/4.0), height/2, mouseX + 20);
  } else if (mouseX > width/2 && mouseX < width - 100 && mouseY > height/2 - 40 && mouseY < height/2 + 40) {
    circle (width/2, height/2, 2.0 * sqrt((mouseX - width/2)/PI));
    line (width/2, height/2, mouseX, height/2);
    fill(0);
    textSize(18);
    text("Radius: " + areaToR(mouseX - width/2.0), width/2, mouseY + 25);
  }

  //Tic Marks and Label

  //Radius to Area:
  for (int i = width/4; i < width/2 - 50; i += 50) {
    line(i, height/2 + 10, i, height/2 - 10);
    if (mouseX < (width/2.0) - 100 && mouseX > width/4.0) {
      ellipse(mouseX, height/2, 10, 10);
      textSize(12);
      fill(0);
      text(mouseX - (width/4), mouseX, height/2 - 10);
    }
  }
  //Area to Radius:
  for (int i = width/2; i < width - 50; i += 50) {
    line(i, height/2 + 10, i, height/2 - 10);
    if (mouseX < width - 100 && mouseX > width/2) {
      ellipse(mouseX, height/2, 10, 10);
      textSize(12);
      fill(0);
      text((mouseX - width/2), mouseX, height/2 - 10);
    }
  }

  //Headings
  textSize(18);
  fill(0);
  text("Radius to Area", width/4, 450);
  text("Area to Radius", (width/4) * 3.0, 450);

  //Console Display (println statement):
  if (mouseX < width/2 - 50 && mouseX > width/4) {
    println("R:" + (mouseX - (width/4.0)) + " Area:" + rToArea(mouseX - width/4.0));
    println("Area:" + (mouseX - width/4.0) + " R:" + areaToR(mouseX - width/4.0));
  } else if (mouseX > width/2 && mouseX < width - 100) {
    println("R:" + (mouseX - (width/2.0)) + " Area:" + rToArea(mouseX - width/2.0));
    println("Area:" + (mouseX - width/2.0) + " R:" + areaToR(mouseX - width/2.0));
  }
}

float rToArea(float val) {
  val = sq(val) * PI;
  return val;
}

float areaToR(float val) {
  val = sqrt((val)/PI);
  return val;
}
