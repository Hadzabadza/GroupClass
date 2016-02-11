boolean[] move={false, false, false, false};

void keyPressed() {
  if ((key == 'a')||(keyCode==LEFT)||(key=='A'))  move[0] = true;
  if ((key == 's')||(keyCode==DOWN)||(key=='S'))  move[1] = true;
  if ((key == 'd')||(keyCode==RIGHT)||(key=='D'))  move[2] = true;
  if ((key == 'w')||(keyCode==UP)||(key=='W'))  move[3] = true;
}


void keyReleased() {
  if ((key == 'a')||(keyCode==LEFT)||(key=='A'))  move[0] = false;
  if ((key == 's')||(keyCode==DOWN)||(key=='S'))  move[1] = false;
  if ((key == 'd')||(keyCode==RIGHT)||(key=='D')) move[2] = false;
  if ((key == 'w')||(keyCode==UP)||(key=='W'))  move[3] = false;
  //DEBUG
  if (key == ' ') {
    enemies.add(new Enemy());
  }
  
  if ((key=='r')||(key=='R')) {
    //restarts the game
    if (!player.isAlive())
    {
      player=new Player();
      colliders = new ArrayList<Collider> ();
      enemies = new ArrayList<Enemy> ();
      introTimer=240;
    }
  }
  //DEBUG
  if(key=='x')
  {
    player.health=0;
  }
}

void mousePressed () {
  if (mouseButton==LEFT)
  {
    if (player.ammo>0)
    {
      colliders.add (new Collider(new PVector (player.pos.x, player.pos.y), aim, 5, 10, 3));
      colliders.get (colliders.size()-1).MoveInDirection (aim);
      player.ammo--;
    }
  }

  if (mouseButton==RIGHT)
  {
    //makes the player jump to maxJump distance in direction of cursor, or to cursor if it is closer than maxJump
    player.blink();
  }

  if (introTimer>0)
  {
    //skips the intro
    introTimer=0;
  }
}