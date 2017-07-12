
$fn=100;
module PSU()
{
    color("silver")
    {
        difference()
        {
            translate([-50,0,0])
                cube([100,200,43]);
            translate([-40,18,-0.001])
                cylinder(d=3.5,h=10);
            translate([-40,138,-0.001])
                cylinder(d=3.5,h=10);
            translate([40,18,-0.001])
                cylinder(d=3.5,h=10);
            translate([40,138,-0.001])
                cylinder(d=3.5,h=10);
        }
    }
}
