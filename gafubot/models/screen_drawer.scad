// minimum angle
$fa = 1;
$fs = 1; 

// width of the display assembly
inner_width = 109; // [107.0:0.2:110.0]

// width of the mounts
mount_width = 30.0; // [10.0:100.0]

// length of the mounts
mount_length = 230; // [80.0:180.0]

// height of the mounts
mount_height = 20; // [10.0:30.0]

// depth of the 
cut_depth = 12; // [8.0:0.5:15]

// number of screws per latch
num_screws = 4; // [1:5]



module latch(){
	difference() {
		cube([mount_length, mount_width, mount_height]);
		translate([-1, -1, 1+mount_height/2])
			cube([mount_length+2, cut_depth+1, 1+mount_height/2]);
		for(a = [0.1 * mount_length:(0.8*mount_length)/(num_screws-1):mount_length])
		{
			translate([a, 0.6*mount_width, -2])
			{
				cylinder(r=4.2, h=mount_height+5, center=false);
				cylinder(r1=8.2, r2=0, h=10, center=false );
			}
		}
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