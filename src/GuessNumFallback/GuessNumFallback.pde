int secret_num;
String Number = "";
String feedback = "";

void setup() {

  size(700, 400);
  smooth(1);
  textAlign(CENTER);
  textFont(createFont("Georgia", 17));
  background(255);

  //Random number generation
  secret_num = int(random(99));
  println("Secret Number is  " + secret_num);
}

//Text on screen

void draw() {
  background(255);
  fill(0);
  text("I'm Thinking of a number between 1-100 can you guess what it is? You have 20 guesses,", 350, 50);
  text("Better start thinking ;D", 350, 70);
  text("Enter what you think it is into this box -->", 350, 350);
  rect (550, 320, 100, 50);
  text(feedback, 350, 200);
  fill(255);
  text(Number, 600, 350);
}

void keyPressed() {
  println(Number);

  //Result
  if (key == ENTER || key == RETURN || key == 10);

  //Number="";
  if (keyCode == 10)
    //if (keyCode == ENTER || keyCode == 10)
    if (int(Number) == secret_num) {
      feedback = "Correct!! You got me this time! Well done!!";
      Number = "";
      secret_num = int(random(99));
    } else if (int(Number) > secret_num) {
      feedback = "Wrong!! HAHA! Your going to have to try a smaller number!!";
      Number = "";
    } else {
      feedback = "Wrong!! HAHA! Your going to have to try a bigger number!!";
      Number = "";
    }

  //Input
  if (key >= '0' && key <= '9') {
    Number = Number + key;
    //noLoop();
  }
}
