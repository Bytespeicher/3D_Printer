$fn = 30;

gb_size = [148, 90, 30];
top_size = 1;

backplate_size = [113, 66, 2];
backplate_offset = [6, (gb_size[1]-backplate_size[1])/2, 0];

display_size = [43, 47, 3.1];
display_offset = [19, 20];
display_cover_size = [57, 75, 1];

speaker_radius = 16;
speaker_corner_angle = 20; 
speaker_corner_offset = [20, 35, 0];
cartridge_size = [57, 57, 7.6];

button_radius = 6.5;
button_distance= 3;
button_offset = [52, 7+button_radius, gb_size[2] + backplate_size[2]-3];

dpad_bar_size = [22, 8, 3];
dpad_offset = [36, gb_size[1]-23, gb_size[2]];

show_top = 1; 
show_bottom = 0;

module outline(w=3) {
    difference() {
        offset(w) offset(-w) children();
    }
}

function list_add(list, value) = [for (a = [ 0 : len(list) - 1 ]) list[a]+value ];

module cartridge(a=0) {
  color([.5, .5, .5, .7])
    cube(list_add(cartridge_size, a));
}

module long_button() {
  rotate([0, 0, 30]) {
    linear_extrude(height=4) {
      hull() {
        circle(r=1.5);
        translate([0, 11])
          circle(r=1.5);
      }
    }
  }  
}

module fillet(r=3, h=50) {
  difference() {
    cube([r, h, r]);
    translate([0, h+1, r]) rotate([90, 0, 0]) 
    cylinder(h=h+2, r=r);
  }
}

module half_sphere(r=10) {
  difference () {
    sphere(r=r);
    translate([-r, -r, 0]) {
      cube([r*2, r*2, r]);
    }
  }
}

module cylinder_fillet(r=10, h=5) {
  translate([0, 0, 5]) {
    difference() {
      half_sphere(r=r);
      half_sphere(r=r-2);
    }
  }
}

module gb_body() {
  difference() {
    hull() {
      // speaker round corner
      intersection() {
        translate([0, gb_size[2]/2, gb_size[2]/2+backplate_size[2]])
        rotate([0, 90, 0])
          cylinder(r=gb_size[2]/2, h=speaker_radius);
        
        translate([speaker_radius, speaker_radius, backplate_size[2]])
          cylinder(r=speaker_radius, h=gb_size[2]);
      }
      
      // bottom round edge
      translate([speaker_radius, gb_size[2]/2, gb_size[2]/2+backplate_size[2]]) {
          difference() {
            rotate([0, 90, 0]) {
              cylinder(r=gb_size[2]/2, h=gb_size[0]-speaker_radius);
            }
            // top cylinder fillet
            translate([gb_size[0]-20, 0, 0]) {
              rotate([0, 270, 0])
              cylinder_fillet(r=gb_size[2]/2+3);
            }
          }
        }

      translate([0, gb_size[1]-gb_size[2]/2, gb_size[2]/2+backplate_size[2]]) {
        difference() {
          rotate([0, 90, 0]) {
            cylinder(r=gb_size[2]/2, h=gb_size[0]);
          }
          translate([gb_size[0]-3, 0, 0]) {
            rotate([0, 270, 0])
            cylinder_fillet(r=gb_size[2]/2+3);
          }
          // bottom cylinder fillet
          translate([4, 0, 0]) {
            rotate([0, 90, 0])
            cylinder_fillet(r=gb_size[2]/2+3);
          }
        }
      }

      // main cube
      translate([0, 0, gb_size[2]/2]) {
        translate([0, 0, backplate_size[2]])
        difference() {
            
          linear_extrude(height=gb_size[2]/2) {
            hull() {
              translate([speaker_radius, 0, 0])
                outline() square([gb_size[0]-speaker_radius, gb_size[1]]);
              
              translate([0, speaker_radius, 0])
                outline() square([gb_size[0], gb_size[1]-speaker_radius]);
              
              translate([speaker_radius, speaker_radius, 0])
                circle(r=speaker_radius);
            }
          }
          
        }
      }
    }

    translate([
    gb_size[0]-cartridge_size[0]+1,
    (gb_size[1]-cartridge_size[1])/2-1,
    backplate_size[2]-1]) {
      cartridge(a=2);
    }
    
    rotate([speaker_corner_angle, 0, -60]) {
      translate([-25, -25, 25])
        cube([50, 50, 5]);
    }
    
    // front fillets
    // bottom
    translate([3, 0, gb_size[2]+backplate_size[2]+.1]) rotate([0, 180, 0]) fillet(r=4, h=gb_size[0]);
    
    // left
    translate([0, gb_size[1]-3, gb_size[2]+backplate_size[2]+.1]) rotate([0, 180, 270]) fillet(r=4, h=gb_size[0]);
    
    // top
    translate([gb_size[0]-3, 100, gb_size[2]+backplate_size[2]+.1]) rotate([180, 0, 0]) fillet(r=4, h=gb_size[0]);
    
    // right
    translate([150, 3, gb_size[2]+backplate_size[2]+.1]) rotate([0, 180, 90]) fillet(r=4, h=gb_size[0]);
  }
}

