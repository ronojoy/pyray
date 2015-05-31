// Code to demonstrate the use of functions for pigments
#include "colors.inc"

// Lights
light_source{<2, 4, -3>, color White}


// Camera
camera{
  location < 0, 0, -3 >
  look_at  < 0, 0,  0 >
}

// Action!
sphere{
  < 0, 0, 0>, 1
  texture {
    pigment { function {y*y - x*z}
      color_map { [0.0 rgb <1,0,0>]
                [0.5 rgb <1,1,0>]
                [1.0 rgb <1,0,0>]
      }
    }
  }
}
