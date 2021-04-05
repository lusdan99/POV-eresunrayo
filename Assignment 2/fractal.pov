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
    <0, 15, 0>
    color rgb <1, 1, 1>
    parallel
    photons{
        refraction on
        reflection on
    }
}

//Camera 
camera {
    location <5,20,0>
    look_at <5,0,0>
    right x*image_width/image_height
}
  
//############################################################################
//Flower parts
//############################################################################ 

#declare basic_circle=
union{
    cylinder { <0,0,0>,<0,0.01,0>, 1 
        texture{ Ruby_Glass}
    }
}

#declare flower_arm=
union{ 
    object{basic_circle
        scale 0.01
    }
    #local A = radians(30);
    #local X = 0.001*cos(A);
    #local Z = 0.001*sin(A);
    #for (i, 0.1, 1, 0.05)
        object { basic_circle
            translate <X,-0.1*i,Z>
            scale i
        }
        #local A = radians(degrees(A)-10);
        #local X = X+0.6*cos(A);
        #local Z = Z+0.6*sin(A);
    #end
}



#declare flower =
union {
    object{flower_arm}
}                     

object{flower}