$fn=100;

use <z_pen_bearing_holder.scad>
use <servo.scad>
use <stabilo_point_88.scad>;

module x_pen_shaft_holder()
{
    difference()
    {
        union()
        {
            translate([-22.5,-16,0])
                cube([45,100,3]);
        
            translate([-22.5,-16,0])
                cube([2,100,7]);            
            translate([20.5,-16,0])
                cube([2,100,7]);            

            hull()
            {
                translate([12,81,0])
                    cube([9,3,3]);
                translate([20,81,14])
                    rotate([-90,0,0])
                        cylinder(d=7,h=3);
            }
            hull()
            {
                translate([-21,81,0])
                    cube([9,3,3]);           
                translate([-20,81,14])
                    rotate([-90,0,0])
                        cylinder(d=7,h=3);
            }

            hull()
            {
                translate([12,-16,0])
                    cube([9,3,3]);
                translate([20,-16,14])
                    rotate([-90,0,0])
                        cylinder(d=7,h=3);
            }
            hull()
            {
                translate([-21,-16,0])
                    cube([9,3,3]);
                translate([-20,-16,14])
                    rotate([-90,0,0])
                        cylinder(d=7,h=3);
            }
        }
        translate([20,80.999,14])
            rotate([-90,0,0])
                cylinder(d=3.5,h=3.002);
        translate([-20,80.999,14])
            rotate([-90,0,0])
                cylinder(d=3.5,h=3.002);
        translate([20,-16.001,14])
            rotate([-90,0,0])
                cylinder(d=3.5,h=3.002);
        translate([-20,-16.001,14])
            rotate([-90,0,0])
                cylinder(d=3.5,h=3.002);

        translate([-7.5,25.85,-1])
        {
            cylinder(d1=0.001,d2=8,h=4.001);
            cylinder(d=5,h=5.002);
        }
        translate([7.5,25.85,-1])
        {
            cylinder(d1=0.001,d2=8,h=4.001);
            cylinder(d=5,h=5.002);
        }       
        translate([-7.5,62.15,-1])
        {
            cylinder(d1=0.001,d2=8,h=4.001);
            cylinder(d=5,h=5.002);
        }
        translate([7.5,62.15,-1])
        {
            cylinder(d1=0.001,d2=8,h=4.001);
            cylinder(d=5,h=5.002);
        }
    }
}



module x_pen_base()
{
    difference()
    {
        union()
        {
            // base plate
            translate([-25,-45,0])
                cube([50,132,3]);
            // servo plate
            translate([-30,-45,0])
                cube([60,29,6]);
            // side strengthening
            translate([-25,-19,0])
                cube([2,106,8]);            
            translate([23,-19,0])
                cube([2,106,8]);            
            // shaft endings
            hull()
            {
                translate([12,84,0])
                    cube([13,3,3]);
                translate([20,84,17])
                    rotate([-90,0,0])
                        cylinder(d=10,h=3);
            }
            hull()
            {
                translate([-25,84,0])
                    cube([13,3,3]);           
                translate([-20,84,17])
                    rotate([-90,0,0])
                        cylinder(d=10,h=3);
            }

            hull()
            {
                translate([12,-19,0])
                    cube([13,3,3]);
                translate([20,-19,17])
                    rotate([-90,0,0])
                        cylinder(d=10,h=3);
            }
            hull()
            {
                translate([-25,-19,0])
                    cube([13,3,3]);
                translate([-20,-19,17])
                    rotate([-90,0,0])
                        cylinder(d=10,h=3);
            }
        }
        // Mount holes
        /*
        translate([-7.5,5.85,-0.001])
            cylinder(d=9,h=5.002);
        translate([7.5,5.85,-0.001])
            cylinder(d=9,h=5.002);
        */
        translate([-7.5,25.85,-0.001])
            cylinder(d=5,h=5.002);
        translate([7.5,25.85,-0.001])
            cylinder(d=5,h=5.002);
       
        translate([-7.5,62.15,-0.001])
            cylinder(d=5,h=5.002);
        translate([7.5,62.15,-0.001])
            cylinder(d=5,h=5.002);
        /*
        hull()
        {
            translate([-7.5,82.15,-0.001])
                cylinder(d=9,h=5.002);
            translate([7.5,82.15,-0.001])
                cylinder(d=9,h=5.002);
            translate([-12,90,-0.001])
                cube([24,1,3.002]);
        }
        */
        // servo mount
        translate([-20,-40,-0.001])        
            cube([40,20,6.002]);
        translate([-24,-35.75,-0.001])
            cylinder(d=3.5,h=6.002);        
        translate([-24,-24.25,-0.001])
            cylinder(d=3.5,h=6.002);        
        translate([24,-35.75,-0.001])
            cylinder(d=3.5,h=6.002);        
        translate([24,-24.25,-0.001])
            cylinder(d=3.5,h=6.002);        
  
    }
}

