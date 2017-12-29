module bottle_ring(z=h, h=5)
{
    translate([3,-20,z])
        cube([3,60,h]);
    
    difference() {
        translate([0,-20,z])
            cube([3,60,h]);
        translate([0,30,z])
            cube([3,3,h]);
        translate([0, -13,z])    
            cube([3,3,h]);
    }
    
    difference(){
        translate([25,10,z])
            cylinder(h, r1 = 25, r2 = 25, center = false);
        translate([29,10,z])
            cylinder(h, r1 = 23, r2 = 23, center = false);
    }
}
module bottle_holder()
{
    cube([40,20,2]);
    cube([5,20,100]);
    
    bottle_ring(70);    
    bottle_ring(50);    
    bottle_ring(30);
    bottle_ring(10);
    
}

bottle_holder();