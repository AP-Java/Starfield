

Particle[] stars = new Particle[500];
void setup()
{
	size(900, 900);
 
  noStroke();
 for (int i = 2; i < stars.length; i = i +2) {
   stars[i] = new NormalParticle();
   stars[i+1] = new OddballParticle();
 }
 stars[1] = new JumboParticle();
}
void draw()
{
 background(0);
 for (int i = 1; i < stars.length; i++)
 {
   stars[i].move();
   stars[i].show();
 }
}
class NormalParticle implements Particle
{
 public double myX, myY, mySpeed, myAngle, mySize;
 public int col;
 NormalParticle()
 {
   myX = 450;
   myY = 450;
   mySpeed = (Math.random() * 4) + 1;
   myAngle = (Math.random() * (2 * Math.PI));
 }
 public void move() {
   myY += mySpeed/100;
   mySize = 20;
   if (myY > 900)
   {
     myY = (Math.random()*900);
     myX = myX + mySpeed*cos((float)(myAngle));
     myY = myY + mySpeed*sin((float)(myAngle));
     if ((myX > 900 || myX < 700) || (myY > 900 || myY < 700)) {

       myAngle+=0.025;

     }
   }
 }
 public void show() {
   fill(138, 2, 0);
   rotate((float)(myAngle));
   ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
 }
}
interface Particle
{
 public void move();
 public void show();
}
class OddballParticle implements Particle
{

 public double myX, myY, mySpeed, myAngle, mySize;
 public int col;
 {
   myX = 450;
   myY = 450;
   mySpeed = (Math.random() * 7) + 1;
   myAngle = (Math.random() * (2 * Math.PI));
 }
 public void move() {
   myY += mySpeed;
   mySize = 10;
   if (myY >450)
   {
     myY = (Math.random()*900);
     myX = myX + mySpeed*cos((float)(myAngle));
     myY = myY + mySpeed*sin((float)(myAngle));
     myAngle+=0.05;
     mySize = 10;
   }
 }
 public void show() {
   fill(255);
   rotate((float)(myAngle));
   ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
 }
}
class JumboParticle extends NormalParticle
{
 public void show()
 {
   mySize = 1000;
   fill(255);
   ellipse(0,0,(float)mySize,(float)mySize);
 }
}

