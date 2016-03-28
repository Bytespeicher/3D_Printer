include <pinheaders.scad>;

RASPBERRY_DIMENSIONS = [56, 85, 1.35];
USB_DIMENSTIONS = [13.3, 17, 16.3];
LAN_DIMENSTIONS = [16, 21.3, 13.4];
rpi_mount_hole_radius = 2;

module raspberry() {
    width = RASPBERRY_DIMENSIONS[0];
    length = RASPBERRY_DIMENSIONS[1];
    height = RASPBERRY_DIMENSIONS[2];

    color([.1, .5, .1, 1]) {
        difference() {
            cube([width, length, height]);
            raspberry_holes();
        }
    }
    
    // 40-pin header for model 2/3
    translate([3.5, 33, 0])
        pin_header(rows=2, cols=20);
    
    // USB ports
    color([.5, .5, .5, 1]) {
        translate([2.7, length-USB_DIMENSTIONS[1]+2, height])
            cube(USB_DIMENSTIONS);
        translate([20.2, length-USB_DIMENSTIONS[1]+2, height])
            cube(USB_DIMENSTIONS);
    }
    
    // LAN port
    color([.8, .8, .8, 1]) {
        translate([37, length-LAN_DIMENSTIONS[1]+2, height])
            cube(LAN_DIMENSTIONS);
    }
    
    translate([width-12, 50, height]) {
        audio_jack();
    }

    translate([width-11.5+1.6, 24, height]) {
        hdmi_jack();
    }
    
    translate([width-4, 6.5, height]) {
       micro_usb_jack();
    }
    
    translate([16.8, 1.8, height]) {
        ribbon_cable_jack();
    }
    
    translate([34, 43.3, height]) {
        ribbon_cable_jack();
    }
    
    translate([20.4, 1, -1.4]) {
        micro_sd_slot();
    }
}

module audio_jack() {
    color([0.3, 0.3, 0.3]) {
        cube([12, 7, 6]);
        
        translate([14.4, 3.5, 3.5])
            rotate([-90,0,90])
                cylinder(h=2.4,r=3);
    }
}

module hdmi_jack() {
    color([.8, .8, .8, 1]) {
        cube([11.5, 15, 6.6]);
    }
}

module micro_usb_jack() {
    color([.8, .8, .8, 1]) {
        cube([5.8, 7.6, 3]);
    }
}

module ribbon_cable_jack() {
    color([.8, .8, .5, 1]) {
        cube([22.3, 4, 5.4]);
    }
}

module micro_sd_slot() {
    color([.8, .8, .8, 1]) {
        cube([13, 14.3, 1.4]);
    }
}

module raspberry_holes(h=2) {
    width = RASPBERRY_DIMENSIONS[0];
    length = RASPBERRY_DIMENSIONS[1];
    height = RASPBERRY_DIMENSIONS[2];
    
    translate([1.5+rpi_mount_hole_radius , 1.5+rpi_mount_hole_radius , -0.1])
        cylinder(h=h, r=rpi_mount_hole_radius, $fn=32);
    
    translate([width-1.5-rpi_mount_hole_radius, 1.5+rpi_mount_hole_radius, -0.1])
        cylinder(h=h, r=rpi_mount_hole_radius, $fn=32);
    
    translate([1.5+rpi_mount_hole_radius, 60+rpi_mount_hole_radius, -0.1])
        cylinder(h=h, r=rpi_mount_hole_radius, $fn=32);
    
    translate([width-1.5-rpi_mount_hole_radius, 60+rpi_mount_hole_radius, -0.1])
        cylinder(h=h, r=rpi_mount_hole_radius, $fn=32);
}

module raspberry_display() {
     translate([3.5, 10, 3.8]) {
         pin_header(rows=2, cols=2, upper=14, male=0);
     }
     
     translate([3.5, 38, 3.8]) {
         pin_header(rows=2, cols=4, upper=14, male=0);
     }
     
     color([0.3, 0.3, 0.3, 0.7])
     translate([0, 0, 17.8])
        cube([55, 85, 7.6]);
}

module test() {
   raspberry();
   raspberry_display();
}