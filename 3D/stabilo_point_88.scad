$fn=100;

module stabilo()
{
    pen_color = "black";
    color(pen_color)
        cylinder(d=0.8,h=1.1);
    color("silver")
    {
        translate([0,0,1.1])
            cylinder(d=1.1,h=2.5);
        translate([0,0,3.6])
            cylinder(d1=1.1, d2=2.5 ,h=1.7);
    }
    color(pen_color)
    {
        translate([0,0,5.3])
            cylinder(d=4.3,h=4.5);
        translate([0,0,9.8])
            cylinder(d1=4.3,d2=6.2,h=7.1);
        translate([0,0,16.9])
            cylinder(d=6.2,h=2.4);
        translate([0,0,19.3])
            cylinder(d=8,h=0.9);
    }

    color("orange")
        translate([0,0,20.2])
            cylinder(d=9,h=130,$fn=6);
    color(pen_color)
    {
        translate([0,0,150.2])
            cylinder(d=8,h=0.9);
        translate([0,0,151.1])
            cylinder(d=6.2,h=4.8);
    }
}