// minimum angle
$fa = 1;
$fs = 1; 

// width of the display assembly
inner_width = 109; // [107.0:0.2:110.0]

// width of the mounts
mount_width = 30.0; // [10.0:100.0]

// length of the mounts
mount_length = 180; // [80.0:180.0]

// height of the mounts
mount_height = 20; // [10.0:30.0]

// depth of the 
cut_depth = 12; // [8.0:0.5:15]



module latch(){
	difference() {
		cube([mount_length, mount_width, mount_height]);
		translate([-1, -1, 1+mount_height/2])
			cube([mount_length+2, cut_depth+1, 1+mount_height/2]);
	}
}

union() {
	translate([65, 0, -30])
		rotate([0, 60, 0])
			cube([35, inner_width, 120], center=true);

	translate([0, inner_width/2, 0])		 
		latch();		
		
	translate([0, -(inner_width/2), 0])
		mirror([0, 1, 0])
			latch();
	}