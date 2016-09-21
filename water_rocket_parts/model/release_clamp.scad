$fa = 1;
$fs = 1;




difference() {	

	union(){
		translate([-35,-35,0]){
			cube([70,70,60]);
		}
		translate([-6,-35,60-6]){
			cube([12,60,12]);
		}
		translate([0, 26,60+6]){
			rotate([90,0,0]){
				cylinder(60, d=12);
			}
		}
	}

	translate([0, 26,60+6]){
			rotate([90,0,0]){
				cylinder(60, d=4);
			}
		}

	translate([0,0,-10]){
		cylinder(1000, d=42.5, center=[0,0,-10]);
	}
	difference() {
		translate([0,0,-10]){
			cylinder(1000, d=200);
		}
		translate([0,0,-11]){
			cylinder(1005, d=42.5+8 );
		}
	}

}