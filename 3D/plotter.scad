use <pillar.scad>
use <corner.scad>
use <yrail.scad>
include <pillar_dim.scad>
include <y_drive_config.scad>
use <y_drive.scad>
use <SCxxUU.scad>
include <SC6UU_Config.scad>
use <y_holder_blocks.scad>
use <y_endstop.scad>
use <opto_endstop_v1.scad>
use <y_endstop_insert.scad>
use <x_endstop_holder.scad>
use <PSU.scad>
// use <tb_lock.scad>
use <tb_mount.scad>
use <x_caridge_base.scad>
use <x_pen.scad>
use <z_pen_bearing_holder.scad>
use <microservo_SG90.scad>
use <stabilo_point_88.scad>

$fn=100;
plate_x=440;
plate_y=400;

posY=0; // -175 - 175
posX = 90; // 90 - 510

/*
block_heigth=25;
hole_dia = 23;
cut_out = 20;
bolt_circle_dia = 43.815;
bolt_dia = 4;
m_size = 42;
wall = 4;
height_clerance = 80;
rod_dia = 6.3;
*/

// Base
translate([0,0,-18])
{
    difference()
    {
        color("gray")
        cube([600,400,18.002]);
        // Hole list
        
        
        translate([328,200,-0.001]) cylinder(d=67,h=18.004); // Y drive center
        
        // Corners
        translate([15.5,15.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([15.5,29.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([29.5,15.5,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([15.5,400-15.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([15.5,400-29.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([29.5,400-15.5,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([600-15.5,15.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([600-15.5,29.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([600-29.5,15.5,-0.001]) cylinder(d=4.5,h=18.004);       
        
        translate([600-15.5,400-15.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([600-15.5,400-29.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([600-29.5,400-15.5,-0.001]) cylinder(d=4.5,h=18.004);       
        
        // Y rail mounts 82.75
        translate([100,64.75,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([100,76.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([100,89,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([100,100.75,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([100,182,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([100,218,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([100,327,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([100,345,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([100,363,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([500,64.75,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([500,76.5,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([500,89,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([500,100.75,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([500,182,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([500,218,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([500,327,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([500,345,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([500,363,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([264,200,-0.001]) cylinder(d=3.5,h=18.004);       
        translate([214,200,-0.001]) cylinder(d=3.5,h=18.004);       

        translate([128,300,-0.001]) cylinder(d=3.5,h=18.004);       
        translate([128,380,-0.001]) cylinder(d=3.5,h=18.004);       
        translate([248,300,-0.001]) cylinder(d=3.5,h=18.004);       
        translate([248,380,-0.001]) cylinder(d=3.5,h=18.004);       

        // pillars
        translate([35,255,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([35,240,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([35,225,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([35,210,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([35,195,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([35,180,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([65,255,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([65,240,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([65,225,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([65,210,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([65,195,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([65,180,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([535,255,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([535,240,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([535,225,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([535,210,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([535,195,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([535,180,-0.001]) cylinder(d=4.5,h=18.004);       

        translate([565,255,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([565,240,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([565,225,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([565,210,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([565,195,-0.001]) cylinder(d=4.5,h=18.004);       
        translate([565,180,-0.001]) cylinder(d=4.5,h=18.004);       
        
        // Y drive center hole
//        translate([300+ydrive_xoffset,200,-0.001])
//            cylinder(d=ydrive_hole_dia,h=18.002);
        // Y drive munting holes
    }
}

// Power Supply
translate([110,340,-18])
    rotate([0,0,-90])
        mirror([0,0,1])
            PSU();



for(i=[-1,1])
    translate([300 + ((plate_x/2)-20) * i,0,0])
    {
        // Y rail holders
        translate([0,82.75,0])
            spacer_block_front();
        translate([0,200,0])
            spacer_block();
        translate([0,345,0])
            spacer_block_back();
        // rails
        translate([0,45,10.5])
            color("silver")
                yrail(posY);
    }

// Z pillars
color("white")
    translate([50,220,0])
        rotate([90,0,0])
            pillar_left();        
color("white")
    translate([550,220,0])
        rotate([90,0,0])
            pillar_right();        

// lower horizontal rod
color("silver")
    translate([50,220-rod_displacement,lower_rod_height])
        rotate([0,90,0])
            cylinder(d=6,h=500);

// upper horizontal rod
color("silver")
    translate([50,220-rod_displacement,upper_rod_height])
        rotate([0,90,0])
            cylinder(d=6,h=500);
            
// x-axis stepper
translate([550,220,xdrive_height])
{
    rotate([90,0,0])
    {
        color("gray")
            nema17();
        color("silver")
        translate([0,0,22])
            mirror([0,0,1])
                GT2_Pulley_20T();
    }
}

// x-axis gear
translate([50,220 - 9,xdrive_height])
    rotate([90,0,0])
        color("silver")
            GT2_Gear_NoTeeth();

color("silver")
{
    translate([25,235,xdrive_height-37])
        L_extrusion(550,15,1);
}
/*
translate([80,232,xdrive_height-37])
    cube([2,12,100]);
translate([80,237.5,xdrive_height-37])
    cube([20,1,100]);
*/
// moving X carage
translate([posX,220-rod_displacement-sc_h,lower_rod_height])
    rotate([-90,0,0])
        SCxxUU();
translate([posX,220-rod_displacement-sc_h,upper_rod_height])
    rotate([-90,0,0])
        SCxxUU();

// x carage for pen
translate([posX,195,145])
{
    rotate([-90,0,0])
    {
        x_caridge_base();
    }
    rotate([90,180,0])
    {
        x_pen_base();
        translate([0,0,3])
            color("green")
                x_pen_shaft_holder();
    }
    translate([0,-4.3,19+5.5])
        rotate([0,90,0])
            translate([-5.9,0,-11.25])
                SG90();
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
        translate([0,-17,21])
            rotate([180,0,180])
                z_pen_bottom_holder();

        translate([0,-17,64])
            z_pen_top();

        translate([0,-17,82])
            rotate([180,0,0])
                z_pen_bearing_holder(7);

        translate([10,-11,64])
            rotate([90,0,-90])
                z_pen_lock();
    }
    translate([0,-38,0.5])
        rotate([-90,0,0])
            color("red")
                pen_holder();
}

// pen
translate([posX,195-38.002,38])
    stabilo();

// x endstop
translate([75,234,xdrive_height+30.75])
    rotate([90,90,0])
        opto_endstop();

translate([525,223.5,xdrive_height+30.75])
    rotate([-90,90,0])
        opto_endstop();

// x endstop holder
translate([50,220,61])
{
    rotate([90,0,180])
        x_endstop_holder();
}    

translate([550,220,61])
{
    rotate([90,0,180])
        mirror([1,0,0])
            x_endstop_holder();
}    


// y drive            
translate([300+ydrive_xoffset,200,0])
{
    color("pink")
        y_drive();

    // y-axis stepper
    translate([ydrive_motor_offset,0,-8.5])
    {
        color("gray")
            nema17();
        color("silver")
        translate([0,0,8.5])
            GT2_Pulley_20T();
    }

    color("silver")
    {
    translate([ydrive_gear_xoffset,ydrive_gear_yoffset,3.5 + ydrive_wall_thick])
        GT2_Gear_NoTeeth();
    translate([ydrive_gear_xoffset,ydrive_gear_yoffset * -1,3.5 + ydrive_wall_thick])
        GT2_Gear_NoTeeth();
    }

}
// y endstop
translate([239,200,0])
{
    y_endstop();
    translate([20.75,-2.25,3.5])
        rotate ([0,0,180])
            opto_endstop();
    translate([-20.75,2.25,3.5])
        opto_endstop();
}

color("white")
    translate([0,0,-18])
        corner();

color("white")
    translate([0,400,-18])
        rotate([0,0,-90])
            corner();

color("white")
    translate([600,400,-18])
        rotate([0,0,180])
            corner();

color("white")
    translate([600,0,-18])
        rotate([0,0,90])
            corner();

// Y assembly (Moving plate)
translate([0,posY,0])
{
    color("blue")
    {
    translate([258,plate_y-30,20])
        rotate([180,0,0])
            mirror([0,1,0])
                tb_lock();
    translate([258,30,20])
        rotate([180,0,0])
            tb_lock();

    translate([239,plate_y,20])
        rotate([180,0,0])
            y_endstop_insert();
    translate([239,0,20])
        mirror([0,1,0])
            rotate([180,0,0])
                y_endstop_insert();
    }
    color("white",0.5)
        translate([300-plate_x/2,0,20])
            cube([plate_x,plate_y,18]);
}

// ----------------------------------

module L_extrusion(length,width,thick)
{
    difference()
    {
        cube([length,width,width]);
        translate([-0.001,thick,thick])
            cube([length+0.002,width,width]);
    }
}


