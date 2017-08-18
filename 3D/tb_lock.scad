$fn=100;

tb_height=6;
tb_single_width = 2;
tb_lock_width = 3;
tb_base_height = 8.5; // az L idom oldalon csökkenteni

module tb_lock()
{
difference()
{
    union()
    {
        difference()
        {
            union()
            {
                difference()
                {
                    translate([0,-6-tb_single_width,0])
                        cylinder(d=12+2*tb_single_width,h=tb_height+tb_base_height);
                    translate([0,-6-tb_single_width,tb_base_height])
                        cylinder(d=8+2*tb_single_width,h=tb_base_height+0.001);
                }
                difference()
                {
                    translate([-6-tb_single_width,-6-tb_single_width-20,0])
                        cube([12+2*tb_single_width,20,tb_height+tb_base_height]);
                    translate([tb_lock_width * -0.5,-6-tb_single_width-20.001,tb_base_height])
                        cube([tb_lock_width,20.002,tb_height+0.001]);
                }
            }
            translate([-4-tb_single_width,-12-2*tb_single_width-0.001,tb_base_height])
                        cube([8+2*tb_single_width,6.002+tb_single_width,tb_height+0.001]);
        }
        translate([0,-6-tb_single_width,tb_base_height])
            cylinder(d=8,h=tb_height);
    }
    translate([0,-6-tb_single_width,-0.001])
            cylinder(d=4.5,h=tb_height+tb_base_height+0.002);
}
difference()
{
    union()
    {
        translate([0,-32-2*tb_single_width,0])
            cylinder(d=12+2*tb_single_width,h=3);
        translate([-6-tb_single_width,-32-2*tb_single_width,0])
            cube([12+2*tb_single_width,6+tb_single_width,3]);
    }
    translate([0,-32-2*tb_single_width,-0.001])
        cylinder(d=4.5,h=3.002);
}
}