private double fractionLength = .001; 
private int smallestBranch = 5; 
private double branchAngle = .35;  
double a = 110;
double b = 3*Math.PI/2;
public void setup() 
{   
  size(700,700);    
  noLoop(); 
} 
public void draw() 
{
  background(0);   
  stroke(255,0,0);   
  line(700/2,700,700/2,630);   
  drawBranches(700/2,630, a, b);
  noLoop();
} 
public void keyTyped()
{
  if (key== 'g' && fractionLength < .95)
  {
    fractionLength=fractionLength + 0.003;
    redraw();
  }
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);    
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y); 
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if (branchLength >= smallestBranch)
  {
    drawBranches(endX1,endY1,branchLength,angle1);
    drawBranches(endX2,endY2,branchLength,angle2);
  } 
}