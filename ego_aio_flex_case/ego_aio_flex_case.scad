$fn = 64;

d = 19.5;
h = 100;
o_button = 57.3;
h_button = 7.9;
o_window = 71.9;
w1_window = h_button;
w2_window = 13;
h_window = 18;
wall_strength = 2.5;

difference() {
    cylinder(r=(d/2)+wall_strength, h=h+wall_strength);
    
    translate([0, 0, wall_strength+1]) {
        cylinder(r=(d/2), h=h);
    }
    translate([0, 0, wall_strength]) {
        translate([-h_button/2, -(d+2*wall_strength+2)/2, o_button]) {
            cube([h_button, (d+2*wall_strength+2), h_button]);
        }
        
        translate([-w2_window/2, -(d+2*wall_strength+2)/2, o_window]) {
            cube([w2_window, (d+2*wall_strength+2), h_window]);
        }
    }
}