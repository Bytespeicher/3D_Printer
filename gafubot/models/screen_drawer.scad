// minimum angle
$fa = 1;
$fs = 1; 

// width of the display assembly
inner_width = 130; // [10.0:100.0]

// width of the mounts
mount_width = 30.0; // [10.0:100.0]

// length of the mounts
mount_length = 120; // [80.0:180.0]

// height of the mounts
mount_height = 20; // [10.0:30.0]

// depth of the 
cut_depth = 12; // [8.0:0.5:15]





union() {
	translate([0,inner_width/2,0])
		cube([mount_length, mount_width, mount_height]);
	translate([0,-inner_width/2,0])
		cube([mount_length, mount_width, mount_height]);
	}