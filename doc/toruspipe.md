torus
=====

![torus example](img/torus.png)

Generate a torus or a torus pipe (a torus with a straight middle section).

Usage
-----

`torus(inner_diameter, outer_diameter, center=false)`

Generate a torus with the specified inner/outer diameter. If center is `false`, the torus will be
positioned such that 0,0,0 is the corner of its bounding box.

* `inner_diameter`: the inner diameter of this torus
* `outer_diameter`: the outer diameter of this torus
* `center`: whether to center the torus *(default: false)*

`toruspipe(inner_diameter, outer_diameter, height=1, center=false)`

Generate a hollowed out cylinder with tori capping off the ends. If center is `false`, the
toruspipe will be positioned such that 0,0,0 is the corner of its bounding box.

* `inner_diameter`: the inner diameter of this toruspipe
* `outer_diameter`: the outer diameter of this toruspipe
* `height`: the height of this toruspipe *(default: 1)*
* `center`: whether to center the toruspipe *(default: false)*
