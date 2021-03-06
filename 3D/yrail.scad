$fn=100;

yrail_length = 310;


module yrail(displacement)
{
difference()
{
    union()
    {
        hull()
        {
            translate([-6.35,0,1])
                rotate([-90,0,0])
                    cylinder(d=2,h=yrail_length);
            translate([6.35,0,1])
                rotate([-90,0,0])
                    cylinder(d=2,h=yrail_length);
        }
        hull()
        {
            translate([-5.25,0,5.5])
                rotate([-90,0,0])
                    cylinder(d=6,h=yrail_length);
            translate([5.25,0,5.5])
                rotate([-90,0,0])
                    cylinder(d=6,h=yrail_length);
        }
        translate([-7.35,0,1])
            cube([14.7,yrail_length,5]);
    }
    translate([0,-0.001,0])
    rotate([-90,0,0])
        linear_extrude(height=yrail_length+0.002)
            polygon(points=[
            [-7.55,-10],
            [-7.55,-7.70],
            [-6.55,-6.70],
            [-6.55,-1.2],
            [-6.15,-0.8],
            [6.15,-0.8],
            [6.55,-1.2],
            [6.55,-6.70],
            [7.55,-7.70],
            [7.55,-10]
            ]);
    translate([-5.25,-0.001,5.5])
        rotate([-90,0,0])
            cylinder(d=4.6,h=yrail_length+0.02);
    translate([5.25,-0.001,5.5])
        rotate([-90,0,0])
            cylinder(d=4.6,h=yrail_length+0.02);
    translate([0,yrail_length-10,-0.001])
        cylinder(d=5,h=0.802);
    translate([0,10,-0.001])
        cylinder(d=8,h=0.802);
    translate([0,31.5,-0.001])
        cylinder(d=4,h=0.802);
    translate([0,44,-0.001])
        cylinder(d=4,h=0.802);
    hull()
    {
        translate([0,67.25,-0.001])
            cylinder(d=7.5,h=0.802);
        translate([0,71.75,-0.001])
            cylinder(d=7.5,h=0.802);
    }
}
translate([0,displacement,0])
difference()
{
    union()
    {
        hull()
        {
            translate([-4,0,8.5])
                rotate([-90,0,0])
                    cylinder(d=2,h=yrail_length);
            translate([4,0,8.5])
                rotate([-90,0,0])
                    cylinder(d=2,h=yrail_length);
        }
         translate([-5,0,3.5])
            cube([10,yrail_length,5]);
    }
    translate([-4.2,-0.001,3.499])
        cube([8.4,yrail_length+0.002,5.201]);
    for(i=[-4:4])
        for(j=[-1:1])
            translate([0,yrail_length/2 + j*8 + i*32,8.699])
                cylinder(d=5,h=0.802);
    translate([-2.5,6,8.699])
        cube([5,4,0.802]);
    translate([-2.5,yrail_length-10,8.699])
        cube([5,4,0.802]);
}
}

yrail(0);