//Resolution of the curves.(Higher = more polygons and higher load time)
$fn = 30;
//What would you like the width to be?(mm)
widthOfBody     = 13;
//What would you like the height to be?(mm)
heightOfBody    = 9;
//How many slots do you want?(int)
numberOfSlots   = 10;
//How wide should the slots be?(mm)
widthOfSlots    = 6;
//How wide should the screw hole be?(mm)
widthOfScrew    = 4;
//How wide do you want the seperating walls?(mm)
widthOfWalls    = 5;

module Hexagon(cle,h)
{
	angle = 360/6;		// 6 pans
	cote = cle * cot(angle);
	echo(angle, cot(angle), cote);
	echo(acos(.6));

	union()
	{
		rotate([0,0,0])
			cube([cle,cote,h],center=true);
		rotate([0,0,angle])
			cube([cle,cote,h],center=true);
		rotate([0,0,2*angle])
			cube([cle,cote,h],center=true);
	}
}

function cot(x)=1/tan(x);



lengthOfBody    = (widthOfBody) + ( widthOfSlots * numberOfSlots ) + ( widthOfWalls * ( numberOfSlots - 1 ) );
difference(){
    union(){
        cube([widthOfBody, lengthOfBody, heightOfBody]);
        translate([ widthOfBody / 2, 0, 0]){
            cylinder( d = widthOfBody, h = heightOfBody );
            translate([ 0, lengthOfBody, 0]){
                cylinder( d = widthOfBody, h = heightOfBody );
            }
        }
    }
    union(){
        translate([ widthOfBody / 2, 0, -1 ]){
            cylinder( d = widthOfScrew, h = heightOfBody + 2 );
            translate([ 0, lengthOfBody, 0]){
                cylinder( d = widthOfScrew, h = heightOfBody + 2 );
            }
        }
        translate([ widthOfBody / 2, 0, heightOfBody - ( heightOfBody / 6 ) + 0.01]){
            Hexagon(cle=6,h=4);
            translate([ 0, lengthOfBody, 0]){
                Hexagon(cle=6,h=4);
            }
        }
        for( i = [ 1 : numberOfSlots ] ){
            translate([-1, ( ( widthOfBody / 2 ) ) + ( ( i - 1 ) * widthOfWalls ) + ( ( i - 1) * widthOfSlots ),-1]){
                cube( [ 2 + widthOfBody, widthOfSlots, 1 + ( widthOfSlots / 2 ) ] );
                
                translate([0, widthOfSlots / 2, widthOfSlots / 1.5]){
                    rotate( a = [ 0, 90, 0 ] ){
                        cylinder( d = widthOfSlots, h = 2 + widthOfBody );
                    }
                }
            }
        }
    }
}


