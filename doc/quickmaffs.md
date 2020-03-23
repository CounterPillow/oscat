quickmaffs
==========

Various utility math functions.

Function Listing
----------------

### `norm_vec(v)`

Function that returns a normalised version of the input vector (divides each component by the
vector's length). If the vector's euclidean length (magnitude) is 0, it returns the input vector.

* `v`: input vector

### `look_at(v)`

Function that returns a 4x4 "Look At" matrix, for use with `multmatrix`.

* `v`: 3-component vector describing a point in 3d space to look at

#### Example

```
use <quickmaffs.scad>;

// creates a cylinder pointing at [10, 10, 10]
multmatrix(look_at([10, 10, 10])) cylinder(h=5);
```
