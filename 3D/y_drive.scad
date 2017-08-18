$fn=100;
// 60, 67, 74, 83
include <y_drive_config.scad>

bolt_dia = 3.5;
bolt_circle_dia = 43.815;
hole_dia = 18;
motor_height = 34.0;

module nema17()
{
    translate([0,0,motor_height*-1])
        difference()
        {
    //motor
            union(){
                translate([0,0,motor_height/2]){
                    intersection(){
                        cube([42.3,42.3,motor_height], center = true);
                        rotate([0,0,45]) translate([0,0,-1]) cube([74.3*sin(45), 73.3*sin(45) ,motor_height+2], center = true);
                    }
                }
                translate([0, 0, motor_height]) cylinder(h=2, r=11);
                translate([0, 0, motor_height+2]) cylinder(h=20, r=2.5);
            }
    //screw holes
            for(i=[0:3]){
                    rotate([0, 0, 90*i])translate([15.5, 15.5, motor_height-4.5]) cylinder(h=5, r=1.5);
                }
        }    
}

module GT2_Pulley_16T()
{
    difference()
    {
        union()
        {
            cylinder(d=13.8,h=7);
            translate([0,0,7])
                cylinder(d=9.4,h=7);
            translate([0,0,14])
                cylinder(d=13.8,h=1);
        }
        translate([0,0,-0.001])
            cylinder(d=5,h=15.002);
    }
    for(i=[0:15])
        rotate([0,0,i*22.5])
            translate([4.5,0,7])
                cube([0.6,0.92,7]);
}

module GT2_Pulley_20T()
{
    difference()
    {
        union()
        {
            cylinder(d=16,h=7.5);
            translate([0,0,7.5])
                cylinder(d=10.4,h=7);
            translate([0,0,14.5])
                cylinder(d=16,h=1.5);
        }
        translate([0,0,-0.001])
            cylinder(d=5,h=16.002);
    }
    for(i=[0:19])
        rotate([0,0,i*18])
            translate([5,0,7.5])
                cube([0.6,0.92,7]);
}


module GT2_Gear_NoTeeth()
{
    difference()
    {
        union()
        {
            cylinder(d=16,h=1.5);
            translate([0,0,1.5])
                cylinder(d=12.3,h=7);
            translate([0,0,8.5])
                cylinder(d=16,h=1.5);
        }
        translate([0,0,-0.001])
            cylinder(d=4,h=10.002);
    }
}

module y_drive()
{
    difference()
    {
        union()
        {
            cylinder(d=ydrive_hole_dia + 20, h= ydrive_wall_thick);
            
            translate([0,0,ydrive_base_thick*-1])
                difference()
                {
                    cylinder(d=ydrive_hole_dia, h= ydrive_base_thick);
                    translate([0,0,-0.001])
                        cylinder(d=ydrive_hole_dia-2*ydrive_wall_thick, h= ydrive_base_thick + 0.002);
                }
            
            // Motor mount spacers
            translate([ydrive_motor_offset,0,ydrive_motor_zoffset * -1])
            {
                for(i=[0:3])
                {
                    rotate([0,0,45 + 90 * i])
                    {
                        translate([bolt_circle_dia / 2, 0,0])
                        {
                            cylinder(d=bolt_dia*2,h= ydrive_motor_zoffset);
                        }
                    }
                }
            }
            // Gear mount spacers
            translate([ydrive_gear_xoffset,ydrive_gear_yoffset,-7.5])
                 cylinder(d=9,h= 7.5);
            translate([ydrive_gear_xoffset,ydrive_gear_yoffset * -1,-7.5])
                 cylinder(d=9,h= 7.5);        
        }
        
        translate([ydrive_motor_offset,0,0])
        {
            // Motor mount holes
            for(i=[0:3])
            {
                rotate([0,0,45 + 90 * i])
                {
                    translate([bolt_circle_dia / 2, 0,ydrive_motor_zoffset *-1 -0.001])
                    {
                        cylinder(d=bolt_dia,h= ydrive_motor_zoffset + ydrive_wall_thick+0.002);
                    }
                }
            }
            // Motor center hole
            translate([0,0,-0.001])
            {
                cylinder(d=hole_dia,h= ydrive_wall_thick + 0.002);
            }
        }
        
        // Mount holes
        for(i=[0:3])
        {
            rotate([0,0,45 + 90 * i])
            {
                translate([ydrive_hole_dia / 2 + 5, 0,-0.001])
                {
                    cylinder(d=4.5,h= ydrive_wall_thick+0.002);
                }
            }
        }
        
        
        translate([ydrive_gear_xoffset,ydrive_gear_yoffset,-7.501])
             cylinder(d=4.5,h= ydrive_wall_thick  + 7.502);
        translate([ydrive_gear_xoffset,ydrive_gear_yoffset * -1,-7.501])
             cylinder(d=4.5,h= ydrive_wall_thick + 7.502);
             
    }
}

translate([0,0,ydrive_wall_thick])
    rotate([180,0,0])
        y_drive();
/*
translate([ydrive_motor_offset,0,-8.5])
{
    color("gray")
        nema17();
    color("silver")
    translate([0,0,6])
        GT2_Pulley_20T();
}

color("silver")
{
translate([ydrive_gear_xoffset,ydrive_gear_yoffset,1 + ydrive_wall_thick])
    GT2_Gear_NoTeeth();
translate([ydrive_gear_xoffset,ydrive_gear_yoffset * -1,1 + ydrive_wall_thick])
    GT2_Gear_NoTeeth();
}
*/
