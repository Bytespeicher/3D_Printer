$fs = 1;
$fa = 1;

// inner diameter
inner = 15;

// inner diameter of grove
grove_inner = 20.5; // [1:0.1:50]

// outer diameter of grove
grove_thickness = 3.5; // [2:0.1:100]

// height or thickness
height = 6; // [0.0:0.05:0.5]

// overhang for supportless printing in %
overhang = 3; //[10:5:100]

outer_r = outer/2;
inner_r = inner/2;

grove_outer = grove_inner + 2*grove_thickness;
outer = grove_outer + overhang;

difference() {
	cylinder(height, d=outer);
	translate([0,0,2.5])
		difference() {
			cylinder(height, d=grove_outer);
			cylinder(2.1*height, d=grove_inner, center=true);
		}
	cylinder(2.1*height, d=inner, center=true);
}
