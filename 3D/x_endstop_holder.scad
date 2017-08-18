$fn=100;
include <pillar_config.scad>

module x_endstop_holder()
{
    difference()
    {
        translate([-25,0,0])
            cube([50,75.3,30]);
        translate([-25.001,8,8])
            rotate([0,90,0])
                cylinder(d=10,h=50.002);
        translate([-25.001,3,8])
            cube([50.002,32,22.001]);
        translate([-25.001,8,3])
            cube([50.002,27,22.001]);
        translate([-25.001,64,3])
            cube([50.002,27,22.001]);
        translate([-25.001,8,14])
            cube([50.002,100,22.001]);
        translate([-19.501,8,3])
            cube([50.002,100,22.001]);
        translate([-19.501,34.999,6])
            rotate([-90,0,0])
                cylinder(d=6,h=50.002);
        translate([-22.501,34.999,6])
            cube([4.501,100,22.001]);
        translate([-15,-0.001,22.5])
            rotate([-90,0,0])
                cylinder(d=4.5,h=3.002);
        translate([15,-0.001,22.5])
            rotate([-90,0,0])
                cylinder(d=4.5,h=3.002);
        translate([0,(m_size * 0.5) + height_clerance-61,0])
        {
            // Motor mount holes
            for(i=[0:3])
            {
                rotate([0,0,45 + 90 * i])
                {
                    translate([bolt_circle_dia / 2, 0,-0.001])
                    {
                        cylinder(d=bolt_dia,h= block_heigth *2);
                        translate([0, 0,wall])
                            cylinder(d=bolt_dia*2,h= block_heigth *2);
                    }
                }
            }
            // Motor center hole
            translate([0,0,-0.001])
            {
                cylinder(d=hole_dia,h= wall + 0.002);
            }
        }
        translate([-22.499,40.60,8.75])
            rotate([0,-90,0])
            {    
                cylinder(d=3.5,h=5);
                cylinder(d1=6.5,d2=0.001,h=3.25);
            }
        translate([-22.499,59.6,8.75])
            rotate([0,-90,0])
            {    
                cylinder(d=3.5,h=5);
                cylinder(d1=6.5,d2=0.001,h=3.25);
            }
        translate([-20,40.60,8.75])
            rotate([0,-90,0])
                cylinder(d=6.5,h=2.501);
        translate([-20,59.6,8.75])
            rotate([0,-90,0])
                cylinder(d=6.5,h=2.501);
        translate([-25.001,44.1,-0.001])
            cube([1.5,12,15]);
            
    }
}

translate([26,0,0])
    x_endstop_holder();
translate([-26,0,0])
    mirror([1,0,0])
        x_endstop_holder();