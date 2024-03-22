class Button {
  static final int W = 60, H = 40, TXTSZ = 020;
  static final color BTNC = #00A0A0, HOVC = #00FFFF, TXTC = 250;

  final String label;
  final int x, y, xW, yH;

  boolean isHovering;

  Button(String txt, int xx, int yy) {
    label = txt;

    x = xx;
    y = yy;

    xW = xx + W;
    yH = yy + H;
  }

  void display() {
    fill(isHovering? HOVC : BTNC);
    rect(x, y, W, H);

    fill(TXTC);
    text(label, x + W/2, y + H/2);
  }

  boolean isInside() {
    return isHovering = mouseX > x & mouseX < xW & mouseY > y & mouseY < yH;
  }
}
