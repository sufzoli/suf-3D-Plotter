include <pillar_config.scad>

pillar_width=m_size+wall*2;
rod_displacement=wall *2 +rod_dia/2;
lower_rod_height=height_clerance - wall - rod_dia/2;
upper_rod_height=height_clerance + m_size + wall + rod_dia/2;
xdrive_height = height_clerance + m_size/2;