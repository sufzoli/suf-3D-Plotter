$fn=100;

module y_endstop_insert()
{
    difference()
    {
        hull()
        {
            translate([-10,7.5,0])
                cylinder(d=15,h=2.5);
            translate([10,7.5,0])
                cylinder(d=15,h=2.5);
        }
        translate([-10,7.5,-0.001])
            cylinder(d=3.5,h=2.502);
        translate([10,7.5,-0.001])
            cylinder(d=3.5,h=2.502);
    }    
    translate([-1,0,0])
        cube([2,15,15]);

    hull()
    {
        translate([-1,0,14])
            cube([2,2.5,1]);
        translate([-6,0,0])
            cube([12,2.5,2.5]);
    }
}

y_endstop_insert();