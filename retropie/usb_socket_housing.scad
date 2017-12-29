usb_size = [13.5, 6.5, 12];
housing_size = [16, 9, 10.5];

hole_depth = 0.4;

difference() {
    union() {
        cube(housing_size);
        
        translate([hole_depth, -1.4, 0])
            cube([housing_size[0]-hole_depth*2, 1.5, 4]);
    }
    
    translate([(housing_size[0]-usb_size[0])/2, (housing_size[1]-usb_size[1])/2, -1])
            cube(usb_size);
    
    translate([-1, housing_size[1]-hole_depth, 1])
        cube([housing_size[0]+2, hole_depth+.1, 3]);
    
    translate([-.1, 0, 1])
        cube([hole_depth+.1, housing_size[1]+2, 3]);
    
    translate([housing_size[0]-hole_depth, -1, 1])
        cube([hole_depth+.1, housing_size[1]+2, 3]);
}
