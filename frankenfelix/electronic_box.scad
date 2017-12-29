/* [Body Parameters] */
// Body Width
box_width = 100;

// Body Length
box_length = 170;

// Body Height
box_height = 90;

// Wall Thickness
wall_thickness = 3;

// Fan Size
fan_size = 80;

// Fan Mounting Hole Size
fan_hole_size = 4;

// Number of holes for hot air to exit
hot_air_hole_count = 6;
 
// Size of the hole for the power button
power_button_size = 15;

// Size of cable exits
cable_exit_size = 8;

// Space between cable exits
cable_exit_spacing = 30.8;

// Cable exit for spiral-wrapped cable(round)
round_cable_exit_size = 12;

// 
round_cable_exit_offset = 10;

include <arduino.scad>
include <raspberry.scad>
include <fan.scad>
include <fan_grill.scad>

/* [hidden] */
ARDUINO_TYPE = DUE;
arduinoDimensions = boardDimensions( ARDUINO_TYPE );
arduino_offset = 10;

// show parts that will not be printed like
// the arduino, RPi or the fan
show_eye_candy = 0;

/**
 *
 * Parametric fan mount. This fan is intended to cool drivers
 * on the board and should be sized accordingly.
 * 
 */
module fanduct() {
    translate([box_width+1, box_length-50, 0])
    rotate(90) {
        fan_rotation = [270, 0, 0];
        fan_radius = fan_size/2;
        
        // centered hole for fan
        translate([0,0,box_height/2])
        rotate(fan_rotation)
            cylinder(h=wall_thickness+2, r=fan_radius); 
        
        // holes for mounting the fan
        fan_hole_base_x = 0;
        fan_hole_base_y = box_height/2;
        
        // bottom left hole
        translate([fan_hole_base_x - fan_radius + fan_hole_size, 0, fan_hole_base_y - fan_radius + fan_hole_size]) {
            rotate(fan_rotation)
                cylinder(h=wall_thickness+1, r=fan_hole_size/2); 
        }
        
        // bottom right hole
        translate([fan_hole_base_x + fan_radius - fan_hole_size, 0, fan_hole_base_y - fan_radius + fan_hole_size]) {
            rotate(fan_rotation)
                cylinder(h=wall_thickness+2, r=fan_hole_size/2); 
        }
        
        // top left hole
        translate([fan_hole_base_x - fan_radius + fan_hole_size, 0, fan_hole_base_y + fan_radius - fan_hole_size]) {
            rotate(fan_rotation)
                cylinder(h=wall_thickness+1, r=fan_hole_size/2); 
        }
        
        // top right hole
        translate([fan_hole_base_x + fan_radius - fan_hole_size, 0, fan_hole_base_y + fan_radius - fan_hole_size]) {
            rotate(fan_rotation)
                cylinder(h=wall_thickness+2, r=fan_hole_size/2); 
        }
    }
}


// hot air exit
module hot_air_holes() {
    part_width = fan_size / hot_air_hole_count;
    
    translate([0,box_length-fan_size-part_width*2,10]) {
        for (i = [1:hot_air_hole_count]) {
            translate([0,i*part_width,0]) {
                cube([wall_thickness+1,part_width/2,box_height/2-10]);
            }
            translate([0,i*part_width,(box_height-20)/2+10]) {
                cube([wall_thickness+1,part_width/2,box_height/2-20]);
            }
        }
    };
}

module cover_screw_hole(position, rotation) {
    translate(position)
    rotate(rotation)
    rotate([0, 0, 225]) {
        translate([-5, -5, -10])
        difference() {
            cube([10, 10, 10]);
            
            rotate([0, -45, 0]) {
                translate([-15, -5, -5])
                    cube([20, 20, 10]);
            }
            
            rotate([0, 0, 45]) {
                translate([pow(10, 1/2)*2+wall_thickness, -10, -1])
                    cube([10, 20, 12]);
            }
            
            rotate([0, 0, -45]) {
                translate([wall_thickness, 0, -1])
                    cube([10, 20, 12]);
            }
            
            translate([2, 5, 7])
                cylinder(h=5, r=.8, $fn=40);
        }
        
    }
}

module empty_body() {
    difference() {
        // the original box
        cube([box_width, box_length, box_height]);
        
        // the space inside the box
        translate([wall_thickness, wall_thickness, -1])
            cube([box_width-2*wall_thickness,box_length-2*wall_thickness,box_height+2]);

        fanduct();
        hot_air_holes();
    
        // Arduino USB hole
        translate([arduinoDimensions[0]+wall_thickness+1+arduino_offset, box_length-wall_thickness, 2+wall_thickness]) {
            rotate([0,0,180]) components(DUEMILANOVE, USB);
        }
        
        // Arduino power input hole
        translate([arduinoDimensions[0]+wall_thickness+1+arduino_offset, box_length, 2+wall_thickness]) {
            rotate([0,0,180]) components(DUEMILANOVE, POWER);
        }
        
        // Power button hole
        translate([box_width-power_button_size/2-10, wall_thickness+1, box_height-power_button_size/2-10])
            rotate([90, 0, 0])
                cylinder(h=wall_thickness+2, r=power_button_size/2);
        
        // Status LED holes
        led_size = 7.8;
        translate([box_width-led_size/2-power_button_size-20, wall_thickness+1, box_height-led_size/2-10]) {
            rotate([90, 90, 0]) {
                cylinder(h=wall_thickness+1, r=led_size/2);
            }
        }
        translate([box_width-led_size/2-power_button_size-led_size-25, wall_thickness+1, box_height-led_size/2-10]) {
            rotate([90, 90, 0]) {
                cylinder(h=wall_thickness+1, r=led_size/2);
            }
        }
        
        // Cable exits
        translate([-1, 15, box_height-30]) {
            cube([wall_thickness+2, cable_exit_size, 30]);
            translate([0, cable_exit_spacing+cable_exit_size, 0]) {
                cube([wall_thickness+2, cable_exit_size, 30]);
            }
        }
        
        // Round spiral-wrapped cable exit
        translate([-1, 15+cable_exit_spacing+cable_exit_size*2+round_cable_exit_size, box_height-round_cable_exit_size]) {
            cube([wall_thickness+2, round_cable_exit_size, 15]);
            
            translate([-1, round_cable_exit_size/2, -1])
            rotate([0, 90, 0])
                cylinder(r=round_cable_exit_size/2, h=wall_thickness+2);
        }
        
        // mounting rivet holes
        translate([10, wall_thickness+1, 10]) {
            rotate([90, 90, 0]) {
                cylinder(h=wall_thickness+2, r=2.5);
            }
        }
        translate([10, box_length+1, 10]) {
            rotate([90, 90, 0]) {
                cylinder(h=wall_thickness+2, r=2.5);
            }
        }
    }

