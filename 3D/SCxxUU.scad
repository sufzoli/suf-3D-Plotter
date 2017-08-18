$fn=100;
include <SC6UU_config.scad>

module SCxxUU()
{
    translate([sc_L*-0.5,sc_W*-0.5,0])
        rotate([90,0,90])
            difference()
            {
                linear_extrude(height=sc_L)
                {
                    polygon(points=[[0,0],
                                    [sc_W,0],
                                    [sc_W,sc_T],
                                    [(sc_W+sc_W1)/2,sc_L1],
                                    [(sc_W+sc_W1)/2,sc_G],
                                    [(sc_W+sc_W2)/2,sc_G],
                                    [(sc_W+sc_W3)/2,sc_F],
                                    [(sc_W-sc_W3)/2,sc_F],
                                    [(sc_W-sc_W2)/2,sc_G],
                                    [(sc_W-sc_W1)/2,sc_G],
                                    [(sc_W-sc_W1)/2,sc_L1],
                                    [0,sc_T]]);
                }
                translate([sc_W/2,sc_h,-0.001])
                {
                    cylinder(d=sc_d*2,h=sc_D +0.001);
                }
                translate([sc_W/2,sc_h,sc_L-sc_D])
                {
                    cylinder(d=sc_d*2,h=sc_D +0.001);
                }
                translate([sc_W/2,sc_h,0])
                {
                    cylinder(d=sc_d,h=sc_L);
                }
                translate([sc_K,-0.001,(sc_L-sc_C)/2])
                    rotate([-90,0,0])
                        cylinder(d=sc_S1,h=sc_G+0.002);
                translate([sc_K,-0.001,(sc_L+sc_C)/2])
                    rotate([-90,0,0])
                        cylinder(d=sc_S1,h=sc_G+0.002);
                translate([sc_W-sc_K,-0.001,(sc_L-sc_C)/2])
                    rotate([-90,0,0])
                        cylinder(d=sc_S1,h=sc_G+0.002);
                translate([sc_W-sc_K,-0.001,(sc_L+sc_C)/2])
                    rotate([-90,0,0])
                        cylinder(d=sc_S1,h=sc_G+0.002);
            }
}

SCxxUU();