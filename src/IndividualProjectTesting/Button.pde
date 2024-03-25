//https://studio.processingtogether.com/sp/pad/export/ro.9eDRvB4LRmLrr 

class Button {
  static final int W = 60, H = 40, TXTSZ = 020;
  static final color BTNC = #00A0A0, HOVC = #00FFFF, TXTC = 250;

  final String label;
  final int x, y, xW, yH;
  color c1;

  boolean isHovering;

  Button(String txt, int xx, int yy) {
    label = txt;

    x = xx;
    y = yy;

    xW = xx + W;
    yH = yy + H;
    
    //this.c1 = c1;
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
