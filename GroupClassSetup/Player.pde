class Player {
  PVector pos, speed;
  float health;

  Player() {
    pos=new PVector();
    speed = new PVector();
    pos.x=width/2;
    pos.y=height/2;
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
    ellipse(mouseX, mouseY, 25, 25);
    line(mouseX-12.5, mouseY, mouseX+12.5, mouseY);
    line(mouseX, mouseY-12.5, mouseX, mouseY+12.5);
    line(pos.x, pos.y, mouseX, mouseY);
    fill(255);
    stroke(0);
    ellipse (pos.x, pos.y, 30, 30);
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
}