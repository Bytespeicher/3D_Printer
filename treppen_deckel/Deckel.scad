translate([0,0,14])
cylinder(h = 1, r1 = 88/2, r2 = 88/2, center = false, $fn=100);

translate([0,0,6])
difference()
{
cylinder(h = 8, r1 = 78.5/2, r2 = 78.5/2, center = false, $fn=100);
cylinder(h = 14, r1 = 75/2, r2 = 75/2, center = true, $fn=100);
};

difference()
{
cylinder(h = 6, r1 = 75/2, r2 = 78.5/2, center = false, $fn=100);
cylinder(h = 14, r1 = 75/2, r2 = 75/2, center = true, $fn=100);
};