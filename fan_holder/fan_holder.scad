$fn = 128;

size = 10;

translate([0, 0, 10]) {
  difference() {

    
  }
}

difference() {
  union() {
    translate([0, 0, 10]) {
      cylinder(h=50, r=size);
    }
    difference() {
      hull() {
        translate([-size*2-5, 0, 0]) {
          cylinder(r=size+2, h=10);
        }

        translate([size*2+5, 0, 0]) {
          cylinder(r=size+2, h=10);
        }
      }
      
      translate([-size*2-5, 0, -1]) {
        cylinder(h=12, r=4);
      }
      
      translate([+size*2+5, 0, -1]) {
        cylinder(h=12, r=4);
      }
    }
  }
  translate([0, 0, -1]) {
    cylinder(h=62, r=4);
  }
}