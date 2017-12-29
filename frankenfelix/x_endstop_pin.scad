carriage_length = 10;
carriage_depth = 5;
carriage_height = 13.5;

pin_length = 8.5;
pin_width = 1.9;
pin_height = 1;

endstop_length = 21;
endstop_width = 3;
endstop_height = 1.5;

endstop_offset = 9.5;

wall_thickness = 2;

difference(){
    union() {
        // the part that fits the extruder carriage
        cube([carriage_length, carriage_depth+wall_thickness+endstop_offset, carriage_height+wall_thickness*2]);
        
        // the part that will hit the endstop
        translate([carriage_length-1, carriage_depth-2+wall_thickness/2+endstop_offset, carriage_height+wall_thickness+.5]) {
            cube([endstop_length, endstop_width, endstop_height]);
        }
        
        translate([carriage_length, carriage_depth-2+wall_thickness/2+endstop_offset, carriage_height+wall_thickness-2]) {
            cube([4, 3, 4]);
        }
    }
    // make the hole in the carriage fit 
    translate([0, -1, wall_thickness])
        cube([carriage_length+2.1, carriage_depth+wall_thickness/2, carriage_height]);
}

difference() {
    translate([-20, 0, 0]) {
        cube([20, carriage_depth+wall_thickness+endstop_offset, carriage_height+wall_thickness*2]);
    }
    
    translate([-21, -1, wall_thickness]) {
        cube([21, carriage_depth+endstop_offset+wall_thickness+2, carriage_height]);
    }
}
// the pin that holds everything in place
translate([carriage_length - pin_height, pin_length/2+wall_thickness/2, carriage_height-1]) {
    rotate([0, 90, 0]) {
        difference () {
            linear_extrude(pin_height) {
                sma = pin_width/2;  // semi-minor axis
                smb = pin_length;  // semi-major axis
                polygon(
                    [ for (a = [0 : 5 : 359]) [ sma * sin(a), smb * cos(a) ] ]
                );
            }
        }
        
    }
}