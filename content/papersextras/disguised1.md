
# Disguised toric dynamical systems 

1. 

2. 

```povray
/*équations :

x^2*y^2-4y^3-4x^3*z-27*z^2+18*x*y*z;# forme 2
 */
#version 3.7;
global_settings {  assumed_gamma 1.0 }
#include "colors.inc"
#include "textures.inc"    // pre-defined scene elements
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
#include "stones.inc"
#declare r=0.02;

// Cameras (to play with)
#declare Cam1 = camera {
  // orthographic
  location <5,4,10>
  look_at <0,0,0>
  // right x*image_width/image_height
  // angle 78
  rotate <90,0,90>
}
#declare Cam2 = camera {
  // orthographic
  location <15,3.5,0.5>
  look_at <0,0,0>
  // right x*image_width/image_height
  // angle 78
  rotate <90,0,90>
}

camera{Cam2} // fast changing camera

// Light sources.
light_source { <9,9,4> color rgb <0.8,0.8,1>*0.5 }
light_source { <10,3,1> color rgb <0.8,0.8,1>*0.5 }


// Coordinate planes.
union{//
  plane{ y,0
    pigment {color rgb <0.3, 0.4, 0.9>}
  }
  plane{ x,0
    pigment {color rgb <0.0, 0.7, 1>}
  }
  plane{ z,0
    pigment {checker
      color rgb <1,1,1>,
      color rgb <0.4, 0.4, 0.4>
      scale 0.5
    }
    finish {ambient 0.8 diffuse 0.4 roughness 0.001 }
  }
  //--------------------------------
  // Discriminant
  union{
    object{
      polynomial {4,
        xyz(2,2,0):1,
        xyz(0,3,0):-4,
        xyz(3,0,1):-4,
        xyz(0,0,2):-27,
        xyz(1,1,1):18}
      texture{
        // pigment{ marble scale 0.5 turbulence 1.15 }//!!!
        pigment{color rgb<0.7,0.8,0.9>}//!!!
      }
      // finish { ambient 0.4 diffuse 0.3 specular 0.5 roughness 0.01  }
    }
    // Segre variety
    object{
      polynomial {2,
        xyz(1,1,0):1,
        xyz(0,0,1):-2}
      texture{
        pigment{ granite color_map{[0.0 rgb<1,1,0.7>][1.0 rgb<0.5,0.3,0>]}
          scale 0.06
        }
      }
      finish { ambient 0.4 diffuse 0.3 specular 0.5 roughness 0.01  }
    }
    clipped_by {sphere{<0,0,0>,5}}
    bounded_by { clipped_by }
  }
  clipped_by {sphere{<0,0,0>,7}}
  bounded_by { clipped_by }
  matrix <
  0,1,0,
  1,0,0,
  0,0,1,
  0,0,0 >
  #declare half = 1;
  #declare maxang = 75;
  #if (clock < half)
    #declare roting = maxang*clock;
  #else
    #declare roting = maxang*(2*half-clock);
  #end
  rotate roting*z
}

text { "times.ttf" "BMO" //   0.5,0
  pigment { White*1.3 }
  scale 0.3
  rotate <30,220,0>
  translate <5.5,3.5,4.5> }
```

