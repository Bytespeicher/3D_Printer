$fa = 1;
$fs = 1;

inner_diam = 42.5;
thickness = 8;
height = 60;
latch_width = 12;
hole_diam = 4;

box_dim = 1.3 * (inner_diam + thickness);


difference() {	

	union(){
		translate([-box_dim/2, -box_dim/2, 0]){
			cube([box_dim, box_dim, height]);
		}
		translate([-latch_width/2, -box_dim/2, height-latch_width/2]){
			cube([latch_width, box_dim, latch_width]);
		}
		translate([0, box_dim/2, height + latch_width/2]){
			rotate([90, 0, 0]){
				cylinder(box_dim, d=latch_width);
			}
		}
	}

	translate([0, box_dim/2, height + latch_width/2]){
			rotate([90, 0, 0]){
				cylinder(box_dim, d=hole_diam);
			}
		}

	translate([0, 0, -10]){
		cylinder(1.4 * (height + latch_width), d=inner_diam);
	}
	difference() {
		translate([0, 0, -10]){
			cylinder(1.4 * (height + latch_width), d = 2 * box_dim);
		}
		translate([0, 0, -11]){
			cylinder(1.5 * (height + latch_width), d = inner_diam + thickness );
		}
	}

}