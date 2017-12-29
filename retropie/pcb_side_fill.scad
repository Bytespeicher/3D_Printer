$fn = 60;

fill_size = [70, 10, 10];

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
    translate([(fill_size[0]-55)/2+2.5, (fill_size[1]-5)/2+2.5, 0]) {
        cylinder(r=2.5, h=fill_size[1]+5);
        translate([50, 0, 0])
            cylinder(r=2.5, h=fill_size[1]+5);
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