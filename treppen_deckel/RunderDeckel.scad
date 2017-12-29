difference()
{
translate([0,0,-89])
sphere(100, $fn=100);
translate([0,0,-200])
cylinder(h = 200, r1 = 100, r2 = 100, center = false, $fn=100);
}