use <opto_endstop_v1.scad>

$fn=100;

bolt_dia = 3.5;
bolt_circle_dia = 43.815;
hole_dia = 18;
wall_thick = 2.5;
/*
module vertical_holder()
{
    difference()
    {
        translate([21-wall_thick,-12.5,0])
            cube([wall_thick,25,15]);
        translate([21-wall_thick-0.001,-9.5,10])
            rotate([0,90,0])
                cylinder(d=bolt_dia,h=wall_thick+0.002);
        translate([21-wall_thick-0.001,9.5,10])
            rotate([0,90,0])
                cylinder(d=bolt_dia,h=wall_thick+0.002);
    }
    hull()
    {
        translate([21-wall_thick,-0.5*wall_thick,wall_thick])
            rotate([-90,0,0])
                cylinder(d=0.001,h=wall_thick);
        translate([21-wall_thick,-0.5*wall_thick,15])
            rotate([-90,0,0])
                cylinder(d=0.001,h=wall_thick);
        translate([hole_dia /2 +1,-0.5*wall_thick,wall_thick])
            rotate([-90,0,0])
                cylinder(d=0.001,h=wall_thick);
    }
}

module y_endstop()
{
vertical_holder();
mirror([1,0,0])
    vertical_holder();


difference()
{
    translate([-21,-21,0])
        cube([42,42,wall_thick]);
    // Motor mount holes
    for(i=[0:3])
    {
        rotate([0,0,45 + 90 * i])
        {
            translate([bolt_circle_dia / 2, 0,-0.001])
            {
                cylinder(d=bolt_dia,h= wall_thick+0.002);
            }
        }
    }
    // Motor center hole
    translate([0,0,-0.001])
    {
        cylinder(d=hole_dia,h= wall_thick + 0.002);
    }
}
}
*/

module y_endstop()
{
    difference()
    {
        hull()
        {
            translate([-25,0,0])
                cylinder(d=15,h= wall_thick);
            translate([25,0,0])
                cylinder(d=15,h= wall_thick);
        }
        translate([-25,0,-0.001])
        {
            cylinder(d=bolt_dia,h= wall_thick + 0.002);
        }
        translate([25,0,-0.001])
        {
            cylinder(d=bolt_dia,h= wall_thick + 0.002);
        }
    }
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
                cylinder(d=bolt_dia,h= wall_thick+4.002);
        translate([9.5,wall_thick*-0.5-2.001,wall_thick+6.25])
            rotate([-90,0,0])
                cylinder(d=bolt_dia,h= wall_thick+4.002);
    }
}

y_endstop();
/*
translate([20.75,wall_thick*-0.5-2,wall_thick+1])
    rotate ([0,0,180])
        opto_endstop();
translate([-20.75,wall_thick*0.5+2,wall_thick+1])
    opto_endstop();
*/