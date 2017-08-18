$fn=100;

screw_height=17;
module nut_holder()
{
    l=25;
    difference()
    {
        translate([-9,0,0])
            cube([18,l,screw_height + 5]);

        translate([-5.5,8,screw_height])
            cube([11,1.5,5.001]);
        translate([0,8,screw_height])
            rotate([-90,0,0])
                cylinder(d=11,h=1.5);

        translate([-4,-0.001,screw_height])
            cube([8,6.002,5.001]);
        translate([0,-0.001,screw_height])
            rotate([-90,30,0])
                cylinder(d=9.25,h=6.002,$fn=6);
        
        
        translate([0,6,screw_height])
            rotate([-90,30,0])
                cylinder(d1=9.25,d2=6.95,h=2.001,$fn=6);

        hull()
        {
            translate([-4,6,screw_height])
                cube([8,0.001,5.001]);
            translate([-3,8,screw_height])
                cube([6,0.001,5.001]);
        }
        
        
        
        translate([0,9.499,screw_height])
            rotate([-90,30,0])
                cylinder(d=9.25,h=l-9.498,$fn=6);        
        translate([-4,9.499,screw_height])
            cube([8,l-9.498,5.001]);



/*
        for(i=[-8.5,8.5])
            for(j=[4,l-4])
                translate([i,j,-0.001])
                    cylinder(d=3.5,h=screw_height + 5.002);
*/        
    }
}

nut_holder();