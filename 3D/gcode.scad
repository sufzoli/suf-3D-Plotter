$fn=100;
pen_width=0.5;
pen_color= "black";

x_start = 41.916;
y_start = 26.520;
x_end = 42.147;
y_end = 26.709;
i = 0.968;
j = -0.947;

module G2(x_start,y_start,x_end,y_end,i,j)
{
    radius = sqrt(i*i+j*j);
    intersection()
    {
        difference()
        {
            translate([x_start+i,y_start+j,0])
                cylinder(h=0.001,r=radius+pen_width/2);
            translate([x_start+i,y_start+j,-0.001])
                cylinder(h=0.003,r=radius-pen_width/2);
        }
        translate([0,0,-0.001])
            linear_extrude(height=0.003)
                polygon(points = [
                    [x_start+i,y_start+j],
                    [x_start-i,y_start-j],
                    [2*x_end-x_start-i,2*y_end-y_start-j]
                ]);
    }
}

G2(41.916,26.520,42.147,26.709,0.968,-0.947);
G2(42.147,26.709,42.379,26.816,0.490,-0.754);