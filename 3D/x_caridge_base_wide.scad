$fn=100;

module x_caridge_base()
{
    difference()
    {
        translate([-30,0,0])
            cube([60,88,5]);
        // upper bearings
        translate([7.5,5.85,-0.001])
            cylinder(d=5,h=5.002);
        translate([22.5,5.85,-0.001])
            cylinder(d=5,h=5.002);
        translate([7.5,25.85,-0.001])
            cylinder(d=5,h=5.002);
        translate([22.5,25.85,-0.001])
            cylinder(d=5,h=5.002);        
        translate([-7.5,5.85,-0.001])
            cylinder(d=5,h=5.002);
        translate([-22.5,5.85,-0.001])
            cylinder(d=5,h=5.002);
        translate([-7.5,25.85,-0.001])
            cylinder(d=5,h=5.002);
        translate([-22.5,25.85,-0.001])
            cylinder(d=5,h=5.002);
        // lower bearings
        translate([7.5,62.15,-0.001])
            cylinder(d=5,h=5.002);
        translate([22.5,62.15,-0.001])
            cylinder(d=5,h=5.002);
        translate([7.5,82.15,-0.001])
            cylinder(d=5,h=5.002);
        translate([22.5,82.15,-0.001])
            cylinder(d=5,h=5.002);        
        translate([-7.5,62.15,-0.001])
            cylinder(d=5,h=5.002);
        translate([-22.5,62.15,-0.001])
            cylinder(d=5,h=5.002);
        translate([-7.5,82.15,-0.001])
            cylinder(d=5,h=5.002);
        translate([-22.5,82.15,-0.001])
            cylinder(d=5,h=5.002);        
    }
    // bearing side
    for(i=[-1,1])
        translate([29*i-1,0,0])
            difference()
            {
                cube([2,33,25]);
                translate([-0.001,15.85,13.85])
                    rotate([0,90,0])
                        cylinder(d=8, h=2.002);
            }
    // drag chain holder
    difference()
    {
        translate([-30,-3,0])
            cube([60,3,60]);
        // drag chain holes
        translate([-4,0.001,47.5])
            rotate([90,0,0])
                cylinder(d=3.5, h=3.002);
        translate([4,0.001,47.5])
            rotate([90,0,0])
                cylinder(d=3.5, h=3.002);
        // board mount holes
        for(i=[-20,20])
            for(j=[10,55])
                translate([i,0.001,j])
                    rotate([90,0,0])
                    {
                        cylinder(d=3.5, h=3.002);
                        cylinder(d2=0.001,d1=6, h=3.002);
                    }
    }          
    // endstop insert
    translate([-25,33,5])
    {
        cube([50,2,32]);
    }
    translate([-30,33,5])
    {
        cube([60,2,20]);
    }            
    // Timing Belt Mount
    translate([-5,50,5])
        cylinder(d=5,h=10);
    translate([5,50,5])
        cylinder(d=5,h=10);
    translate([-25,45,5])
        cube([50,10,2.5]);
    difference()
    {
        translate([-25,45,5])
            cube([14,10,10]);
        translate([-25.001,48.6,5])
            cube([15.002,2.8,10.001]);
    }
    difference()
    {
        translate([10,45,5])
            cube([15,10,10]);
        translate([8.999,48.6,5])
            cube([16.002,2.8,10.001]);
    }
}

x_caridge_base();