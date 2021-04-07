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

/*
/ This element is the smallest ring visible in the image, the border of the bigger ring
*/
#declare basic_ring=
merge {
    cylinder{ <0,0.02,0>,<0,0.03,0>, 0.2
        pigment {White}
    } 
    cylinder{ <0,0.02,0>,<0,0.031,0>, 0.1
        pigment {Black}
    }
}

/*
/ This is formed by smaller rings, we use the initial angle to calculate where the next basic ring should be placed
/ A total of 36 rings are placed, to make a full circle, although the last one if cut off by another ring to avoid superposition
*/
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

/*
/ The basic circle is a black circle with two concentric rings placed on its edge
*/
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

/*
/ Each arm is formed by basic circles which start out small and then get increasingly bigger
/ Each circle covers the previous one slightly, and its center is calculated depending on the initial angle,
/ which gives it its distinctive petal form
*/
#declare flower_petal=
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

/*
/ The staircase is formed by flower petals, which go around in circles to form a flower that actually goes up in the 
/ y axis. They are also rotated with respect to the X and Z axis in order to make it look smoother and give it more of a 
/ ramp look
*/
#declare flower_staircase =
union {
    #for (i, 1, 720, 1.5)
        object {
            flower_petal
            rotate <10,10*i,10>
            translate <0,0.25*i,0>
        }        
    #end 
    scale <2,1,2>
}                     

/*
/ The floor follows a similar logic to the staircase, except only 36 petals are placed in order to form a circle, it is
/ also scaled so that it covers the entire floor of the image
*/
#declare flower_floor =
union {
    #for (i, 1, 36, 1.5)
        object {
            flower_petal
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