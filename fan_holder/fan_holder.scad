$fn = 128;

size = 6;
hole_size = 4;

difference() {
  union() {
    translate([0, 0, 5]) {
      cylinder(h=50, r=size);
    }
    difference() {
      hull() {
        translate([-size*2+2, 0, 0]) {
          cylinder(r=size+2, h=5);
        }

        translate([size*2-2, 0, 0]) {
          cylinder(r=size+2, h=5);
        }
      }
      
      translate([-size*2+2, 0, -1]) {
        cylinder(h=12, r=hole_size/2);
      }
      
      translate([+size*2-2, 0, -1]) {
        cylinder(h=12, r=hole_size/2);
      }
    }
  }
  translate([0, 0, -1]) {
    cylinder(h=62, r=hole_size/2);
  }
}