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
    <-130, 100, 65>
    color rgb <1, 1, 1>
    parallel
    photons{
        refraction on
        reflection on
    }
}

//Camera 
camera {
    location <0,110,110>
    look_at <0,5,0>
    right x*image_width/image_height
}
  
//############################################################################
//Basic ring components
//############################################################################ 

#declare basic_ring=
merge {
    cylinder{ <0,0.02,0>,<0,0.03,0>, 0.2
        pigment {White}
    } 
    cylinder{ <0,0.02,0>,<0,0.031,0>, 0.1
        pigment {Black}
    }
}

#declare full_ring=
union{ 
    object{basic_ring
    }
    #local A = radians(30);
    #local X = 0.001*cos(A);
    #local Z = 0.001*sin(A);
    #for (i, 1, 35, 1)
        object { 
            basic_ring
            translate <X,0.002*i,Z>
        }
        #local A = radians(degrees(A)-10);
        #local X = X+0.25*cos(A);
        #local Z = Z+0.25*sin(A);
    #end
    difference{
        object { 
            basic_ring
            translate <X,0.002*i,Z>
        }
        cylinder{ <0,0.002*i-0.1,0>,<0,0.002*i+0.1,0>, 0.2
            pigment {White transmit 1}
        }
    }
}

#declare basic_circle=
union{
    cylinder { <0,0,0>,<0,0.01,0>, 1 
        pigment {Black}
    }
    object {
        full_ring
        scale 0.625        
        translate <0.75*cos(radians(120)),0,0.95*sin(radians(120))>        
    }
    object {
        full_ring
        scale 0.47        
        translate <0.565*cos(radians(120)),0,0.72*sin(radians(120))>
        rotate <0,5,0>        
    }
}

//############################################################################
//Flower components
//############################################################################ 

#declare flower_arm=
union{ 
    object{basic_circle
        scale 0.01
    }
    #local A = radians(30);
    #local X = 0.001*cos(A);
    #local Z = 0.001*sin(A);
    #for (i, 0.1, 1.2, 0.05)
        object { 
            basic_circle
            translate <X,-0.9*i,Z>
            scale i
        }
        #local A = radians(degrees(A)-10);
        #local X = X+0.6*cos(A);
        #local Z = Z+0.6*sin(A);
    #end
}

object {flower_arm}


#declare flower_staircase =
union {
    #for (i, 1, 720, 1.5)
        object {
            flower_arm
            rotate <10,10*i,10>
            translate <0,0.25*i,0>
        }        
    #end 
    scale <2,1,2>
}                     

#declare flower_floor =
union {
    #for (i, 1, 36, 1.5)
        object {
            flower_arm
            rotate <10,10*i,10>
            translate <0,0.15*i,0>
        }        
    #end
    scale <50,1,50>
    rotate <0,55,0>
}
 
union {
    object{flower_staircase}
    object{flower_floor}
} 