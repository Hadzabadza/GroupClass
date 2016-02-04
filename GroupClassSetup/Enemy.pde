class Enemy
{
  PVector playerPos, enemyPos, newEnemyPos,bulletPos,bulletDir,direction;
  int x,y,speed,healt,randomShoot,randomEnemy;
  color enemyColor;
  int axis[] = new int[2];
  boolean shoot=false;
  Enemy()
  {
    axis=initialPos();
    enemyPos = new PVector(axis[0],axis[1]);
    randomEnemy=int(random(1,7));
    if(randomEnemy<4)
    {
      speed=2;
      healt=2;
      enemyColor= color(0,255,0);
    }
    else if(randomEnemy==4)
    {
      speed=1;
      healt=3;
      enemyColor=color(255,0,0);
    }
    else if(randomEnemy==5)
    {
      speed=3;
      healt=1;
      enemyColor=color(0,0,255);
    }
    else if(randomEnemy==6)
    {
    }
  }
  
  void move(int playerX, int playerY)
  {
    playerPos = new PVector(playerX,playerY);
    direction = new PVector(playerPos.x-enemyPos.x,playerPos.y-enemyPos.y);
    direction.normalize();
    newEnemyPos=direction;
    newEnemyPos.mult(speed);
    enemyPos.add(newEnemyPos);
    drawEnemy(enemyPos);
    if(!shoot)
    {
      shoot=!shoot;
      bulletPos=enemyPos;
      bulletDir=direction;
      bulletDir.mult(speed*2);
    }
    else
    {
      shoot=bullet(bulletPos,bulletDir);
    }
  }
  
  private void drawEnemy(PVector enemyPos)
  {
    fill(enemyColor);
    ellipse(enemyPos.x,enemyPos.y,40,40);
  }
  
  private boolean bullet(PVector bulletPos,PVector bulletDir)
  {  
    fill(255);
    bulletPos.add(bulletDir);
    ellipse(bulletPos.x,bulletPos.y,10,10);
    if(bulletPos.x>width || bulletPos.y<0 || bulletPos.y>height || bulletPos.y<0)
    {
      shoot=!shoot;
    }
    return shoot;
  }
  
  private int[] initialPos()
  {
    int x=int(random(0,1));
    int y=int(random(0,1));
    int pos[]=new int[2];
    if(y==1)
    {
      pos[0]=0;
    }
    else
    {
      pos[0]=height;
    }
    if(x==1)
    {
      pos[1]=0;
    }
    else
    {
      pos[1]=width;
    }
    return pos;
  }
  
}