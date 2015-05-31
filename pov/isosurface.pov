//isosurface {
//    function { x*2 + y*2 + z*2 - R*R }
//    accuracy 0.001
//    max_gradient 4
//    contained_by{sphere{0,1.2}}
//    pigment {rgb .9}
//    finish {phong 0.5 phong_size 10}
//    }
// sphere {0,1.2 pigment {rgbt <1,0,0,0.9>}}

sphere {0,1
  pigment { function {sin(x*10) + 10*y}
    color_map { [0.0 rgb <1,0,0>]
                [0.5 rgb <1,1,0>]
                [1.0 rgb <1,0,0>]
    }
  }
}
