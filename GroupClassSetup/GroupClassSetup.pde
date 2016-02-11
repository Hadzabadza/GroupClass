Player player;
ArrayList <Collider> colliders;
PVector aim;
ArrayList <Enemy> enemies;
int enemySpawn, countFrames, countEnemies, introTimer;


void setup() {
  size(700, 700);
  player=new Player();
  aim = new PVector (width / 2, height / 2);
  colliders = new ArrayList<Collider> ();
  enemies = new ArrayList<Enemy> ();
  introTimer=300;
}

void draw() {
  
  if (introTimer>0) {
    //displays intro text
    background(250*introTimer/420);
    introTimer--;
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("Press left mouse button to shoot",width/2,height/2-50);
    text("Press right mouse button to jump",width/2,height/2+50);
  } else {
    background(0);
    for (Collider coll : colliders) {
      coll.update ();
    }
    
    for (Enemy enm : enemies) {
      enm.drawEnemy();
    }
    
    player.draw();
    player.update();
    aim.set(mouseX, mouseY);
    
    for (int i = colliders.size()-1; i >0; i--) {
      if (colliders.get(i).pos.x > width || colliders.get(i).pos.x <0 || colliders.get(i).pos.y > width || colliders.get(i).pos.y <0) {
        colliders.remove(i);
      }
    }
    
    if (countFrames==enemySpawn)
    {
      //reset the frame counted
      countFrames=0;
      //50% on spawing the enemy
      int randomSpawn=int(random(0, 2));
      //enemy spawns
      if (randomSpawn==1)
      {
        //add enemy class
        enemies.add(new Enemy());
        //count the enemy spawned
        countEnemies++;
      }
      //every 10 spawned enemy the time lapse between the spawns gets reduced
      if (countEnemies==10)
      {
        //reset the count spawned enemys
        countEnemies=0;
        //lower the frames to spawn
        enemySpawn-=10;
      }
    }
  }
}

void mousePressed () {
  if (mouseButton==LEFT)
  {
    colliders.add (new Collider(new PVector (player.pos.x, player.pos.y), aim, 5, 10, 3));
    colliders.get (colliders.size()-1).MoveInDirection (aim);
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