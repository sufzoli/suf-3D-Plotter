$fn=100;

slider_headroom = 10;
module motor_mount()
{
    difference()
    {
        hull()
        {
            for(i=[-15,15])
                translate([i,-2.5 - slider_headroom,0])
                    cylinder(d=12,h=9);
            for(i=[-35,35])
                translate([i,-2,0])
                    cylinder(d=16,h=9); 
            for(i=[-15.5,15.5])
                translate([i,54.5,0])
                    cylinder(d=15,h=9); 
        }
        for(i=[-35,35])
            translate([i,-2,-0.001])
                cylinder(d=8.5,h=9.002);
        translate([0,-6,3])
            cylinder(d=19.5,h=6.001);
        translate([0,-6,-0.001])
            cylinder(d=12,h=9.002);
        for(i=[-15,15])
            translate([i,-2.5 - slider_headroom,-0.001])
                cylinder(d=5.5,h=9.002);
        for(i=[-15.5,15.5])
            for(j=[-31,0])
                translate([i,54.5 + j,-0.001])
                {
                    hull()
                    {
                        cylinder(d=3.5,h=9.002); 
                        translate([0,-8,-0.001])
                            cylinder(d=3.5,h=9.002); 
                    }
                    translate([0,0,6])
                        hull()
                        {
                            cylinder(d=6,h=3.003); 
                            translate([0,-8,-0.001])
                                cylinder(d=6,h=3.003); 
                        }
                }
        translate([0,39,-0.001])
            hull()
            {
                cylinder(d=22.5,h=9.002); 
                translate([0,-8,0])
                    cylinder(d=22.5,h=9.002); 
            }
    }
}

motor_mount();