$fn=100;

module x_caridge_base()
{
    translate([-15,0,0])
    {
        // Base Plate
        difference()
        {
            cube([30,88,5]);
            translate([7.5,5.85,-0.001])
                cylinder(d=5,h=5.002);
            translate([22.5,5.85,-0.001])
                cylinder(d=5,h=5.002);
            translate([7.5,25.85,-0.001])
                cylinder(d=5,h=5.002);
            translate([22.5,25.85,-0.001])
                cylinder(d=5,h=5.002);
           
            translate([7.5,62.15,-0.001])
                cylinder(d=5,h=5.002);
            translate([22.5,62.15,-0.001])
                cylinder(d=5,h=5.002);
            translate([7.5,82.15,-0.001])
                cylinder(d=5,h=5.002);
            translate([22.5,82.15,-0.001])
                cylinder(d=5,h=5.002);
        }
        // endstop insert
        translate([5,33,5])
        {
            cube([20,2,32]);
        }
        translate([0,33,5])
        {
            cube([30,2,20]);
        }
        for(i=[0:1])
            translate([28*i,0,0])
                difference()
                {
                    union()
                    {
                        cube([2,33,25]);
                        /*
                        hull()
                        {
                            translate([0,0,25])
                                rotate([0,90,0])
                                    cylinder(d=0.001, h=2);
                            translate([0,0,35])
                                rotate([0,90,0])
                                    cylinder(d=0.001, h=2);
                            translate([0,25,25])
                                rotate([0,90,0])
                                    cylinder(d=0.001, h=2);
                        }
                        */
                    }
                    translate([-0.001,15.85,13.85])
                        rotate([0,90,0])
                            cylinder(d=8, h=2.002);
                }
        translate([10.5,50,5])
            cylinder(d=5,h=10);
        translate([19.5,50,5])
            cylinder(d=5,h=10);
        translate([0,45,5])
            cube([30,10,2.5]);
        difference()
        {
            translate([0,45,5])
                cube([6,10,10]);
            translate([-0.001,48.6,5])
                cube([7.002,2.8,10.001]);
        }
        difference()
        {
            translate([24,45,5])
                cube([6,10,10]);
            translate([22.999,48.6,5])
                cube([7.002,2.8,10.001]);
        }
        // drag chain holder
        difference()
        {
            translate([-10,-3,0])
                cube([50,3,55]);
            // drag chain holes
            translate([11,0.001,47.5])
                rotate([90,0,0])
                    cylinder(d=3.5, h=3.002);
            translate([19,0.001,47.5])
                rotate([90,0,0])
                    cylinder(d=3.5, h=3.002);
            // board mount holes
            for(i=[-5,35])
                for(j=[5,50])
                    translate([i,0.001,j])
                        rotate([90,0,0])
                        {
                            cylinder(d=3.5, h=3.002);
                            cylinder(d2=0.001,d1=6, h=3.002);
                        }
        }
    }
}

x_caridge_base();