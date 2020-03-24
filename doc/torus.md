torus
=====

![torus example](img/torus.png)

Generate a torus .

Usage
-----

`torus(inner_diameter, outer_diameter, center=false, angle=360)`

Generate a torus with the specified inner/outer diameter. If center is `false`, the torus will be
positioned such that 0,0,0 is the corner of its bounding box.

* `inner_diameter`: the inner diameter of this torus
* `outer_diameter`: the outer diameter of this torus
* `center`: whether to center the torus *(default: false)*
* `angle`: how much torus you want in your torus *(default: 360, all the torus)*

toruspipe
=========

Generate a torus pipe (a torus with a straight middle section).

Usage
-----

`toruspipe(inner_diameter, outer_diameter, height=1, center=false)`

Generate a hollowed out cylinder with tori capping off the ends. If center is `false`, the
toruspipe will be positioned such that 0,0,0 is the corner of its bounding box.

* `inner_diameter`: the inner diameter of this toruspipe
* `outer_diameter`: the outer diameter of this toruspipe
* `height`: the height of this toruspipe *(default: 1)*
* `center`: whether to center the toruspipe *(default: false)*
