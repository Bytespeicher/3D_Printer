fan_size = 50;
fan_hole_size = 4;
fan_offset = 8.5;
fan_offset_y = 8;

chimera_size = 30;

wall_thickness = 2;

$fn=30;

use <measurement.scad>

module round_round_edges(size, radius)
{
    $fn=50;
    
    msize = [size[0]-radius*2, size[1]-radius*2, size[2]-radius*2];
    
    translate([radius, radius, radius])
    minkowski() {
        cube(size=[msize[0], msize[1], msize[2]]);
        sphere(r=radius);
    }
}

module cube_round_corners(size, radius) {
    $fn=50;
    
    msize = [size[0]-radius*2, size[1]-radius*2, size[2]];
    mheight = msize[2]-radius < 0 ? 1 : msize[2];
    mcheight = msize[2]-radius < 0 ? msize[2] : msize[2];
    
    translate([radius, radius, 0])
    minkowski() {
        cube(size=[msize[0], msize[1], 1]);
        cylinder(r=radius, h=mcheight);
    }
}

// chimera mount
difference() {
    union() {
        hull() {
            cube_round_corners([chimera_size, chimera_size, 3], 2);
            
            translate([-(fan_size-chimera_size)/2, -(fan_size-chimera_size)+fan_offset_y, fan_offset]) {
                cube_round_corners([fan_size, fan_size, 3], 2);
            }
        }
        
        translate([-25+chimera_size/2, chimera_size-3, 5.5]) {
            difference() {
                cube([50, 18, 7]);
                translate([8, 14.5, -1]) {
                    cylinder(h=9, r=1.5);
                }
                translate([41, 14.5, -1]) {
                    cylinder(h=9, r=1.5);
                }
            }
        }
    }
    
    hull() {
        translate([wall_thickness, wall_thickness, -1]) {
            cube_round_corners([chimera_size-wall_thickness*2, chimera_size-wall_thickness*2, 5], 5);
        }
        
        translate([(fan_size-chimera_size)/2+5, (fan_size-chimera_size)/2, 19]) {
            cylinder(r=fan_size/2, h=5);
        }
    }
    
    // remove everything that wouldn't fit under 
    // the extruder parts to see if it actually fits
    translate([-25+chimera_size/2, chimera_size+6, -1]) {
        cube([50, 9, 6.49]);
    }
    translate([-25+chimera_size/2, chimera_size, -1]) {
        cube([50, 6, 5]);
    }
    
    // Screw holes for fan
    
    // bottom left
    translate([wall_thickness-(fan_size-chimera_size)/2+2, fan_offset_y-2-2*wall_thickness-(fan_size-chimera_size)/2, 0]) {
        cylinder(h=15, r=fan_hole_size/2);
    }

    // bottom right
    translate([fan_size-chimera_size/2+1, fan_offset_y-2-2*wall_thickness-(fan_size-chimera_size)/2, 0]) {
        cylinder(h=15, r=fan_hole_size/2);
    }

    // top left
    translate([wall_thickness-(fan_size-chimera_size)/2+2, fan_offset_y-2+fan_size/2, 0]) {
        cylinder(h=25, r=fan_hole_size/2);
    }
    
    // top right
    translate([fan_size-chimera_size/2+1, fan_offset_y-2+fan_size/2, 0]) {
        cylinder(h=25, r=fan_hole_size/2);
    }
}