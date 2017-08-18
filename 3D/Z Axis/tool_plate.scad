
use <linear_bearing_holder.scad>
use <nut_holder.scad>
$fn=100;
module tool_plate()
{
    plate_thick=10;
    difference()
    {
        union()
        {
            translate([-40,-48,0])
                cube([80,96,plate_thick]);
            for(i=[-15,15])
            translate([i,-31,plate_thick])
                lbh_dual_inline(l=62);

            /*
            hull()
            {
                translate([-1,-56,0])
                    cube([2,112,2.5]);
                translate([-7,-48,0])
                    cube([14,96,2.5]);
            }
            */
        }
        for(i=[-48.001,31])
            translate([-23,i,2.5])
                cube([46,17.001,plate_thick-2.499]);

        translate([-9,-12.5,plate_thick])
            cube([18,25,20]);
        
        for(i=[-23,-7,7,23])
            for(j=[-27,27])
                translate([i,j,-0.001])
                {
                    cylinder(d=3.5,h=plate_thick+0.002);
                    cylinder(d1=8,d2=0.001,h=4);
                }

        for(i=[-33,33])
            for(j=[-41,41])
            {
                translate([i,j,-0.001])
                {
                    cylinder(d=4.5,h=plate_thick+0.002);
                    cylinder(d=8.1,h=3.5,$fn=6);
                    /*
                    translate([0,-3.5,-0.001])
                    cube([7,7,1]);
                    */
                }
                translate([i,j,plate_thick-4.5])
                    cylinder(d1=0.001,d2=9,h=4.501);
            }
                
    }
    translate([0,-12.5,plate_thick])
        nut_holder();
    // endstop insert
    translate([-1,-38,0])
        cube([2,76,12]);    

}

module bearing_cover()
{
    difference()
    {
        cube([23,62,3]);
        translate([16, 17.5,-0.001])
            cube([23,27,3.002]);
        for(i=[3.5,19.5])
            for(j=[4,58])
                translate([i,j,-0.001])
                    cylinder(d=3.5,h=3.002);
    }
}

tool_plate();

/*
translate([-15 - 11.5, -31,10 + 15.5 + 1])
{
    bearing_cover();
}
*/
/*
bearing_cover();
*/