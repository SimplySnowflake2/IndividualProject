int secret_num;
String Number = "";
String feedback = "";

void setup() {
  size(700, 400);
  smooth(1);
  textAlign(CENTER);
  textFont(createFont("Georgia", 17));
  background(255);

  // Random number generation
  secret_num = int(random(1, 101)); // Generate a random number between 1 and 100
  println("Secret Number is  " + secret_num);
}

// Text on screen
void draw() {
  background(255);
  fill(0);
  text("I'm Thinking of a number between 1-100 can you guess what it is? You have 20 guesses,", 350, 50);
  text("Better start thinking ;D", 350, 70);
  text("Enter what you think it is into this box -->", 350, 350);
  rect(550, 320, 100, 50);
  text(feedback, 350, 200);
  fill(255);
  text(Number, 600, 350);
}

void keyPressed() {
  if (keyCode == ENTER || keyCode == RETURN || key == '\n') {
    int guess = parseInt(Number); // Convert the user's input to an integer

    if (guess == secret_num) {
      feedback = "Correct!! You got me this time! Well done!!";
    } else if (guess > secret_num) {
      feedback = "Wrong!! HAHA! Your going to have to try a smaller number!!";
    } else {
      feedback = "Wrong!! HAHA! Your going to have to try a bigger number!!";
    }

    Number = ""; // Clear the input box after each guess
  } else if (keyCode >= '0' && keyCode <= '9') {
    Number += key; // Append the digit to the input
  }
}
