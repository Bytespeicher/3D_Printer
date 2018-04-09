
$fa = 1;
$fs = 1; 

dim = [80, 100];
head = 7.2 + 4;
thickness = head + 3;
hole_diam = 12;
xstep = hole_diam + 12;
ystep = xstep;


module holes(){
	translate([-2*xstep/2, -3*ystep/2, 0])
		for (x=[0:2]) {
			for (y=[0:3]) {
				translate([x*xstep,y*ystep, 0])
                if (y==0 && (!x%2)) {
                    cylinder(d=7, h=50, center=true);
                    translate([0, 0, 25 - thickness/2 +5  ])
                    cylinder(d=11, h=50, center=true);
                    translate([0, 0, 25 - thickness/2  -48  ])
                    cylinder(d=10, h=50, center=true);
                } else {
					cylinder(d=12, h=50, center=true);
					translate([0, 0, 25 - thickness/2 +3  ])
						if ((x%2 && y%2) || (!x%2 && !y%2)) {
							cylinder(d=18, h=50, center=true);
						} else {
							cube([18, 18, 50], center=true);
						}
				}
			}
		}
}

module screwholes(){
	{
		for (i=[0:4]) {
			translate([dim[0]/2+5,-dim[1]/2 + dim[1]/10 + dim[1]/5*i,0])
				cylinder(r=1.5, h=100, center=true);
		}
		for (i=[0:3]) {
			translate([ -dim[0]/2 + dim[0]/8 + dim[0]/4*i, dim[1]/2+5, 0])
				cylinder(r=1.5, h=100, center=true);
		}
	}
}


difference() {
	union() {
		cube([dim[0], dim[1], thickness], center=true);
		translate([0,0,-thickness/2+ 1.5])
			cube([dim[0]+20, dim[1]+20, 3], center=true);

	}
	holes();
	screwholes();
	mirror([0, 1, 0])
		mirror([1, 0, 0]) 
			screwholes();
}

