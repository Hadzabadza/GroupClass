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
    text("Press left mouse button to shoot", width/2, height/2-50);
    text("Press right mouse button to jump", width/2, height/2+50);
  } else {
    if (player.isAlive()) {
      background(0);
      for (Collider coll : colliders) {
        fill(255);
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
      //stats display
      textSize(15);
      fill(255);
      textAlign(LEFT);
      text("Bullets: "+player.ammo, 10, 40);
      fill(255, 125+130*sin(radians(frameCount)), 125+130*cos(radians(frameCount)));
      for (int i=0;i<player.jumps;i++)
      {
        ellipse (15+15*i,15,15,15);
      }
    } else
    {
      background (100+155*sin(radians(frameCount)), 50, 50);
      fill(255, 125+130*sin(radians(frameCount)), 125+130*sin(radians(frameCount)));
      textSize(40);
      textAlign(CENTER);
      text("GIT GUD SCRUB", width/2, height/2);
    }
  }
}