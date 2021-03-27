//############################################################################
//Imports
//############################################################################

#include "colors.inc" 
#include "woods.inc"  
#include "glass.inc"
#include "crystal_ball.inc"
#include "bowl.inc" 

//############################################################################
//Scene setting
//############################################################################

//Light source
light_source {
    <15, 50, 70>
    color rgb <1, 1, 1>
    parallel
    photons{
        refraction on
        reflection on
    }
}

//Camera 
camera {
    location <0,4,-7>
    look_at <0,2,0>
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

//Background
box {
    <0,0,0>, <1,1,1>
    pigment{color rgb <0.168, 0.180, 0.152>}
    scale <40,13,1>
    rotate <0,-20,0>
    translate <-15,0,15>
}

//############################################################################
//Incense burner
//############################################################################

#declare T0 = texture { T_Wood9 }
#declare T =
texture { T0
    finish { specular 0.70 roughness 0.5 ambient 0.3 }
}


#declare T3 = texture { T translate -x*10 rotate  <-50, 100, 0> translate z*100}

union{ 
difference{
 box {
    <0, 0, 0> <12, 10, 8>
        texture { T_Wood10
            finish { specular 0.2 roughness 0.05 ambient 0.35 }
            translate x*1
            rotate <0, 20, 0>
        }
 
 

  }
 
 union{
   sphere{ <6, 4.5, 4>, 5}
  cylinder{<6,4.5,4>,<6,12,4>, 1.5}
   pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
          finish { F_Glass4 }
          }
 
  
 }

  
union{
difference{

difference{

difference{
    sphere { <6, 4.5, 4>, 5
      // texture { T_Glass4 } interior {I_Glass caustics 1}
      // converted to material 26Sep2008 (jh)
      material {
        texture {
          pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
          finish { F_Glass4 }
          }
        //interior {I_Glass caustics 1}
    }  
    }
    
  union{
    
 cylinder{<6,4.5,4>,<6,12,4>, 2}
   pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
          finish { F_Glass4 }
          }
 
  box {
    <0, 0, 0> <12, 0.5, 8>
    texture {
    T3
 
    }
  }
 
          
 }        
 
 
 }
 

 sphere{<6,4.5,4>, 4.5
 
 texture {
          pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
          finish { F_Glass4 }
          }
 
 }

}
 
cylinder{

<5,0.5,1>, 
<12,30,7>,
0.2

pigment {   color rgb <0.2, 0.4, 0> }


}   

cylinder{

<6,0.5,2>, 
<6,30,8>,
0.2

pigment {   color rgb <0.2, 0.4, 0> }


}

cylinder{

<8,0.5,1>, 
<0,30,6>,
0.2

pigment {   color rgb <0.2, 0.4, 0> }


} 



} 

 rotate <0,15,0> 
 
 translate <-3,0,8>

 scale <0.2, 0.2, 0.2>
} 

//############################################################################
//Candle holder
//############################################################################  
 
union{

difference{
 
    union{
      prism {
        linear_sweep
        linear_spline
        0, 
        16.5, 
        4,
        <6,0>, <0,10>, <12,10>, <6,0>  
    
     } 
     
        prism{
        
        linear_sweep
        linear_spline
        0, 
        20, 
        4,
        <6,13>, <0,3>, <12,3>, <6,13> 
        }
     

        prism{
        
        linear_sweep
        linear_spline
        0, 
        15, 
        7,
        <3,2>, <0.5,7>, <3,12>, <9,12>, <11.5,7>,<9,2>, <3,2>  
        }
     

      
     
    }
    
    intersection{
    
        prism {
        linear_sweep
        linear_spline
        3, 
        23, 
        4,
        <6,0>, <0,10>, <12,10>, <6,0>  
    
     } 
     
        prism{
        
        linear_sweep
        linear_spline
        3, 
        23, 
        4,
        <6,13>, <0,3>, <12,3>, <6,13> 
        }     
        

     

    
    } 
   
   
      prism {
        linear_sweep
        linear_spline
        16.6, 
        23.5, 
        4,
        <6,0>, <0,9.75>, <12,9.75>, <6,0>

    
     }
     
        
       box {
    <5, 20, 1> <7, 0, 0>

   } 
   
   
          box {
    <5, 23, 13> <7, 0, 12>

   }
     
   
   
   
   
  
        prism {
        linear_sweep
        linear_spline
        -1, 
        23.5, 
        5,
        <1.5,2>, <0,5>, <-2,5>, <-2,2>, <1.5,2>

    
     }
    
    
     
        prism {
        linear_sweep
        linear_spline
        -1, 
        23.5, 
        5,
        <10.5,2>, <12,5>, <14,5>, <14,2>, <10.5,2>
  
    
     }
      
      
              prism {
        linear_sweep
        linear_spline
        -1, 
        23.5, 
        5,
        <1.5,12>, <0,9>, <-2,9>, <-2,12>, <1.5,12>

    
     }
     
     
              prism {
        linear_sweep
        linear_spline
        -1, 
        23.5, 
        5,
        <10.5,12>, <11.5,9>, <14,9>, <14,12>, <10.5,12>

     }
     
     
    
     
     
}
      
      material{
       texture {
        pigment {color rgbf <1, 1.0, 1, 1> }
        finish { refraction 1
                 reflection 0.1
                 specular 1
                 ambient 0.3    }
 
    } 
    interior {
            I_Glass caustics 1
        }
    }    
    photons { 
        target
        refraction on
        reflection on
    }
     
    
    normal{wrinkles 0.4 scale 0.55}
    
    
    translate<-12, 0, 17 >
    scale<0.25, 0.17,0.15>
    }



//############################################################################
//White bowl
//############################################################################

object {
    bowl 
    translate <6.2,0.66,-5.6>
    scale<0.25,0.25,0.25> 
}

//###############################################################################
//Crystal ball
//############################################################################### 

object {
    crystal_ball
    translate<-3,1.9,-1.1>
    scale<0.575, 0.575 0.575>
}
 
//###############################################################################
//Photons settings
//###############################################################################  
 
global_settings {
    photons {
        spacing 0.005
    }
    assumed_gamma 1.0
    max_trace_level 5
}


 