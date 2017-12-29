$fn = 60;

plate_size = [15.5, 9.5, 2];
hole_size = [12.75, 2.5, 2];
hole_amend_size = [7, 0.5, hole_size[2]];

fix = .0000001;

module fillet(length=10, r=2) {
    difference() {
        cube([length, r, r]);

        translate([0, r, r])
        rotate([0, 90, 0])
            translate([0, 0, -1])
            cylinder(r=r, h=length+2);
    }
}

difference () {
    cube(plate_size);
    
    translate([-.05, -.05, plate_size[2]+1])
    rotate([0, 90, 0])
        fillet(length=plate_size[2]+2, r=2.05);
    
    translate([plate_size[0]+.05, -.05, plate_size[2]+1])
    rotate([0, 90, 90])
        fillet(length=plate_size[2]+2, r=2.05);
}

translate([(plate_size[0]-hole_size[0])/2, plate_size[1]-hole_size[1], plate_size[2]])
    cube(hole_size);

translate([(plate_size[0]-hole_amend_size[0])/2, plate_size[1]-hole_size[1]-hole_amend_size[1], plate_size[2]])
    cube(hole_amend_size);

translate([(plate_size[0]-hole_size[0]-1)/2, plate_size[1]-hole_size[1]-.5, plate_size[2]+hole_size[2]])
    cube([hole_size[0]+1, hole_size[1]+1, 1]);

translate([(plate_size[0]-hole_amend_size[0]-1)/2, plate_size[1]-hole_size[1]-hole_amend_size[1]-.5, plate_size[2]+hole_size[2]])
    cube([hole_amend_size[0]+1, hole_amend_size[1], 1]);