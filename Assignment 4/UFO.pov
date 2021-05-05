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
    location <0,0.8,2>
    look_at <0,0.8,0>
    right x*image_width/image_height
}

//Floor
plane { 
    <0,-1,0>, 0 
    texture {
        pigment {
            color rgb <1, 1, 1> 		
        }
        finish {
			diffuse 1.0
        } 
    }
}
  
//############################################################################
//Basic ring components
//############################################################################ 
 
#declare ufo_base_section=
intersection {
    difference {
        sphere { 
            <0,0,0>, 1 
            pigment {Red}
        }  
        plane {
            y, 0.8
            pigment {Green}
        }
    } 
    plane {
        y, 0.96
        pigment {Blue}
    }  
}


#declare ufo_base_edge=
intersection{
    
}


#declare ufo_base=
union {
    object {ufo_base_section}
    object {ufo_base_section
        scale <1,0.8,1>
        rotate <180,0,0>
        translate <0,1.45,0>
    }
}
 
object {ufo_base}