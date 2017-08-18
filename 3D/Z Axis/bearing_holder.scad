$fn=100;

slider_headroom = 10;
module bearing_holder()
{ 
    difference()
    {
        hull()
        {
            for(i=[-15,15])
                translate([i,-2.5 - slider_headroom,0])
                    cylinder(d=12,h=6);
            for(i=[-35,35])
                translate([i,-2,0])
                    cylinder(d=16,h=6); 
        }
        for(i=[-35,35])
            translate([i,-2,-0.001])
                cylinder(d=8.5,h=6.002);
        translate([0,-6,-0.001])
            cylinder(d=19.5,h=6.002);
    }
}

bearing_holder();