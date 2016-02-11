class Player {
  PVector pos, speed, jumpDir, temp;
  float health, maxJump;
  int ammo, jumps, charge;

  Player() {
    pos=new PVector();
    speed = new PVector();
    jumpDir= new PVector();
    temp = new PVector();
    pos.x=width/2;
    pos.y=height/2;
    maxJump=150;
    health=100;
    ammo=50;
    charge=100;
    jumps=4;
  }

  Player(float x, float y) {
    pos=new PVector();
    speed=new PVector();
    pos.x=x;
    pos.y=y;
  }

  void draw() {
    stroke(255, 0, 0);
    noFill();
    jumpDir=PVector.sub(aim, pos).normalize();
    temp.x=jumpDir.x*maxJump;
    temp.y=jumpDir.y*maxJump;
    ellipse(mouseX, mouseY, 25, 25);
    line(mouseX-12.5, mouseY, mouseX+12.5, mouseY);
    line(mouseX, mouseY-12.5, mouseX, mouseY+12.5);
    line(pos.x, pos.y, mouseX, mouseY);
    if (charge!=100)
    {
      stroke(255, 100, 255, 255*charge/100);
    } else
    {
      if (jumps>0) {
        stroke(100, 100, 255);
      } else
      {
        stroke(255, 0, 0);
      }
    }
    if (dist(pos.x, pos.y, mouseX, mouseY)>temp.mag()) {
      if (jumps>0) {
        line(pos.x-20*jumpDir.y, pos.y+20*jumpDir.x, pos.x-20*jumpDir.y+jumpDir.x*maxJump, pos.y+20*jumpDir.x+jumpDir.y*maxJump);
        line(pos.x+20*jumpDir.y, pos.y-20*jumpDir.x, pos.x+20*jumpDir.y+jumpDir.x*maxJump, pos.y-20*jumpDir.x+jumpDir.y*maxJump);
      } else
      {
        line(pos.x-20*jumpDir.y, pos.y+20*jumpDir.x, pos.x+20*jumpDir.y+jumpDir.x*maxJump, pos.y-20*jumpDir.x+jumpDir.y*maxJump);
        line(pos.x+20*jumpDir.y, pos.y-20*jumpDir.x, pos.x-20*jumpDir.y+jumpDir.x*maxJump, pos.y+20*jumpDir.x+jumpDir.y*maxJump);
      }
    } else
    {
      if (jumps>0) {
        line(pos.x-20*jumpDir.y, pos.y+20*jumpDir.x, mouseX-20*jumpDir.y, mouseY+20*jumpDir.x);
        line(pos.x+20*jumpDir.y, pos.y-20*jumpDir.x, mouseX+20*jumpDir.y, mouseY-20*jumpDir.x);
      } else {
        line(pos.x-20*jumpDir.y, pos.y+20*jumpDir.x, mouseX+20*jumpDir.y, mouseY-20*jumpDir.x);
        line(pos.x+20*jumpDir.y, pos.y-20*jumpDir.x, mouseX-20*jumpDir.y, mouseY+20*jumpDir.x);
      }
    }
    fill(255);
    stroke(0);
    ellipse (pos.x, pos.y, 30, 30);
    if (charge<100)
    {
      charge++;
    }
  }

  void blink() {
    temp.x=jumpDir.x*maxJump;
    temp.y=jumpDir.y*maxJump;
    if ((charge==100)&&(jumps>0)) {
      if (dist(pos.x, pos.y, mouseX, mouseY)>temp.mag()) {
        pos.add(temp);
        charge=0;
        jumps--;
      } else
      {
        pos.x=mouseX;
        pos.y=mouseY;
        charge=0;
      }
    }
  }
  void update() {
    pos.add(speed);
    speed.x*=0.95;
    speed.y*=0.95;
    move();
  }

  void move() {

    if (move[0])
    {
      if (speed.x>=-2.5)
      {
        speed.x-=0.5;
      } else
      {
        if (speed.x>-3)
        {
          speed.x=-3;
        }
      }
    }

    if (move[1]) {
      if (speed.y<=2.5)
      {
        speed.y+=0.5;
      } else
      {
        if (speed.y<3)
        {
          speed.y=3;
        }
      }
    }

    if (move[2]) {
      if (speed.x<=2.5)
      {
        speed.x+=0.5;
      } else
      {
        if (speed.x<3)
        {
          speed.x=3;
        }
      }
    }

    if (move[3]) {
      if (speed.y>=-2.5)
      {
        speed.y-=0.5;
      } else
      {
        if (speed.y>-3)
        {
          speed.y=-3;
        }
      }
    }
  }
  boolean isAlive() {
    if (health>0)
      return true;
    else
      return false;
  }
}