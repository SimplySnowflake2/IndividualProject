//Sarah Zhang | Wednesday, September 6th, 2023 | Timeline

PFont font1, font2;

void setup() {
  size(900, 400);
  background(120);
  font1 = loadFont("AcademyEngravedLetPlain-40.vlw");
  font2 = loadFont("Skia-Regular_Light-Extended-14.vlw");
}

void draw() {
  background(120);

  //Title Info
  fill(250);
  textFont(font1);
  textSize(40);
  textAlign(CENTER);
  text("Historic Computer Systems", width/2, 70);
  textSize(24);
  text("by Sarah Zhang", width/2, 100);

  //Draw the Timeline
  strokeWeight(3);
  line(100, 250, 800, 250);
  line(100, 245, 100, 255);
  textFont(font2);
  textSize(14);
  text("1940", 100, 270);
  line(800, 245, 800, 255);
  text("1955", 800, 270);

  //Creating Tic Marks
  text("1945", 333, 270);
  line(333, 245, 333, 255);
  text("1950", 566, 270);
  line(566, 245, 566, 255);

  strokeWeight(2);

  line(147, 245, 147, 255);
  line(194, 245, 194, 255);
  line(241, 245, 241, 255);
  line(288, 245, 288, 255);

  line(380, 245, 380, 255);
  line(427, 245, 427, 255);
  line(474, 245, 474, 255);
  line(521, 245, 521, 255);

  line(613, 245, 613, 255);
  line(660, 245, 660, 255);
  line(707, 245, 707, 255);
  line(754, 245, 754, 255);

  //Create histEvent
  // "/n is a new line
  strokeWeight(3);
  histEvent(127, 200, "Z3", "1941 | Konrad Zuse | To help calculate aerodynamic calculations in aircraft design", true);
  histEvent(214, 300, "Atanasoff-Berry Computer", "1942 | John Vincent Atanasoff and Clifford E. Berry | This computer \n could store data and solve the solutions of systems of simultaneous linear equations", false);
  histEvent(268, 200, "Colossus Mark 1", "1944 | Tommy Flowers | Machines that Germans used to break British code during WW2", true);
  histEvent(400, 300, "ENIAC", "1946 | University of Pennsylvania | The ENIAC's purpose \nwas to calculate artillery firing tables in the United States Army.", false);
  histEvent(455, 200, "Manchester Baby", "1948 | Frederic C. Williams, Tom Kilburn, and Geoff Tootill | This \ncomputer was used to temporarily store electronic binary data.", true);
  histEvent(540, 300, "EDSAC", "1949 | Maurice Wilkes and Cambridge University | Used to form \na part of the Mathematical Laboratory's support service for calculation.", false);
  histEvent(593, 200, "Ferranti Mark 1", "1951 | Ferranti | This was the world's first general-purpose digital computer that was commercially \naccessible. It could help forecast election results, calculate wages, and produce actuarial tables, among many things.", true);
  histEvent(773, 300, "IBM 650", "1954 | IBM | The IBMM 650 was marketed to business, \nscientific and engineering users as a general-purpose version of the IBM 701 and IBM 702 computers.", false);
}

void histEvent(int x, int y, String title, String detail, boolean top) {
  text(title, x, y);
  if (top == true) {
    line(x, y+5, x+20, y+50);
  } else {
    line(x, y-15, x-20, y-50);
  }

  //Detect mouse over on title
  if (mouseX > x-30 && mouseX < x+30 && mouseY > y-20 && mouseY < y+5) {
    text(detail, width/2, 350);
  }
}
