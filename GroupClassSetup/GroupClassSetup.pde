Player player;
ArrayList <Collider> colliders;
PVector aim;

void setup() {
  size(500, 500);
  player=new Player();
  aim = new PVector (width / 2, height / 2);
  colliders = new ArrayList<Collider> ();
}

void draw() {
  background(0);
  for (Collider coll : colliders) {
    coll.update ();
  }
  player.draw();
  player.update();
  for (int i = colliders.size()-1; i >0; i--) {
    if (colliders.get(i).pos.x > width || colliders.get(i).pos.x <0 || colliders.get(i).pos.y > width || colliders.get(i).pos.y <0) {
      colliders.remove(i);
    }
  }
}
void mousePressed () {
  colliders.add (new Collider(new PVector (player.pos.x, player.pos.y), aim, 5, 10, 3));
  aim.set(mouseX, mouseY);
  colliders.get (colliders.size()-1).MoveInDirection (aim);
}