$fn=100;

use <..\opto_endstop_v1.scad>
use <tool_plate.scad>


slider_headroom = 10;
wall_thick = 2.5;

module z_base()
{
    difference()
    {
        union()
        {
            translate([-35,0,0])
                cube([70,6,75]);
            for(i=[-1,1])
                hull()
                {
                    translate([i*35,-2,0])
                        cylinder(d=16,h=75);
                    translate([-4 + i*29,0,0])
                    cube([8,6,75]);
                }
            hull()
            {
                for(i=[-15,15])
                    translate([i,-2.5 - slider_headroom,0])
                        cylinder(d=12,h=6);
                for(i=[-35,35])
                    translate([i,-2,0])
                        cylinder(d=16,h=6); 
            }
        }
        for(i=[-22.5,22.5])
            translate([i,-0.001,68.15])
                rotate([-90,0,0])
                    cylinder(d=5,h=6.002);
        for(i=[-22.5,22.5])
            translate([i,0.001,68.15])
                rotate([90,0,0])
                    cylinder(d=10,h=10);
        for(i=[-7.5,7.5])
            translate([i,-0.001,11.85])
                rotate([-90,0,0])
                    cylinder(d=5,h=6.002);
        for(i=[-35,35])
            translate([i,-2,-0.001])
                cylinder(d=8.5,h=75.002);
        for(i=[-15,15])
            translate([i,-2.5 - slider_headroom,-0.001])
                cylinder(d=5.5,h=6.002);
        translate([0,0 -6,-0.001])
            cylinder(d=12,h=6.002);
     }
 }

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

module bearing_seal_up()
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
    for(i=[-1,1])
        difference()
        {
            translate([-4 + 9*i,-30,0])
                cube([8,16,6]);
            translate([9.5*i,-24.75,-0.001])
                cylinder(d=3.5,h=6.002);
        }
            
}


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


translate([0,0,3])
    bearing_holder();

translate([0,0,3])
    rotate([0,180,0])
        color("blue")
            bearing_seal_up();

translate([0,0,9])
    z_base();

translate([0,0,9])
    for(i=[-15,15])
        translate([i,-2.5 - slider_headroom,0])
            color("silver")
                cylinder(d=5,h=150);

translate([0,0,-10])
    for(i=[-35,35])
        translate([i,-2,0])
            color("silver")
                cylinder(d=8,h=194);


translate([0,-6,-5])
    color("silver")
        cylinder(d=5,h=200);

translate([20.75,-30,3])
    rotate ([90,0,180])
        opto_endstop();

translate([20.75,-19.5,159])
    rotate ([-90,0,180])
        opto_endstop();

translate([0,0,150])
    motor_mount();
translate([0,0,159])
    color("blue")
        bearing_seal_up();
    
translate([0,-33,48])  // 47, 114
    rotate([-90,0,0])
        tool_plate();    
        
    

// z_base();
// bearing_seal_up();
