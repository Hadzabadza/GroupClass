class Collider {
  PVector pos, vel, target;
  int damage, size, speed;

  Collider(PVector position, PVector velocity, int dmg, int sz, int spd) {
    pos = position;
    vel = velocity;
    target = position.get();
    damage = dmg;
    size = sz;
    speed = spd;
  }
  void update () {
    PVector vel2 = PVector.sub (target, pos).normalize();
    vel2.mult(speed);
    pos.add(vel2);
    ellipse(pos.x, pos.y, size, size);
  }
  void MoveInDirection (PVector throughPoint) {
    target = PVector.sub (throughPoint, pos).normalize ();
    target.mult (500000);
    target.add (pos);
  }
}