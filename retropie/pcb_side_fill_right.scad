$fn = 60;

fill_size = [70, 10, 10];

pin_radius = 3;
pin_height = 2;

module fillet(length=10, r=2) {
    difference() {
        cube([length, r, r]);

        translate([0, r, r])
        rotate([0, 90, 0])
            translate([0, 0, -1])
            cylinder(r=r, h=length+2);
    }
}


module pins() {
    translate([(fill_size[0]-50-pin_radius*2)/2+pin_radius, (fill_size[1]-pin_radius*2)/2+pin_radius, 0]) {
        cylinder(r=pin_radius, h=fill_size[1]+pin_height);
        translate([50, 0, 0])
            cylinder(r=pin_radius, h=fill_size[1]+pin_height);
        }
}

difference() {
    union () {
        difference() {
            cube(fill_size);
            
            translate([-1, fill_size[1]+.0001, fill_size[1]])
            rotate([180, 0, 0])
            fillet(length=fill_size[0]+2, r=fill_size[1]);
        }

        pins();
    }
    
    translate([-1, -1, -1])
        cube([fill_size[0]+2, fill_size[1]+2, 4]);
}

translate([fill_size[0]-27, 0, 3])
cube([15, 13, 3.5]);