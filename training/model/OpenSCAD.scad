
// width
width = 30; // [10:50]
height = 30;
length = 75;
hole = 7.5;
ridge = 7;
bottom = 9;
setback = 18;

difference() {

	union(){
		cube([length-width/2, width, height]);
		translate([0, width/2, 0]){
			cylinder(height, d = width);
		}
	}

	translate([0, width/2, -1]){
			cylinder(height+2, r = hole);
	}
	
	translate([setback, -1, bottom]){
			cube([length, (width-ridge+2)/2, height]);
	}
	translate([setback, width-(width-ridge)/2, bottom]){
			cube([length, (width-ridge+2)/2, height]);
	}
}