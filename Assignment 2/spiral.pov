//############################################################################
//Imports
//############################################################################

#include "textures.inc"

//############################################################################
//Scene setting
//############################################################################

//Light source
light_source {
    <0, 0, 0>
    color rgb <1, 1, 1>
    parallel
    photons{
        refraction on
        reflection on
    }
}

//Camera 
camera {
    location <0,10,0>
    look_at <0,0,0>
    right x*image_width/image_height
}
  
 
#declare lasbolas=
sphere { 
    <0,0,0>, 1
}

#local m = 1; 
#local k = 1;
#local r = 0.15;
#while (r < 2) 
    object{
        lasbolas
        texture {Ruby_Glass
            finish{reflection 1}
        }
        scale<r,r,r> 
        translate<0, 0, m-1>
        rotate<0,k,0>
    }  
    #local m = m*1.02;
    #local k = k+20;
    #local r = r*1.01; 
#end

#local m = 1; 
#local k = 1;
#local r = 0.15;
#while (r < 2) 
    object{
        lasbolas
        texture {Dark_Green_Glass
            finish{reflection 1}
        }
        scale<r,r,r> 
        translate<0, 0, m-1>
        rotate<0,k,0>
    }  
    #local m = m*1.02;
    #local k = k+19;
    #local r = r*1.01; 
#end

#local m = 1; 
#local k = 1;
#local r = 0.15;
#while (r < 2) 
    object{
        lasbolas
        texture {Orange_Glass
            finish{reflection 1}
        }
        scale<r,r,r> 
        translate<0, 0, m-1>
        rotate<0,k,0>
    }  
    #local m = m*1.02;
    #local k = k+21;
    #local r = r*1.01; 
#end 



