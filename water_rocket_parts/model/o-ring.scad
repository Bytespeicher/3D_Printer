$fs = 1;
$fa = 1;


inner = 15;
inner_r = 15/2;
outer = 20.5;
outer_r = 20.5/2;
oversize = 0.1;

diameter = (outer_r-inner_r)+2*oversize;

rotate_extrude(convexity = 10)
{
	translate([(inner/2 + (outer_r-inner_r)/2), 0, 0])
	{
		circle(d = diameter, $fn=30);
	}
	translate([(inner/2 + (outer_r-inner_r)/2), -diameter/4, 0])
	{
		square([diameter-0.3*diameter, diameter/2], true);
	}
}

