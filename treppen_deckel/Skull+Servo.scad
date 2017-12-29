/*rotate(a=[90,0,0])
translate([-8,15.5,-50])
cylinder(h = 100, r1 = 2, r2 = 2, center = false);
*/
difference()
{
    translate([-50,46,66.7])
    scale([0.5,0.5,0.5])
    import("leftpincer.stl", convexity=3);
    
    translate([-50,-50,-100])
    cube(100);
}
difference()
{
    difference()
    {
        translate([4.7,0,31.5])
        rotate(a=[90,-115,180])
        import("T-RexSkull_Skull_fixed.stl", convexity=3);
        
        
        translate([-10,-5,26])
        rotate(a=[90,-115,180])
        scale([2,1.5,])
        cube(20);
    }
    
    translate([-50,-50,-100])
    cube(100);
}
