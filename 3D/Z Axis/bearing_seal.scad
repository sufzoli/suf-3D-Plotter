$fn=100;

slider_headroom = 10;
wall_thick = 2.5;
module bearing_seal()
{ 
    difference()
    {
        hull()
        {
            for(i=[-15,15])
                translate([i,-2.5 - slider_headroom,0])
                    cylinder(d=12,h=3);
            for(i=[-35,35])
                translate([i,-2,0])
                    cylinder(d=16,h=3); 
        }
        for(i=[-35,35])
            translate([i,-2,-0.001])
                cylinder(d=8.5,h=3.002);
        translate([0,-6,-0.001])
            cylinder(d=12,h=3.002);
    }
    translate([0,-13.5,1])
    difference()
    {
        union()
        {
            translate([-12.5,wall_thick*-0.5,0])
                cube([25,wall_thick,15]);
            translate([-12.5,wall_thick*-0.5-2,0])
                cube([7.5,wall_thick+4,15]);
            translate([5,wall_thick*-0.5-2,0])
                cube([7.5,wall_thick+4,15]);
        }
        translate([-9.5,wall_thick*-0.5-2.001,wall_thick+6.25])
            rotate([-90,0,0])
                cylinder(d=3.5,h= wall_thick+4.002);
        translate([9.5,wall_thick*-0.5-2.001,wall_thick+6.25])
            rotate([-90,0,0])
                cylinder(d=3.5,h= wall_thick+4.002);
    }    
}

bearing_seal();