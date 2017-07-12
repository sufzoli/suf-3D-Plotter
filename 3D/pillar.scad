$fn=100;
include <pillar_config.scad>
module pillar()
{
    // back plate
    translate([m_size * -0.5 - wall,0])
    {
        cube([m_size+wall*2, m_size + height_clerance + rod_dia + wall * 2, wall]);
    }

    // upper rod holder
    difference()
    {
        union()
        {
            translate([m_size * -0.5 - wall,height_clerance + m_size - rod_dia/2 - wall ,0])
                cube([m_size+wall*2,rod_dia *1.5 + wall * 3,(rod_dia + wall * 2)/2 + wall]);
            translate([m_size * -0.5 - wall,height_clerance + m_size + wall + rod_dia/2,wall * 2 +rod_dia/2])
                rotate([0,90,0])
                    cylinder(h=m_size+wall*2, d = rod_dia + wall * 2);
        }
        translate([m_size * -0.5 - wall,height_clerance + m_size - rod_dia/2 - wall ,wall *2 +rod_dia/2])
        rotate([0,90,0])
            cylinder(h=m_size+wall*2 + 0.001, d = rod_dia + wall * 2);
        // upper rod hole
        translate([0,height_clerance + m_size + wall + rod_dia/2,wall * 2 +rod_dia/2])
            rotate([0,90,0])
                cylinder(h=m_size/2+wall+0.001, d = rod_dia);    
    }
    // Outer support
    hull()
    {
        translate([m_size * -0.5 - wall,height_clerance + m_size + wall + rod_dia/2,wall * 2 +rod_dia/2])
            rotate([0,90,0])
                cylinder(h=wall, d = rod_dia + wall * 2);
        translate([m_size * -0.5 - wall,0])
            cube([wall, m_size + height_clerance + rod_dia + wall * 2, wall]);
        translate([m_size * -0.5 - wall,0])
            cube([wall,wall,m_size+wall*2]);
    }
    difference()
    {
        union()
        {
            // lower rod holder
            translate([m_size * -0.5 - wall,height_clerance - wall - rod_dia/2,wall *2 +rod_dia/2])
                rotate([0,90,0])
                    cylinder(h=m_size+wall*2, d = rod_dia + wall * 2);
            difference()
            {
                translate([m_size * -0.5 - wall,height_clerance - wall *3  - rod_dia*1.5,0])
                    cube([m_size+wall*2,(rod_dia + wall * 2)*2,(rod_dia + wall * 2)/2 + wall]);
                translate([m_size * -0.5,height_clerance + wall + rod_dia/2,wall *2 +rod_dia/2])
                    rotate([0,90,0])
                        cylinder(h=m_size + wall + 0.001, d = rod_dia + wall * 2);
                translate([m_size * -0.5,height_clerance - wall *3 - rod_dia*1.5, wall *2 +rod_dia/2])
                    rotate([0,90,0])
                        cylinder(h=m_size, d = rod_dia + wall * 2);
            }    
            // Inner support
            hull()
            {
                translate([m_size * 0.5,height_clerance - wall - rod_dia/2,wall * 2 +rod_dia/2])
                    rotate([0,90,0])
                        cylinder(h=wall, d = rod_dia + wall * 2);
                translate([m_size * 0.5,0])
                    cube([wall, height_clerance, wall]);
                translate([m_size * 0.5,0])
                    cube([wall,wall,rod_dia + wall*3]); // m_size+
            }
        }
        // lower rod hole
        translate([0,height_clerance - wall - rod_dia/2,wall *2 +rod_dia/2])
            rotate([0,90,0])
                cylinder(h=m_size/2+wall+0.001, d = rod_dia);
    }
    difference()
    {
        // base plate
        translate([m_size * -0.5 - wall,0])
            cube([m_size+wall*2,wall,m_size+wall*2]);
        // base mounting holes
        translate([-15,-0.001,m_size /2 + wall-15])
            rotate([-90,0,0])
                cylinder(d=4.5,h= block_heigth + 0.002);
        translate([-15,-0.001,m_size /2 + wall+15])
            rotate([-90,0,0])
                cylinder(d=4.5,h= block_heigth + 0.002);
        translate([15,-0.001,m_size /2 + wall-15])
            rotate([-90,0,0])
                cylinder(d=4.5,h= block_heigth + 0.002);
        translate([15,-0.001,m_size /2 + wall+15])
            rotate([-90,0,0])
                cylinder(d=4.5,h= block_heigth + 0.002);
        
        /*
        translate([0,0,m_size /2 + wall])
            rotate([-90,0,0])
                for(i=[0:3])
                {
                    rotate([0,0,45 + 90 * i])
                    {
                        translate([bolt_circle_dia / 2, 0,-0.001])
                        {
                            cylinder(d=bolt_dia,h= block_heigth + 0.002);
                        }
                    }
                }
        */
    }
}

module pillar_right()
{
    difference()
    {
        mirror([1,0,0])
            pillar();
        translate([0,(m_size * 0.5) + height_clerance,0])
        {
            // Motor mount holes
            for(i=[0:3])
            {
                rotate([0,0,45 + 90 * i])
                {
                    translate([bolt_circle_dia / 2, 0,-0.001])
                    {
                        cylinder(d=bolt_dia,h= block_heigth *2);
                        translate([0, 0,wall])
                            cylinder(d=bolt_dia*2,h= block_heigth *2);
                    }
                }
            }
            // Motor center hole
            translate([0,0,-0.001])
            {
                cylinder(d=hole_dia,h= wall + 0.002);
            }
        }
    }
}

module pillar_left()
{
    difference()
    {
        union()
        {
            pillar();
            translate([0,(m_size * 0.5) + height_clerance,0])
                cylinder(d=gear_hole_dia*2,h= wall + 5);
        }
        translate([0,(m_size * 0.5) + height_clerance,0])
        {
            // Motor mount holes
            for(i=[0:3])
            {
                rotate([0,0,45 + 90 * i])
                {
                    translate([bolt_circle_dia / 2, 0,-0.001])
                    {
                        cylinder(d=bolt_dia,h= block_heigth *2);
                        translate([0, 0,wall])
                            cylinder(d=bolt_dia*2,h= block_heigth *2);
                    }
                }
            }
            // Gear mount hole
            translate([0,0,-0.001])
            {
                cylinder(d=gear_hole_dia,h= wall + 5.002);
            }
        }
    }
}

translate([m_size * 0.5 + wall,0,0])
    pillar_right();
translate([m_size * 1.5 + wall*3 + 3,0,0])
    pillar_left();