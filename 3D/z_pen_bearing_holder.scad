$fn=100;

module z_pen_bearing_holder(height)
{
    difference()
    {
        union()
        {
            hull()
            {
            translate([-30,0,0])
                cylinder(d=8,h=height);
            translate([-20,0,0])
                cylinder(d=12, h=height);
            }
            hull()
            {
            translate([20,0,0])
                cylinder(d=12, h=height);    
            translate([30,0,0])
                cylinder(d=8,h=height);
            }    
            translate([-20,-1.5,0])
                cube([40,3,height]);
        }
        translate([-30,0,-0.001])
            cylinder(d=3.5,h=height+0.002);
        translate([30,0,-0.001])
            cylinder(d=3.5,h=height+ 0.002);
        translate([-20,0,-0.001])
            cylinder(d=5,h=height+ 0.002);
        translate([20,0,-0.001])
            cylinder(d=5,h=height+ 0.002);
        translate([-20,0,height -5])
            cylinder(d=7.5,h=height -1.999);
        translate([20,0,height-5])
            cylinder(d=7.5,h=height - 1.999);
    }
}

module z_pen_bottom()
{
    z_pen_bearing_holder(7);
    difference()
    {
        hull()
        {
            translate([20,6,0])
                cylinder(d=0.001,h=3);
            translate([-16,1.5,0])
                cube([32,10,3]);
            translate([-20,6,0])
                cylinder(d=0.001,h=3);
        }
        translate([-8,6.5,-0.001])
            cylinder(d1=3.5,d2=5,h=3.002);
        translate([8,6.5,-0.001])
            cylinder(d1=3.5,d2=5,h=3.002);
    }
}

module z_pen_top()
{
    difference()
    {
        union()
        {
            z_pen_bearing_holder(10);
            translate([-16,1.5,0])
                cube([32,2,10]);
        }
        translate([-5,-1.501,5])
            rotate([-90,0,0])
            {
                cylinder(d=3.5,h=5.002);
                cylinder(d1=6,d=3,h=3);
            }
        translate([5,-1.501,5])
            rotate([-90,0,0])
            {
                cylinder(d=3.5,h=5.002);
                 cylinder(d1=6,d=3,h=3);
            }
    }
}

module z_pen_bottom_holder()
{
    z_pen_bearing_holder(7);
    difference()
    {
        hull()
        {
            translate([20,6,0])
                cylinder(d=0.001,h=3);
            translate([-16,1.5,0])
                cube([32,1,3]);
            translate([-20,6,0])
                cylinder(d=0.001,h=3);
            translate([0,7,0])
                cylinder(d=5,h=3);
        }

        translate([0,7,-0.001])
            cylinder(d=2,h=3.002);
    }    
}

z_pen_bottom_holder();

translate([0,15,0])
    z_pen_bearing_holder(7);
translate([0,30,0])
{
    z_pen_top();
}
translate([0,45,0])
{
    z_pen_bottom();
}


//translate([10,0,0])
//    rotate([90,0,-90])

translate([30,60,0])
    rotate([0,0,90])
        z_pen_lock();

module z_pen_lock()
{
    difference()
    {
        union()
        {
            translate([4,21,0])
                cylinder(d=8,h=20);
            cube([2.5,21,20]);
            translate([4,22.5,0])
                cube([13.5,2.5,20]);
            translate([17.5,26.5,0])
                cylinder(d=8,h=20);
            translate([19,26.5,0])
                cube([2.5,10,20]);
            translate([21.5,36.5,0])
                rotate([0,0,20])
                    translate([-2.5,0,0])
                        cube([2.5,25,20]);
        }
        hull()
        {
            translate([4,21,-0.001])
                cylinder(d=3,h=20.002);
            translate([2.5,0,-0.001])
                cylinder(d=0.001,h=20.002);
            translate([20,22.5,-0.001])
                cylinder(d=0.001,h=20.002);
        }
        hull()
        {
            translate([17.5,26.5,0])
                cylinder(d=3,h=20.002);
            translate([0,25,-0.001])
                cylinder(d=0.001,h=20.002);
            translate([19,35,-0.001])
                cylinder(d=0.001,h=20.002);
        }
        translate([-0.001,5,15])
            rotate([0,90,0])
                cylinder(d=3.5,h=2.502);
        translate([-0.001,5,5])
            rotate([0,90,0])
                cylinder(d=3.5,h=2.502);

    }
    translate([12.5,22.5,2])
        sphere(d=4);
    translate([12.5,22.5,18])
        sphere(d=4);
}
