
$fa = 1;
$fs = 1; 

// width (also diameter of rounded side)
width = 30; // [10:50]
// overall height
height = 30; // [10:80]
// overall length
length = 75; // [30:300]
// hole radius
hole = 7.5; // [1.0:0.5:9.0]
//thickness of middle ridge
ridge_t = 7; // [1:0.5:9]
// bottom plate thickness
bottom = 9; // [1:20]
// length of material before round end
setback = 18; // [5:30]
// champfer length
chamfer = 9; // [1:14]

// begin of modell
difference() {

	// main block
	union(){
		cube([length-width/2, width, height]);
		translate([0, width/2, 0]){
			cylinder(height, d = width);
		}
	}

	// hole
	translate([0, width/2, -1]){
			cylinder(height+2, r = hole);
	}
	
	// setback/ridge
	translate([setback, -1, bottom]){
			cube([length, (width-ridge_t+2)/2, height]);
	}
	translate([setback, width-(width-ridge_t)/2, bottom]){
			cube([length, (width-ridge_t+2)/2, height]);
	}

	// chamfer
	chamfer_box = sqrt(2*pow(chamfer,2));
	translate([length - width/2 - chamfer, 0, -1]){
		rotate([0,0,-45]){
			cube([chamfer_box, chamfer_box, bottom + 2]);
		}
	}
	translate([length - width/2 - chamfer, width, -1]){
		rotate([0,0,-45]){
			cube([chamfer_box, chamfer_box, bottom + 2]);
		}
	}

	//ridge slope
	ridge_h = height-bottom;
	ridge_w = length-width/2-setback;
	ridge_l = sqrt(pow(ridge_h,2) + pow(ridge_w, 2));
	translate([setback, width/2 - ridge_t/2 -1, height]){
		rotate([0, atan(ridge_h/ridge_w), 0]){
			cube([ridge_l, ridge_t + 2, ridge_h]);
		}
	}
}

