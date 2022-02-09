difference() {
  union() {
    linear_extrude(height=2) offset(r=2.5) shape();
    linear_extrude(height=12) offset(r=0.8) shape();
  }

  linear_extrude(height=12) shape();
}

module shape() {
  scale(10) import(shape, center=true);
}

