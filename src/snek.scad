use <quickmaffs.scad>;

module snek(path) {
    assert(is_list(path), "path must be a list of [x, y, z, diam] points");
    for(si = [0:len(path) - 1]) {
        s = path[si];
        assert(is_list(s), str(s, " is not a valid point, must be of format [x, y, z, diam]"));
        assert(len(s) == 4, str(s, " is not a valid point, must be of format [x, y, z, diam]"));
        for(i = [0 : 3]) {
            assert(is_num(s[i]), str("Element ", i, " of point ", s, " is not a number"));
        }

        if(si > 0) {
            let(prev_s = path[si - 1])
            let(vec = [s[0], s[1], s[2]] - [prev_s[0], prev_s[1], prev_s[2]])
            let(n_vec = norm_vec(vec))
            let(prev2_s = si > 1 ? path[si - 2] : [0, 0, 0])
            let(prev_vec = si > 1 ? [prev_s[0], prev_s[1], prev_s[2]] - [prev2_s[0], prev2_s[1], prev2_s[2]] : vec)
            translate([prev_s[0], prev_s[1], prev_s[2]])
            multmatrix(look_at(vec)) union() {
                if(si > 1) {
                    translate([0, 0, 0]) sphere(d=prev_s[3]);
                }
                cylinder(h=norm(vec), d1=prev_s[3], d2=s[3]);
            }
        }
    }
}

module snekpipe(wall_thickness, path) {
    difference() {
        snek(path);
        for(s = path) {
            assert(s[3] >= 2 * wall_thickness,
                    str("Segment ", s, " cannot satisfy wall thickness requirements"));
        }
        let(interior = [ for (in_s = path) [in_s[0], in_s[1], in_s[2],
                                            in_s[3] - 2 * wall_thickness]])
        snek(interior);
        // Punch through the start and end with some spheres
        let(fs = path[0])
        translate([fs[0], fs[1], fs[2]]) sphere(d=fs[3] - 2 * wall_thickness);
        let(ls = path[len(path) - 1])
        translate([ls[0], ls[1], ls[2]]) sphere(d=ls[3] - 2 * wall_thickness);
    }
}
