class Enemy
{
  //class variables
  PVector playerPos, enemyPos, newEnemyPos, bulletPos, bulletDir, direction;
  int x, y, speed, healt, randomEnemy;
  color enemyColor;
  
  //constructor
  Enemy()
  {
    println("hello");
    //gets a random position out of the window for the enemy
    enemyPos = initialPos();
    //gets a random enemy
    randomEnemy=int(random(1,6));
    //50% on standard enemy
    if (randomEnemy<4)
    {
      //enemy's speed
      speed=2;
      //enemy's healt
      healt=2;
      //enemy's color
      enemyColor= color(0, 255, 0);
    }
    //25% on slow but hard enemy
    else if (randomEnemy==4)
    {
      //enemy's speed
      speed=1;
      //enemy's healt
      healt=3;
      //enemy's color
      enemyColor=color(255, 0, 0);
    }
    //25% on fast but easy enemy
    else if (randomEnemy==5)
    {
      //enemy's speed
      speed=3;
      //enemy's healt
      healt=1;
      //enemy's color
      enemyColor=color(0,0,255);
    }
  }
  
  // function to make the enemy move towards the player position
  void move(float playerX, float playerY)
  {
    //store player's position into a PVector variable
    playerPos = new PVector(playerX,playerY);
    //gets the subraction between player's position and enemy's position
    newEnemyPos = new PVector(playerPos.x-enemyPos.x,playerPos.y-enemyPos.y);
    //normalize the vector
    newEnemyPos.normalize();
    //multiplay the vector for the enemy's speed
    newEnemyPos.mult(speed);
    //add the new vector to the enemy's previous position
    enemyPos.add(newEnemyPos);
    //calls the function to draw the enemy
    drawEnemy();
  }

  //function to draw the enemy
  private void drawEnemy()
  {
    //fill with the enemy's color based on type of enemy
    fill(enemyColor);
    //draws the enemy
    ellipse(enemyPos.x, enemyPos.y, 40, 40);
  }
  
  //function to gets the initial position of the enemy
  private PVector initialPos()
  {
    //function variable
    int sides,randomX,randomY,x,y;
    PVector initialPos;
    //gets a random side between the axis
    sides=int(random(0,2));
    //axis x
    if(sides==0)
    {
      //gets a random side between right and left
      randomX=int(random(0,2));
      //right side
      if(randomX==0)
      {
        x=width+150;
        //x=int(random(width,width+150));
      }
      //left side
      else
      {
        x=-150;
      }
      //random y position
      y=int(random(0,height));
    }
    //axis y
    else
    {
      //gets a random side between top and bottom
      randomY=int(random(0,2));
      //bottom
      if(randomY==0)
      {
        y=height+150;
      }
      //top
      else
      {
        y=-150;
      }
      //random x position
      x=int(random(0,width));
    }
    //store the x and y position in a vector and returns the vector
    initialPos= new PVector(x,y);
    return initialPos;
  }
  
  PVector enemyPos()
  {
    return enemyPos;
  }
  
  void enemyHit()
  {
    healt--;
  }
  
  int enemyHealt()
  {
    return healt;
  }
}