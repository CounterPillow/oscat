module torus(inner_diameter, outer_diameter, center=false) {
    assert(outer_diameter - inner_diameter > 0,
        "outer_diameter cannot be smaller or equal to inner_diameter");
    tube_diam = (outer_diameter - inner_diameter) / 2;
    off = center ? 0 : inner_diameter / 2 + tube_diam;
    off_z = center ? 0 : tube_diam / 2;
    translate([off, off, off_z])
        rotate_extrude(angle=360, convexity=4)
        translate([inner_diameter / 2 + tube_diam / 2, 0, 0])
        circle(d=tube_diam);
}

module toruspipe(inner_diameter, outer_diameter, height=1, center=false) {
    assert(outer_diameter - inner_diameter > 0,
        "outer_diameter cannot be smaller or equal to inner_diameter");
    assert(height >= 0, "height must be a non-negative value");
    tube_diam = (outer_diameter - inner_diameter) / 2;
    off = center ? 0 : outer_diameter / 2;
    translate([off, off, center ? 0 : tube_diam / 2])
        union() {
            difference() {
                cylinder(d=outer_diameter, h=height, center=center);
                // 1.01 as safety margin for z fighting
                translate([0, 0, center ? 0 : height*-0.005])
                    cylinder(d=inner_diameter, h=height*1.01, center=center);
            }
            translate([0, 0, center ? height / 2 : height])
                torus(inner_diameter, outer_diameter, center=true);
            translate([0, 0, center ? - height / 2 : 0])
                torus(inner_diameter, outer_diameter, center=true);
        }
}
