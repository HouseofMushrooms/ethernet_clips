//Resolution of the curves.(Higher = more polygons and higher load time)
$fn = 30;
//What would you like the width to be?(mm)
widthOfBody     = 13;
//What would you like the height to be?(mm)
heightOfBody    = 1.7;
//How many slots do you want?(int)
numberOfSlots   = 10;
//How wide should the slots be?(mm)
widthOfSlots    = 6;
//How wide should the screw hole be?(mm)
widthOfScrew    = 4;
//How wide do you want the seperating walls?(mm)
widthOfWalls    = 5;


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
    }
}


