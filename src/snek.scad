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
