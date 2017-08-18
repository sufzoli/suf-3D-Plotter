$fn=100;

rod_height=10.5;

module lbh_dual_inline(l=50)
{
    difference()
    {
        translate([-11.5,0,0])
            cube([23,l,rod_height + 5]);
        
        translate([-5.15,3,rod_height])
            cube([10.3,15.3,5.001]);
        translate([0,3,rod_height])
            rotate([-90,0,0])
                cylinder(d=10.3,h=15.3);
        
        translate([-5.15,l-18.3,rod_height])
            cube([10.3,15.3,5.001]);
        translate([0,l-18.3,rod_height])
            rotate([-90,0,0])
                cylinder(d=10.3,h=15.3);
        
        translate([-3.5,-0.001,rod_height])
            cube([7,l+0.002,5.001]);
        translate([0,-0.001,rod_height])
            rotate([-90,0,0])
                cylinder(d=7,h=l+0.002);
        for(i=[-8,8])
            for(j=[4,l-4])
                translate([i,j,-0.001])
                    cylinder(d=3.5,h=rod_height + 5.002);
    }
}

module lbh_single()
{
    difference()
    {
        translate([-12.5,0,0])
            cube([25,21,rod_height + 5]);
        
        translate([-5,3,rod_height])
            cube([10,15,5.001]);
        translate([0,3,rod_height])
            rotate([-90,0,0])
                cylinder(d=10,h=15);

        translate([-3.5,-0.001,rod_height])
            cube([7,21.002,5.001]);
        translate([0,-0.001,rod_height])
            rotate([-90,0,0])
                cylinder(d=7,h=21.002);

        for(i=[-8.5,8.5])
            for(j=[4,17])
                translate([i,j,-0.001])
                    cylinder(d=3.5,h=rod_height + 5.002);
    }
}

module lbh_dual(rod_distance=30)
{
    //rod_distance=30;
    difference()
    {
        translate([-12.5 - rod_distance/2,0,0])
            cube([25 + rod_distance,21,rod_height + 5]);
        
        
        for(i=[-1,1])
        {
            translate([rod_distance/2*i,0,0])
            {
                translate([-5,3,rod_height])
                    cube([10,15,5.001]);
                translate([0,3,rod_height])
                    rotate([-90,0,0])
                        cylinder(d=10,h=15);

                translate([-3.5,-0.001,rod_height])
                    cube([7,21.002,5.001]);
                translate([0,-0.001,rod_height])
                    rotate([-90,0,0])
                        cylinder(d=7,h=21.002);
                    
                for(j=[4,17])
                    translate([i * 8.5,j,-0.001])
                        cylinder(d=3.5,h=rod_height + 5.002);
            }    
        }
/*
        for(i=[-8.5,8.5])
            for(j=[4,17])
                translate([i,j,-0.001])
                    cylinder(d=3.5,h=rod_height + 5.002);
*/
    }
}



lbh_dual_inline();