module pen_holder()
{
    difference()
    {
        union()
        {
            hull()
            {
                translate([-13,0,9.5])
                    cube([26,3,10]);
                rotate([-90,0,0])
                    cylinder(d=15,h=3,$fn=6);
            }
            hull()
            {
                translate([-2,0,6.5])
                    cube([4,3,13]);
                translate([-2,0,6.5])
                    cube([4,15,0.001]);
            }
            hull()
            {
                translate([-13,75.5,9.5])
                    cube([26,3,10]);
                translate([0,75.5,0])
                    rotate([-90,0,0])
                        cylinder(d=15,h=3,$fn=6);
            }
            hull()
            {
                translate([-2,75.5,6.5])
                    cube([4,3,13]);
                translate([-2,63.5,6.5])
                    cube([4,15,0.001]);
            }
            rotate([-90,0,0])
                cylinder(d=15,h=78.5,$fn=6);
            translate([-8,78.5,14.5])
                sphere(d=4.5);
            translate([8,78.5,14.5])
                sphere(d=4.5);
        }
        rotate([-90,0,0])
            translate([0,0,-0.001])
                cylinder(d=9,h=78.502,$fn=6);
        translate([-7.501,-0.001,-7.501])
            cube([15.002,78.502,7.501]);

        translate([-8,-0.001,14.5])
            rotate([-90,0,0])
                cylinder(d1=4,d2=2.5,h=3.002);
        translate([8,-0.001,14.5])
            rotate([-90,0,0])
                cylinder(d1=4,d2=2.5,h=3.002);
        
        translate([6,15,-0.001])
            cube([3,4,10]);
        translate([-9,15,-0.001])
            cube([3,4,10]);
        translate([6,59.5,-0.001])
            cube([3,4,10]);
        translate([-9,59.5,-0.001])
            cube([3,4,10]);


    }
}

module servo_lift_plate()
{
            difference()
            {
                hull()
                {
                    translate([-30,0,0])
                        cylinder(d=8,h=5);
                    translate([30,0,0])
                        cylinder(d=8,h=5);
                    translate([-25,0,0])
                        cube([50,7,5]);
                }
                translate([-30,0,-0.001])
                    cylinder(d=3.5,h=5.002);
                translate([30,0,-0.001])
                    cylinder(d=3.5,h=5.002);
            }
}


// Base
translate([0,0,145-38])
{
    rotate([90,180,0])
    {
        x_pen_base();
    }
    translate([10.25,-14.5,30])
    rotate([0,90,0])
        MG995WithSingleHorn(90);
}

// Shaft holder
translate([0,-3,145-38])
    rotate([90,180,0])
    {
        color("green")
            x_pen_shaft_holder();
    }


translate([0,0,145-38])
{
    translate([0,0,-87])
    {
        // Shafts
        color("silver")
        {
            translate([20,-17,3])
                    cylinder(d=3,h=100);
            translate([-20,-17,3])
                    cylinder(d=3,h=100);
        }

        translate([0,-17,6])
            rotate([0,0,180])
                z_pen_bottom();
        
        translate([0,-17,20])
            rotate([180,0,0])
                z_pen_bearing_holder(7);
        
        translate([-30,-17,20])
            cylinder(d=8,h=45);
        translate([30,-17,20])
            cylinder(d=8,h=45);
        
        translate([0,-17,65])
            z_pen_top();

        translate([0,-17,82])
            rotate([180,0,0])
                z_pen_bearing_holder(7);
                
        translate([-30,-17,82])
            cylinder(d=8,h=45);
        translate([30,-17,82])
            cylinder(d=8,h=45);                
        
        translate([0,-17,127])
            servo_lift_plate();

        translate([10,-11,65])
            rotate([90,0,-90])
                z_pen_lock();
    }
}


// spacer
/*
difference()
{
    cylinder(d=8,h=45);
    translate([0,0,-0.001])
        cylinder(d=3.5,h=45.002);
}
*/
/*
translate([0,-38.002,-2])
    stabilo();

translate([0,0,145-38])
    translate([0,-38,0.5])
        rotate([-90,0,0])
            color("red")
                pen_holder();
*/

// pen_holder();


/*
translate([0,-15,0])
    z_pen_bottom_holder();
translate([-62,15,0])
    x_pen_base();
translate([-10,15,0])
    x_pen_shaft_holder();
*/

