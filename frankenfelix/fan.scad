// OpenSCAD 60mm x 25mm fan model by MiseryBot 
// is licensed under the 
// Creative Commons - Attribution - Share Alike license. 

$fn=30;  //Working
//$fn=720;  //Show off
//=======================================================================================  
module fan(size=60)
  {
  difference()
    {
    linear_extrude(height=25, center = true, convexity = 4, twist = 0)
      difference()
        {
        //overall outside
        square([size,size],center=true);
        //main inside bore, less hub
        difference()
          {
          circle(r=(size-3)/2,center=true);
          //hub. Just imagine the blades, OK?
          circle(r=(size*3/8+1.5)/2,center=true);
          }
        //Mounting holes
        translate([+25,+25]) circle(r=3.4/2,h=25+0.2,center=true);
        translate([+25,-25]) circle(r=3.4/2,h=25+0.2,center=true);
        translate([-25,+25]) circle(r=3.4/2,h=25+0.2,center=true);
        translate([-25,-25]) circle(r=3.4/2,h=25+0.2,center=true);
        //Outside Radii
        translate([+30,+30]) difference()
          {
          translate([-4.9,-4.9]) square([5.1,5.1]);
          translate([-5,-5]) circle(r=5);
          }
        translate([+30,-30]) difference()
          {
          translate([-4.9,-0.1]) square([5.1,5.1]);
          translate([-5,+5]) circle(r=5);
          }
        translate([-30,+30]) difference()
          {
          translate([-0.1,-4.9]) square([5.1,5.1]);
          translate([+5,-5]) circle(r=5);
          }
        translate([-30,-30]) difference()
          {
          translate([-0.1,-0.1]) square([5+0.1,5+0.1]);
          translate([5,5]) circle(r=5);
          }
      } //linear extrude and 2-d difference
    //Remove outside ring
    difference()
      {
      cylinder(r=88/2,h=25-3.6-3.6,center=true);
      cylinder(r=64/2,h=25-3.6-3.6+0.2,center=true);
      }      
    }// 3-d difference

    //Seven Blades
    linear_extrude(height=24, center = true, convexity = 4, twist = -30)
      for(i=[0:6])
        rotate((360*i)/7)
          translate([0,-1.5/2]) #square([(size-3)/2-0.75,1.5]);
  }