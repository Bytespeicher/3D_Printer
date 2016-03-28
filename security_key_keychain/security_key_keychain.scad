show_key = 1;
show_bottom = 1;
show_top = 1;
show_cap = 1;
show_cap_back = 1;

module pin(pos=[0,0,0], height=7, r1=2, r2=1.5, res=60) {
    translate(pos) {
        cylinder(
            h=height,
            r1=r1,
            r2=r2,
            center=false,
            $fn=res
        );
    };
};

pin_height = 7;
pin_radius_bottom = 1.2;
pin_radius_top = 0.75;
hole_resolution = 150;
pin_resolution = 60;

if (show_key) {
    // original keychain part
    color([1,1,1,1])
    difference() {
        union() {
            union() {
                difference() {
                    union() {
                        // keychain part
                        translate([6, 26, 0])
                            cylinder(h=2.1, r1=11, r2=11);
                        
                        // USB-Part
                        cube(
                            [12, 16.6, 2.2],
                            center=false
                        );
                    }

                    // remove unused edges from cylinder
                    translate([14.5/2+7, 0, -1])
                        cube([15, 40, 5]);
                    translate([-(14.5/2+10), 0, -1])
                        cube([15, 40, 5]);
                    translate([-20, 15.3, 1.2])
                        cube([50, 25, 5]);
                };
            }
        };
        
        // hole in keychain part
        translate([6, 30, -1])
            cylinder(h=3, r1=.8, r2=.8, center=false, $fn=30);
    };
}

if (show_bottom) {
    // bottom part
    color([0,1,1,0.3])
    translate([-6, 12, -1]) {
        
        union() {
            difference() {
                cube([24, 52, 2]);
                
                // fitting space for original keychain part
                translate([3.5, -0.01, 1]) {
                    cube([17, 24, 2]);
                }
                
                // new keychain hole
                translate([12, 42, -1]) {
                    cylinder(
                        h=5, r1=4, r2=4,
                        center=false, $fn=hole_resolution
                    );
                };
            };
            
            // spike through hole in keychain part
            // should hold the key in place
            pin([12, 18, 0], height=pin_height, r1=.8, r2=.8);
            
            // connection pins

            // bottom row
            pin([4, 4.5, 0], r1=1.8, r2=1.4, res=pin_resolution);
            pin([20, 4.5, 0], r1=1.8, r2=1.4, res=pin_resolution);

            // center row
            pin([4, 30, 0], res=pin_resolution);
            pin([20, 30, 0], res=pin_resolution);
            
            // top row
            pin([4, 45, 0], res=pin_resolution);
            pin([20, 45, 0], res=pin_resolution);
        };
    };
}

if (show_top) {
    // top part
    color([1,0,1,0.3])
    rotate([0, 180, 0])
    translate([-18, 12, -3]) {
        difference() {
            cube([24, 52, 2]);
            
            // fitting space for original keychain part
            translate([3.5, -0.01, 1]) {
                cube([17, 24, 2]);
            }
            
            // new keychain hole
            translate([12, 42, -1]) {
                cylinder(
                    h=5, r1=4, r2=4,
                    center=false, $fn=hole_resolution
                );
            };
            
            // spike through hole in keychain part
            // should hold the key in place
            pin([12, 18, 0], height=pin_height, r1=.8, r2=.8);
            
            // bottom row
            pin([4, 4.5, 0], r1=1.8, r2=1.4, res=pin_resolution);
            pin([20, 4.5, 0], r1=1.8, r2=1.4, res=pin_resolution);

            // center row
            pin([4, 30, 0], res=pin_resolution);
            pin([20, 30, 0], res=pin_resolution);
            
            // top row
            pin([4, 45, 0], res=pin_resolution);
            pin([20, 45, 0], res=pin_resolution);
        };
    };
}

if (show_cap) {
    color([0.5, 0.7, 1, 0.8])
    translate([-8, -5, -5]) {
        difference() {
            cube([28, 28, 10]);
            
            translate([1.9,5,2])
                cube([24.2, 24, 6]);
        }
    }
}

if (show_cap_back) {   
    color([1, 0.7, 0.5, 0.8])
    rotate([0,0,180])
    translate([-20, -70, -5]) {
        difference() {
            cube([28, 47, 10]);
            
            translate([1.9,5,2])
                cube([24.2, 50, 6]);
            
            // new keychain hole
            translate([14, 16, -1]) {
                cylinder(
                    h=28, r1=4, r2=4,
                    center=false, $fn=hole_resolution
                );
            };
        }
    }
}