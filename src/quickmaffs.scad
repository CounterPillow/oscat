
// returns the normalised vector of v
function norm_vec(v) = norm(v) > 0 ? v / norm(v) : v;

// returns look_at matrix for [x, y, z]
// how does OpenSCAD not have this? Garbage.
function look_at(v) = 
    let(n_axis = norm_vec([v[0], v[1], v[2]]))
    let(u_axis = norm_vec(cross([0, 0, 1], n_axis)))
    let(v_axis = cross(n_axis, u_axis))
[
    [u_axis[0], v_axis[0], n_axis[0], 0],
    [u_axis[1], v_axis[1], n_axis[1], 0],
    [u_axis[2], v_axis[2], n_axis[2], 0],
    [0, 0, 0, 1]
];
