$fn = 100;

block_height = 12.5;
belt_hegiht = 7;
wall_thick = 3;
belt_thick2 = 2.8;
module tb_lock()
{
    difference()
    {
        translate([2,2,0])
            minkowski()
            {
                cube([26,26,wall_thick/2]);
                cylinder(d=4,h=wall_thick/2);
            }
            /*
        for(i=[5,45])
            for(j=[5,25])
                translate([i,j,-0.001])
                    cylinder(d=3.5,h=wall_thick+0.002);
            */
        translate([5,5,-0.001])
            cylinder(d=3.5,h=wall_thick+0.002);
        translate([5,20,-0.001])
            cylinder(d=3.5,h=wall_thick+0.002);
        translate([25,5,-0.001])
            cylinder(d=3.5,h=wall_thick+0.002);
    }
        
    hull()
    {    
        translate([38,26,0])    
            cylinder(d=4,h=block_height);
        translate([12+wall_thick+belt_thick2,26,0])    
            cylinder(d=4,h=block_height);
        translate([12+wall_thick+belt_thick2,12,0])    
            cylinder(d=4,h=block_height);
    }    
        
    translate([10+wall_thick+belt_thick2/2,belt_thick2/2+4,0])    
        cylinder(d=6,h=block_height);

    hull()
    {
        translate([10+wall_thick+belt_thick2/2,belt_thick2/2+4,0])    
            cylinder(d=belt_thick2+8,h=block_height-belt_hegiht);
        translate([10+wall_thick+belt_thick2/2,30-belt_thick2/2-6,0])    
            cylinder(d=belt_thick2+8,h=block_height-belt_hegiht);    
    }


    hull()
    {
    translate([10+wall_thick-2,28,0])    
        cylinder(d=4,h=block_height);    
    translate([10+wall_thick-2,12,0])    
        cylinder(d=4,h=block_height);
    }

    hull()
    {    
        translate([38,26,0])    
            cylinder(d=4,h=block_height-belt_hegiht);
        translate([38,28,0])    
            cylinder(d=4,h=block_height-belt_hegiht);
        translate([12+wall_thick+belt_thick2,12,0])    
            cylinder(d=4,h=block_height-belt_hegiht);
        translate([10+wall_thick-2,28,0])    
            cylinder(d=4,h=block_height-belt_hegiht);
        translate([10+wall_thick-2,12,0])    
            cylinder(d=4,h=block_height-belt_hegiht);
    }
}

tb_lock();
translate([0,62,0])
    mirror([0,1,0])
        tb_lock();
