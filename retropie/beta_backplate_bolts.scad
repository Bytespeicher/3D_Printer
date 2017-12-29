bolt_radius = 2.5;
bolt_height = 10;

head_radius = bolt_radius*1.4;
//head_height = head_radius / 1.4; 
head_height = 2;

$fn = 64;

module bolt() {
    difference () {
        cylinder(h=bolt_height, r=bolt_radius);
        translate([0, 0, 4])
            cylinder(h=bolt_height, r=bolt_radius-1);
    }
}

bolt();

% difference () {
    translate([0, 0, bolt_height/2+head_height])
    cylinder(h=bolt_height/2+head_height, r=bolt_radius);
    
    bolt();
    % bolt();
}