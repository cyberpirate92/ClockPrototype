float pulse = 0, pulse1 = 0, pulse2 = 0;
float cx, cy, tx, ty;
float x, y, xx, yy, xxx, yyy;
float iRadius = 50, oRadius = 70;
int hourTickDelta = 4;

class _Point
{
  public int x,y;
  public _Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  public _Point(float x, float y) {
    this.x = (int) x;
    this.y = (int) y;
  }
}

void setup() {
  size(500, 500);  
  background(0);
  frameRate(30);
  
  // center of both the inner and outer circles
  cx = 250;
  cy = 250;
}

void draw() {
  _Point lastHourTick = null;
  background(127,217,40);
  stroke(0);
  fill(255,255,255);
  ellipse(cx,cy,oRadius,oRadius);
  
  // drawing 60 ticks along the outer circle's circumference, towards the center
  for(int i=0;i<61;i++) {
    stroke(0);
    if(i%5 == 0) {
      tx = (cx + oRadius * cos(radians(i*6)));
      ty = (cy + oRadius * sin(radians(i*6)));
      if(lastHourTick != null) {
        line(lastHourTick.x,lastHourTick.y,tx,ty);
      }
      lastHourTick = new _Point(tx,ty);
      strokeWeight(2);
    }
    else {
      strokeWeight(1);
      line(cx,cy,(cx + (oRadius-hourTickDelta) * cos(radians(i*6))),(cy + (oRadius-hourTickDelta) * sin(radians(i*6))));
    }
    line(cx, cy, tx, ty);
  }
  
  fill(255,255,255);
  stroke(255);
  strokeWeight(1);
  ellipse(cx,cy,iRadius*2,iRadius*2);
  
  x = cx + iRadius * cos(radians(pulse % 360));
  y = cy + iRadius * sin(radians(pulse % 360));
  xx = cx + iRadius * cos(radians(pulse1 % 360));
  yy = cy + iRadius * sin(radians(pulse1 % 360));
  xxx = cx + iRadius * cos(radians(pulse2 % 360));
  yyy = cy + iRadius * sin(radians(pulse2 % 360));
 
  // seconds hand
  stroke(0,255,0);
  strokeWeight(2);
  line(cx,cy,x,y);
  
  // minutes hand
  stroke(255,0,0);
  strokeWeight(2);
  line(cx,cy,xx,yy);
  
  // hours hand
  stroke(0,0,255);
  strokeWeight(3);
  line(cx,cy,xxx,yyy);
  
  
  pulse+=6;
  if(pulse%360 == 0) {
    pulse1+=6;
  }
  if(pulse1%360 == 0) {
    pulse2+=6;
  }
  //delay(50);
}