$fn=100;

module spacer_block()
{
difference()
    {
        translate([-10,-25,0])
            cube([20,50,10.5]);
        translate([0,-18,-0.001])
            cylinder(d=4.5,h=10.502);
        translate([0,-18,6])
            cylinder(d=9,h=4.501);
        translate([0,18,-0.001])
            cylinder(d=4.5,h=10.502);
        translate([0,18,6])
            cylinder(d=9,h=4.501);
    }
}

module spacer_block_front()
{
    difference()
    {
        spacer_block();
        translate([0,6.25,-0.001])
            cylinder(d=4.5,h=10.502);
        translate([0,-6.25,-0.001])
            cylinder(d=4.5,h=10.502);
    }
}

module spacer_block_back()
{
    difference()
    {
        spacer_block();
        translate([0,0,-0.001])
            cylinder(d=4.5,h=10.502);
    }
}

/*
module spacer_block()
{
difference()
    {
        cube([50,20,10.5]);
        translate([7,10,-0.001])
            cylinder(d=4.5,h=10.502);
        translate([7,10,6])
            cylinder(d=9,h=4.501);
        translate([43,10,-0.001])
            cylinder(d=4.5,h=10.502);
        translate([43,10,6])
            cylinder(d=9,h=4.501);
    }
}


module spacer_block_front()
{
    difference()
    {
        spacer_block();
        translate([18.75,10,-0.001])
            cylinder(d=4.5,h=10.502);
        translate([31.25,10,-0.001])
            cylinder(d=4.5,h=10.502);
    }
}

module spacer_block_back()
{
    difference()
    {
        spacer_block();
        translate([25,10,-0.001])
            cylinder(d=4.5,h=10.502);
    }
}



spacer_block();

translate([0,22,0])
    spacer_block_back();

translate([0,44,0])
    spacer_block_front();
*/