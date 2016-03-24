show_key = 1;
show_bottom = 1;
show_top = 1;

module pin(pos=[0,0,0], height=5, r1=1, r2=0.75, res=60) {
    translate(pos) {
        cylinder(
            h=height,
            r1=r1,
            r2=r2,
            center=false,
            $fn=res
        );
    };    
}

pin_height = 6;
pin_radius_bottom = 1.2;
pin_radius_top = 0.75;
hole_resolution = 150;
pin_resolution = 60;

if (show_key) {
    // original keychain part
    difference() {
        union() {
            union() {
                difference() {
                    union() {
                        // keychain part
                        translate([6, 24, 0])
                            cylinder(h=2.1, r1=10, r2=10);
                        
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
    translate([-6, 14, -1]) {
        
        union() {
            difference() {
                cube([24, 50, 2]);
                
                // fitting space for original keychain part
                translate([2, 0, 1]) {
                    cube([20, 22, 2]);
                }
                
                // new keychain hole
                translate([12, 40, -1]) {
                    cylinder(h=5, r1=4, r2=4, center=false, $fn=hole_resolution);
                };
            };
            
            // spike through hole in keychain part
            // should hold the key in place
            pin([12, 16, 0], height=pin_height, r1=.75, r2=.65);
            
            // connection pins

            // bottom row
            pin([4.5, 1.5, 0], res=pin_resolution);
            pin([19.5, 1.5, 0], res=pin_resolution);

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
    rotate([0, 180, 0])
    translate([-18, 14, -10]) {
        difference() {
            cube([24, 50, 2]);
            
            // fitting space for original keychain part
            translate([2, 0, 1]) {
                cube([20, 22, 2]);
            }
            
            // new keychain hole
            translate([12, 40, -1]) {
                cylinder(h=5, r1=4, r2=4, center=false, $fn=30);
            };
            
            // spike through hole in keychain part
            // should hold the key in place
            pin([12, 16, 0], height=pin_height, r1=.75, r2=.65);
            
            // bottom row
            pin([4, 1.5, 0], res=pin_resolution);
            pin([20, 1.5, 0], res=pin_resolution);

            // center row
            pin([4, 30, 0], res=pin_resolution);
            pin([20, 30, 0], res=pin_resolution);
            
            // top row
            pin([4, 45, 0], res=pin_resolution);
            pin([20, 45, 0], res=pin_resolution);
        };
    };
}