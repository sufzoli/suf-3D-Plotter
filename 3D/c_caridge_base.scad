$fn=100;

module x_caridge_base()
{
        cube([30,88,5]);
        // endstop insert
        translate([0,33,5])
            cube([30,2,30]);
        for(i=[0:1])
            translate([28*i,0,0])
                hull()
                {
                    translate([0,48.6,5])
                        rotate([0,90,0])
                            cylinder(d=0.001, h=2);
                    translate([0,48.6,15])
                        rotate([0,90,0])
                            cylinder(d=0.001, h=2);
                    translate([0,35,25])
                        rotate([0,90,0])
                            cylinder(d=0.001, h=2);
                    translate([0,33,25])
                        rotate([0,90,0])
                            cylinder(d=0.001, h=2);
                    translate([0,20,5])
                        rotate([0,90,0])
                            cylinder(d=0.001, h=2);
                }
        translate([11,50,5])
            cylinder(d=6,h=10);
        translate([19,50,5])
            cylinder(d=6,h=10);
        translate([0,45,5])
            cube([30,10,2.5]);
        difference()
        {
            translate([0,45,5])
                cube([7,10,10]);
            translate([-0.001,48.6,5])
                cube([7.002,2.8,10.001]);
        }
        difference()
        {
            translate([23,45,5])
                cube([7,10,10]);
            translate([22.999,48.6,5])
                cube([7.002,2.8,10.001]);
        }
        translate([0,-5,0])
            cube([30,5,50]);
}

x_caridge_base();