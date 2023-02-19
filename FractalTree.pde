private double fractionLength = .8; 
private double fractionWidth = .8;
private double smallestBranch = 64; 
private double branchAngle = .4;
public void setup() 
{   
  size(640,480);
} 
public void draw() 
{   
  background(0);   
  stroke(55, 198, 255);
  stroke(157, 0, 255);
  strokeWeight(8);
  line(320,480,320,380);
  strokeWeight(2);
  line(220, 480, 220, 430);
  strokeWeight(1.75);
  line(440, 480, 440, 440);
  drawBranches(320, 380, 100, 3*Math.PI/2, 8);
  drawBranches(220, 430, 40, 3*Math.PI/2, 2);
  drawBranches(440, 440, 35, 3*Math.PI/2, 1.75);
} 
public void drawBranches(int x,int y, double branchLength, double angle, float branchWidth) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  branchWidth *= fractionWidth;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  strokeWeight(branchWidth);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch)
  {
   drawBranches(endX1, endY1, branchLength, angle1, branchWidth);
   drawBranches(endX2, endY2, branchLength, angle2, branchWidth);
  }
}

public void keyPressed()
{
  if((key == 'e' || key == 'E') && smallestBranch > 5)
  {
    smallestBranch = smallestBranch * .8;
  }
  if((key == 'q' || key == 'Q') && smallestBranch < 80)
  {
    smallestBranch = smallestBranch / .8;
  }
}
