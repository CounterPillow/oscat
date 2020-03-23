module crossbrace(width, height, diameter, flattening=1) {
    module pill(h, d) {
        union() {
            translate([0, 0, h]) sphere(d=d);
            cylinder(h, d=d);
            sphere(d=d);
        }
    }
    s_height = sqrt(width * width + height * height);
    angle = atan2(width, height);
    off = sin(angle) * (s_height / 2);
    difference() {
        scale([flattening, 1, 1]) union() {
            translate([0, off, 0]) rotate([angle, 0, 0]) pill(s_height, diameter);
            translate([0, -off, 0]) rotate([-angle, 0, 0]) pill(s_height, diameter);
        }
        // size increase to account for pill caps
        translate([0, -width / 2 - diameter / 2, - diameter / 2]) cube([diameter/2, width + diameter, height + diameter]);
    }
}