    cube();

    // top cover support
    translate([wall_thickness, box_length-arduinoDimensions[1]-2, box_height-wall_thickness*2]) {
        cube([box_width-2*wall_thickness, 5, wall_thickness]);
        
        translate([-wall_thickness, 0, -box_height])
        difference() {
            cube([box_width, 5, box_height]);
            translate([(box_width)/2, 5, (box_width-wall_thickness*2-5)/2])
                rotate([90,0,0])
                    cylinder(h=5, r=(box_width-wall_thickness)/2);
            cube([box_width, 5, box_height/2+1]);
        }
        
    }
    
    // screw holes for top cover
    cover_screw_hole([wall_thickness, wall_thickness, box_height-wall_thickness]);
    cover_screw_hole([box_width-wall_thickness, wall_thickness, box_height-wall_thickness], [0, 0, 90]);
    cover_screw_hole([box_width-wall_thickness, box_length-wall_thickness, box_height-wall_thickness], [0, 0, 180]);
    cover_screw_hole([wall_thickness, box_length-wall_thickness, box_height-wall_thickness], [0, 0, 270]);
    
    // mounting for the arduino
    // this is a vast improvement over the original felix 
    // housing, where the arduino just lay on top of the 
    // power supply, which was neither save(shorting pins on 
    // the metal) nor stable(plugging in the USB could force 
    // the arduino inside the box)
    arduino_mount();
}

module arduino_mount() {
    union() {
        translate([arduinoDimensions[0]+wall_thickness+1+arduino_offset, box_length-wall_thickness, 0]) {
            rotate([0,0,180])
                bumper(ARDUINO_TYPE);
        }
        
        translate([0,box_length-arduinoDimensions[1]-2,0])
            cube([box_width, 5, 2]);
    }
}

module arduino_dummy() {

    // dummy arduino
    translate([arduinoDimensions[0]+wall_thickness+1+arduino_offset, box_length-wall_thickness, wall_thickness]) {
        rotate([0,0,180]) {
            arduino(ARDUINO_TYPE);
        }
    }
}
   
module top_cover_base() {
    color([0, 1, 1, 0.5])
        cube([box_width-2.1*wall_thickness, box_length-2.1*wall_thickness, wall_thickness]);
}

module top_cover() {
    translate([wall_thickness, wall_thickness, box_height-wall_thickness]) {

        // if the raspberry pi fits on top, create holes, etc.
        if (box_width > (RASPBERRY_DIMENSIONS[1] + 2*wall_thickness)) {
            difference() {
                union() {
                    top_cover_base();
                    
                    // screw sockets for raspberry pi
                    translate([(box_width-(wall_thickness*2)-RASPBERRY_DIMENSIONS[1])/2, RASPBERRY_DIMENSIONS[0]+5, 3]) {
                        rotate([0,0,270]) {
                            raspberry_holes(h=4, r=4);
                        }
                    }
                    
                    // RPi case
                    difference() {
                        cube([box_width-wall_thickness*2, RASPBERRY_DIMENSIONS[0]+wall_thickness*2, 35]);
                        translate([wall_thickness, wall_thickness, 0]) {
                            cube([box_width-wall_thickness*4, RASPBERRY_DIMENSIONS[0], 36]);
                        }
                    }
                }
            
                translate([(box_width-(wall_thickness*2)-RASPBERRY_DIMENSIONS[1])/2, RASPBERRY_DIMENSIONS[0]+5, 0]) {
                    rotate([0,0,270]) {
                        raspberry_holes(h=wall_thickness+6);
                    }
                }
            }

            if (show_eye_candy) {
                % translate([(box_width-(wall_thickness*2)-RASPBERRY_DIMENSIONS[1])/2, RASPBERRY_DIMENSIONS[0]+5, wall_thickness+4]) {
                    rotate([0,0,270]) {
                        raspberry();
                        raspberry_display();
                    }
                }
            }
        } else {
            top_cover_base();
        }
    }
    
}

color([.3, .7, 1, 0.5]) {
    render(100) {
        empty_body();
    }  
}

% top_cover();

% translate([box_width+1, box_length-50, 39+wall_thickness*2]) {
    rotate([270, 0, 90]) {
        color([0.2, 0.5, .5, 0.6]) {
            fan_grill(size=fan_size);
        }
    }
}

if (show_eye_candy) {
    % arduino_dummy();

    % color([0, 0.7, 0.2, 0.3]) {
        translate([box_width-16, box_length-50, fan_size/2+wall_thickness*2]) {
            rotate([0, 90, 0]) {
                fan(size=fan_size);
            }
        }
    }
}