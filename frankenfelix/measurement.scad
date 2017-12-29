use <Write.scad>

// orientation = orientation of measurement line.  Values {"horizontal","vertical"}
// view = side of object.  Values {"front","left","right","back","top","bottom"}
// length = length of measurement
// text = measurement name (keep short)
// textpos = position of text above or below the line.  Values {"above","below"}
module measurement(orientation,view,length,text,textpos="below",text_size = 2,line_thickness=.15)
{
	if(orientation == "horizontal")
	{
		if(view == "front")
		{
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "back")
		{
			translate([length,0,0])
			rotate([0,0,180])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "left")
		{
			translate([0,length,0])
			rotate([0,0,-90])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "right")
		{
			rotate([0,0,90])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "top")
		{
			rotate([-90,0,0])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "bottom")
		{
			rotate([90,0,0])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
	}
	else if(orientation == "vertical")
	{
		if(view == "front")
		{
			rotate([0,-90,0])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "back")
		{
			rotate([0,-90,180])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "left")
		{
			rotate([0,-90,-90])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "right")
		{
			rotate([0,-90,90])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "top")
		{
			rotate([-90,0,90])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
		else if(view == "bottom")
		{
			translate([0,length,0])
			rotate([90,0,-90])
			measurement_line(length,text,textpos,text_size,line_thickness);
		}
	}
}

module measurement_line(length,text,textpos,text_size,line_thickness)
{
	color("Black")
	{
		cube([length,line_thickness,line_thickness]);
		translate([0,0,-text_size-.5]) 
			cube([line_thickness,line_thickness,text_size*2+1]);
		translate([length-line_thickness,0,-text_size-.5]) 
			cube([line_thickness,line_thickness,text_size*2+1]);

	if(textpos == "above")
	{
		translate([length/2,0,text_size]) rotate([90,0,0]) 
			write(str(text,"=", length),t=text_size,h=2,center=true);
	}
	else
	{
		translate([length/2,0,-text_size]) rotate([90,0,0]) 
			write(str(text,"=", length),t=text_size,h=2,center=true);
	}
	}
}
