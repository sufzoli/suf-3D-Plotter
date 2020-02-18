$fn=100;

//        translate([0,0,0])

difference()
{
    cube([60,50,18]);
    translate([-0.001,10,3])
        cube([60.002,40.001,15.001]);
    translate([25.5,-0.001,11])
        cube([9,10.002,7.001]);
    translate([10,35,-0.001])
        cylinder(d=5,h=3.002);
    translate([40,32.75,-0.001])
        cube([20.001,4.5,3.002]);    
}