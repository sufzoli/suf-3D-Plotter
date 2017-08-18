
block_heigth=25;
hole_dia = 30;
cut_out = 20;
bolt_circle_dia = 43.815;
bolt_dia = 4;
m_size = 42;
$fn=100;

difference()
{
    translate([m_size * -0.5, m_size * -0.5])
    {
        cube([m_size, m_size, block_heigth]);
    }
    translate([0,0,-0.001])
    {
        cylinder(d=hole_dia,h= block_heigth + 0.002);
    }
    translate([0, cut_out * -0.5,-0.001])
    {
        cube([m_size/2 + 0.001, cut_out, block_heigth + 0.002]);
    }
    for(i=[0:3])
    {
        rotate([0,0,45 + 90 * i])
        {
            translate([bolt_circle_dia / 2, 0,-0.001])
            {
                cylinder(d=bolt_dia,h= block_heigth + 0.002);
            }
            translate([bolt_circle_dia / 2 +5, -5,-0.001])
            {
                cube([10, 10, block_heigth + 0.002]);
            }
        }
    }
}