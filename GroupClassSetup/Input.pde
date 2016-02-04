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
  
}