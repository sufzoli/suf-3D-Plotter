$fn=100;


difference()
{
    translate([-30,-45,0])
        cube([60,90,6]);
    for(i=[-22.5,-7.5,7.5,22.5])
        for(j=[-38.15,-18.15,18.15,38.15])
            translate([i,j,-0.001])
                cylinder(d=5,h=6.002);
    for(i=[-7.5,7.5])
        for(j=[-38.15,38.15])
            translate([i,j,3])
                cylinder(d=10,h=3.001);
    for(i=[-22.5,22.5])
        for(j=[-18.15,18.15])
            translate([i,j,3])
                cylinder(d=10,h=3.001);
}
   