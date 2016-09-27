$fs = 1;
$fa = 1;

// inner diameter
inner = 15; // [1:0.1:50]

// outer diameter 
outer = 20.5; // [2:0.1:100]

// extra size added to inner and outer diameter for fitting
oversize = 0.1; // [0.0:0.05:0.5]

// overhang for supportless printing in %
overhang = 30; //[10:5:100]

outer_r = outer/2;
inner_r = inner/2;

diameter = (outer_r-inner_r)+2*oversize;

rotate_extrude(convexity = 10)
{
	translate([(inner/2 + (outer_r-inner_r)/2), 0, 0])
	{
		circle(d = diameter, $fn=30);
	}
	translate([(inner/2 + (outer_r-inner_r)/2), -diameter/4, 0])
	{
		square([diameter*(1-overhang/100), diameter/2], true);
	}
}

