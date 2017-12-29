$fn=120;

r=11.5/2;

module rotate(a)
{
 cx = cos(a[0]);
 cy = cos(a[1]);
 cz = cos(a[2]);
 sx = sin(a[0]);
 sy = sin(a[1]);
 sz = sin(a[2]);
 multmatrix([
  [cy * cz, cz * sx * sy - cx * sz, cx * cz * sy + sx * sz, 0],
  [cy * sz, cx * cz + sx * sy * sz,-cz * sx + cx * sy * sz, 0],
  [-sy,     cy * sx,                cx * cy,                0],
  [0,       0,                      0,                      1]
 ]) children();
}

module cylinder_fillet(r2) {
    difference() {
        translate([0, 0, r2+1])
        rotate([180, 0, 0])
        difference() {
            rotate_extrude(convexity=5)
                translate([r2,0,0])
                    square(r2,r2);
            
            rotate_extrude(convexity=10)
                    translate([r2-1,r2-1,0])
                        circle(r=r2-1);
        }
        
        translate([-25, -25, 0]) cube([50, 50, 2]);
    }
}

translate([0, 0, 2.3]) {
    difference() {
        union() {
            cylinder(h=1.35, r=r+.75);
            cylinder(h=4, r=r);
            difference() {
            rotate_extrude(convexity=5)
                translate([r,0,0])
                    square(r,r);
            
            rotate_extrude(convexity=10)
                    translate([r-1,r-1,0])
                        circle(r=r-1);
        }
        }
        
        translate([0, 0, -1])
            cylinder(h=4, r=5);
    
        //translate([0, 0, -1]) 
        //cylinder_fillet(r-1);
        
    }
}

difference() {
    union() {
        rotate([0, 0, 90])
        translate([-r+.5, -.75/2, 0])
            cube([r*2-1, .75, 6]);

        translate([-r+.5, -.75/2, 0])
            cube([r*2-1, .75, 6]);
    }
    
    cube([4, 4, 11], center=true);
    cube([20, 20, 4.6], center=true);
}

difference () {
    union () {
        translate([-1, 2, 0])
            cube([2, 0.75, 6]);
        translate([-1, -2, 0])
            cube([2, 0.75, 6]);
    }
    cube([3, 20, 1.5], center=true);
}

translate([.5, 0, 0])
rotate([0, 0, 90]) {
    translate([-1.9, 2.5, 0])
        cube([3.8, 1.25, 6]);
    translate([-1.9, -2.5, 0])
        cube([3.8, 1.25, 6]);
}