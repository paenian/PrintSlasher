//This is a simple test to make slashed STL files.
//Limitations of openscad are things like centering STLs... just... ew.


//command line calling:
// openscad -o cube/cube1.stl -D part="cube" slasher_test.scad &


//Slash variables
slash_length = 30; //this is how thick the slashes are - i.e. how far the print bed advances between prints.
slash_angle = 45; //measured from the bed - how slanty the slices are
slash_width = 180; //size of the printer, basically
slash_height = slash_width;

//Command Line Execution bits
part = "cube";
slash = -2;  //note that due to the eccentricities of OpenSCAD, 0 is the center.  You can grab slices in front or behind, and just go to town from there

if(part == "cube"){
    intersection(){
        translate([0,0,25]) cube(50, center=true);
    
        make_slash(slash, slash_angle, slash_length);
        
    }
}

if(part == "benchy"){
    intersection(){
        translate([-90,-90,-24]) import("/Users/paenian/github/PrintSlasher/test STLs/3dbenchy.stl");
    
        make_slash(slash, slash_angle, slash_length);
        
    }
}

if(part == "shark"){
    intersection(){
        translate([-210,-90,-24]) import("/Users/paenian/github/PrintSlasher/test STLs/ArticulatedHammerheadShark.stl");
        
        make_slash(slash, slash_angle, slash_length);
    }
}



//this makes a single slice centered on the origin, or offset by the slice number
module make_slash(num = slash, angle = slash_angle, length = slash_length, width=slash_width, height=slash_height)
{
    translate([0,num*length,0])
    difference(){
        union(){
            hull(){
                translate([0,0,-.05]) cube([width, length, .1], center=true);
                translate([0,tan(angle)*height,height+.05]) cube([width, length, .1], center=true);
                echo(tan(angle));
            }
        }
    }
}