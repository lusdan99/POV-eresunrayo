//############################################################################
//Imports
//############################################################################

#include "colors.inc"
#include "textures.inc"
#include "woods.inc"

//############################################################################
//Scene setting
//############################################################################

//Light source
light_source {
    <-5, 10, -5>
    color rgb <1, 1, 1>
    parallel
    photons{
        refraction on
        reflection on
    }
}

//Camera 
camera {
    location <0,0.8,1.5>
    look_at <0,0.8,0>
    right x*image_width/image_height
}

//Floor
/*plane { 
    <0,-1,0>, 0 
    texture {
        pigment {
            color rgb <1, 1, 1> 		
        }
        finish {
			diffuse 1.0
        } 
    }
}*/
  
//############################################################################
//Basic ring components
//############################################################################ 
 
#declare ufo_top=
intersection {
    difference {
        sphere { 
            <0,0,0>, 1 
            pigment {Red}
        }  
        plane {
            y, 0.8
            pigment {transmit 1}
        }
    } 
    plane {
        y, 0.96
        pigment {transmit 1}
    }  
}

#declare ufo_base=
object {
    ufo_top
    scale <1,0.8,1>
    rotate <180,0,0>
    translate <0,0.8+0.8*0.8,0>
}

#declare ufo_base_edge=
cylinder { 
    <0,-0.005,0>,<0,0.005,0>, 0.6+0.015 
    pigment { Green }
    translate <0,0.8,0>
}

#declare ufo_body=
union {
    object {ufo_top}
    object {ufo_base_edge}
    object {ufo_base}
}
 
object {ufo_body}