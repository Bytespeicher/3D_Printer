// Phone bumper for Cubox X12
// CC BY-SA 

$fn = 60;

// Width of the phone
phone_width = 70;

// Length of the phone
phone_length = 143;

// Height of the phone
phone_height = 8;

// Radius of the main corners (z-direction)
corner_radius = 5;

// Wall strength of the case (original bumper was at .75mm)
wall_strength = 1.5;

// Width of the display
display_width = 62; 

// Length of the display
display_length = 124;
//display_length = 136;

// How far from the top edge the display resides
display_offset = 15;
//display_offset = 4;

// Hole-size for the µUSB port
usb_size = [12, 6];

// µUSB offset (assumed to reside at the top)
usb_offset = [25, 2];

// Hole radius for the µUSB port
audio_jack_radius = 3;

// µUSB offset (assumed to reside at the top)
audio_jack_offset = [20, 2];

camera_size = [11, 11];
camera_offset = [9, 3];

flash_size = [5, 5];
flash_offset = [27, 5.5];

front_camera_radius = 2.5;
front_camera_offset = [45, 5];

speaker_size = [40, 6];
speaker_offset = [15, 129];

front_speaker_size = [14, 3];
front_speaker_offset = [29, 6];

power_button_size = [11, 1.5];
power_button_offset = [29, 3];

volume_button_size = [20, 1.5];
volume_button_offset = [31, 3];

light_sensor_size = [7, 4];
light_sensor_offset = [12, 6];

power_button_size = [11, 3];
power_button_offset = [103, 4];

volume_button_size = [21, 3];
volume_button_offset = [92, 4];

logo = "cat.dxf";

module fillet(length=10, r=2) {
    difference() {
        translate([0, -1, -1])
        cube([length, r+1, r+1]);

        translate([0, r, r])
        rotate([0, 90, 0])
            translate([0, 0, -1])
            cylinder(r=r, h=length+2);
    }
}

module blank_body() {
    difference() {
        // Main body
        hull() {
            // bottom left corner
            translate([phone_height/2, phone_height/2, phone_height/2])
                sphere(r=phone_height/2);

            // bottom right corner
            translate([phone_width-phone_height/2, phone_height/2, phone_height/2])
                sphere(r=phone_height/2);
                
            // bottom left corner
            translate([phone_height/2, phone_length-phone_height/2, phone_height/2])
                sphere(r=phone_height/2);

            // bottom right corner
            translate([phone_width-phone_height/2, phone_length-phone_height/2, phone_height/2])
                sphere(r=phone_height/2);
        }
    }
}

module emerged_button(size=[10, 2]) {
    difference (){
        hull() {
            sphere(r=size[1]/2);
            
            translate([size[0]-size[1]/2, 0, 0])
                sphere(r=size[1]/2);
        }
        
        translate([-size[0], 0, -size[1]])
            cube([size[0]*2, size[1]+1, size[1]+2]);
    }
}

module cat() {
    difference() {
        scale([4.5, 4.5, 5])
            translate([60, -60, 0])
                import (file="cat.stl", center=true);
        
        translate([10, 62, 0])
            cube([20, 20, 10]);
    }
}

difference() {
    scale([(phone_width + wall_strength*2) / phone_width, (phone_length + wall_strength*2) / phone_length, (phone_height + wall_strength*2) / phone_height]) {
        blank_body();
    }

    translate([wall_strength, wall_strength, wall_strength]) {
        blank_body();
        
        // Display cutout
        translate([(phone_width-display_width)/2, phone_length-display_length-display_offset, phone_height-1]) {
            cube([display_width, display_length, wall_strength+2]);
        }
        
        // Front camera cutout
        translate([front_camera_radius+front_camera_offset[0], phone_length-front_camera_radius-front_camera_offset[1], phone_height-1]) {
            cylinder(r=front_camera_radius, h=wall_strength+2);
        }
        
        // Front speaker cutout
        translate([front_speaker_offset[0], phone_length-front_speaker_size[1]-front_speaker_offset[1], phone_height-1]) {
            cube([front_speaker_size[0], front_speaker_size[1], wall_strength+2]);
        }
        
        // Light sensor cutout
        translate([light_sensor_offset[0], phone_length-light_sensor_size[1]-light_sensor_offset[1], phone_height-1]) {
            cube([light_sensor_size[0], light_sensor_size[1], wall_strength+2]);
        }
        
        // µUSB cutout
        translate([usb_offset[0], phone_length-1, usb_offset[1]]) {
            cube([usb_size[0], wall_strength+2, usb_size[1]]);
        }
        
        // Audio jack cutout
        translate([audio_jack_offset[0], phone_length+wall_strength*2, audio_jack_offset[1]+audio_jack_radius]) {
            rotate([90, 0, 0])
                cylinder(r=audio_jack_radius, h=wall_strength+2);
        }
        
        // Speaker cutout
        translate([(phone_width-speaker_size[0])/2, phone_length-speaker_size[1]-speaker_offset[1], -wall_strength*2]) {
            cube([speaker_size[0], speaker_size[1], wall_strength+2]);
        }
        
        // Camera cutout
        translate([phone_width-camera_size[0]-camera_offset[0], phone_length-camera_size[1]-camera_offset[1], -wall_strength*2]) {
            cube([camera_size[0], camera_size[1], wall_strength+2]);
        }
        
        // Flash cutout
        translate([phone_width-flash_size[0]-flash_offset[0], phone_length-flash_size[1]-flash_offset[1], -wall_strength*2]) {
            cube([flash_size[0], flash_size[1], wall_strength+2]);
        }
    }
    
    // power button cutout
    translate([phone_width+wall_strength-0.5, power_button_offset[0], power_button_offset[1]+wall_strength])
    rotate([0, 0, 90])
        emerged_button(size=power_button_size);
    
    // volume button cutout
    translate([volume_button_size[1]-0.5, volume_button_offset[0]+volume_button_size[0], volume_button_offset[1]+wall_strength])
    rotate([0, 0, 270])
        emerged_button(size=volume_button_size);
    
    // cat logo cutout
    translate([21, 65, -4])cat();
}

// power button
translate([phone_width+wall_strength*2-power_button_size[1]/6, power_button_offset[0], power_button_offset[1]+wall_strength])
    rotate([0, 0, 90])
        emerged_button(size=power_button_size);

// volume button
translate([+volume_button_size[1]/6, volume_button_offset[0]+volume_button_size[0], volume_button_offset[1]+wall_strength])
    rotate([0, 0, 270])
        difference() {
            emerged_button(size=volume_button_size);
            translate([volume_button_size[0]/2-1, -volume_button_size[1]/2-1, -volume_button_size[1]/2])
                cube([1, volume_button_size[1], volume_button_size[1]]);
        }