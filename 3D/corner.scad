$fn=100;
base_thick = 18;
base_headroom = 60;
wall_thick = 2.5;

module corner()
{
    translate([wall_thick*-1,wall_thick*-1,base_headroom *-1 - wall_thick])
    difference()
    {
        cube([50,50,base_thick+wall_thick+base_headroom]);
        translate([10,10,-0.001])
            cube([40.001,40.001,base_headroom+0.001]);
        translate([wall_thick,wall_thick,base_headroom + wall_thick])
            cube([50.001 - wall_thick,50.001-wall_thick,base_thick+0.001]);
        translate([18,32,base_headroom-0.001])
            cylinder(d=4.5,h=wall_thick+0.002);
        translate([32,18,base_headroom-0.001])
            cylinder(d=4.5,h=wall_thick+0.002);
        translate([18,18,base_headroom-0.001])
            cylinder(d=4.5,h=wall_thick+0.002);
        hull()
        {
            translate([10.001,50.001,base_headroom-0.001])
                cylinder(d=0.001,h=wall_thick+0.002);
            translate([50.001,10.001,base_headroom-0.001])
                cylinder(d=0.001,h=wall_thick+0.002);
            translate([50.001,50.001,base_headroom-0.001])
                cylinder(d=0.001,h=wall_thick+0.002);
        }
    }
}

corner();

/*
rotate([90,0,0])
    corner();
translate([-2,0,0,])
    mirror([90,0,0])
        rotate([90,0,0])
            corner();
*/