//color([1, 1, 1, 0.6])
difference() {
  
  // create an empty body
  gb_body();
  translate([3, 3, 3+backplate_size[2]])
  scale([0.96, 0.95, 0.8125]) {
    gb_body();
  }
  
  if (!show_top) {
    translate([-1, -1, gb_size[2]+backplate_size[2]-top_size])
    cube([gb_size[0]+2, gb_size[1]+2, top_size+1]);
  }
  
  if (!show_bottom) {
    translate([-1, -1, -1])
    cube([gb_size[0]+2, gb_size[1]+2, gb_size[2]+backplate_size[2]-top_size+1]);
  }
  // display 
  translate([
  gb_size[0] - display_offset[0] - display_size[0],
  gb_size[1] - display_offset[1] - display_size[1],
  .2 +gb_size[2] + backplate_size[2] - display_size[2] - display_cover_size[2]]) {
    cube(display_size);
  }
  
  // display cover
  translate([
  gb_size[0] - display_cover_size[0] - 13,
  (gb_size[1] - display_cover_size[1]) / 2,
  gb_size[2] + backplate_size[2] - display_cover_size[2] + .1
  ]) {
    linear_extrude(height=display_cover_size[2]) {
      offset(2) offset(-2)
      square([display_cover_size[0], display_cover_size[1]]);
    }
  }
  
  // A / B / X / Y buttons
  translate(button_offset)
  rotate([0, 0, 30]) {
    // A
    translate([0, 0, 0]) cylinder(r=button_radius, h=4);
    // X
    translate([button_distance+button_radius*2 - 2, 8, 0]) cylinder(r=button_radius, h=4);
    // B
    translate([0, button_distance+button_radius*2, 0]) cylinder(r=button_radius, h=4);
    // Y
    translate([button_distance+button_radius*2 - 2, 8+button_distance+button_radius*2, 0]) cylinder(r=button_radius, h=4);
  }
  
  // d-pad
  translate(dpad_offset) {
    cube(dpad_bar_size);
    
    rotate([0, 0, 90])
    translate([-7, -15, 0])
      cube(dpad_bar_size); 
  }
  
  // start
  translate([28, 36, gb_size[2] + backplate_size[2] - 3])
    long_button();
  
  // select
  translate([28, 52, gb_size[2] + backplate_size[2] - 3])
    long_button();
}
  
// backplate
if (show_bottom) {
color([0, 1, 1, 0.5])
translate(backplate_offset)
  cube(backplate_size);
}

// cartridge
if (show_bottom) {
translate([
gb_size[0]-cartridge_size[0]+.1,
(gb_size[1]-cartridge_size[1])/2,
backplate_size[2]])
  cartridge();
}








new_display_size = [64, 76.5, 3];
new_display_video = [48, 65];
new_display_offset = 12;

% color([0.2, 0.2, 0.2, 0.3])
  translate([gb_size[0]-new_display_offset-new_display_size[0], (gb_size[1]-new_display_size[1])/2, gb_size[2]-new_display_size[2]])
  cube(new_display_size);
