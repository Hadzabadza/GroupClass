Player player;
ArrayList <Collider> colliders;
PVector aim;
ArrayList <Enemy> enemies;
int enemySpawn, countFrames, countEnemies, introTimer;
PVector enemyPos;

void setup() {
  size(700, 700);
  player=new Player();
  aim = new PVector (width / 2, height / 2);
  colliders = new ArrayList<Collider> ();
  enemies = new ArrayList<Enemy> ();
  introTimer=300;
  countFrames=0;
  enemySpawn=120;
  countEnemies=0;
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
    countFrames++;
    if (player.isAlive()) {
      
      background(0);
      for (Collider coll : colliders) {
        fill(255);
        coll.update ();
      }

      for (Enemy enm : enemies) {
        enm.drawEnemy();
        enemyPos = enm.enemyPos();
        if(player.pos.x > enemyPos.x-20 && player.pos.x <enemyPos.x+20 && player.pos.y > enemyPos.y-20 && player.pos.y <enemyPos.y+20)
          {
            player.health=0;
          }
        for (int i = colliders.size()-1; i >0; i--) {
          if (colliders.get(i).pos.x > enemyPos.x-20 && colliders.get(i).pos.x <enemyPos.x+20 && colliders.get(i).pos.y > enemyPos.y-20 && colliders.get(i).pos.y <enemyPos.y+20) {
            colliders.remove(i);
            enm.enemyHit();
            player.ammo++;
          }
        }
      }

      player.draw();
      player.update();
      aim.set(mouseX, mouseY);

      for (int i = colliders.size()-1; i >0; i--) {
        if (colliders.get(i).pos.x > width || colliders.get(i).pos.x <0 || colliders.get(i).pos.y > width || colliders.get(i).pos.y <0) {
          colliders.remove(i);
        }
      }
      for (Enemy ene: enemies) {
    ene.move(player.pos.x,player.pos.y);
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
      for (int i=enemies.size()-1; i>=0; i--) {
        int healt = enemies.get(i).enemyHealt();
        if (healt==0)
        {
          enemies.remove(i);
        }
      }
      //stats display
      textSize(15);
      fill(255);
      textAlign(LEFT);
      text("Bullets: "+player.ammo, 10, 40);
      fill(255, 125+130*sin(radians(frameCount)), 125+130*cos(radians(frameCount)));
      for (int i=0; i<player.jumps; i++)
      {
        ellipse (15+15*i, 15, 15, 15);
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