#include "glass.inc"   

camera {
 location <4,30,-30>
 look_at <0,5,20>
}
light_source {
 <-20, 24, -20>
 color rgb <1, 1, 1>
}

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
        pigment {color rgbf <0.98, 1.0, 0.99, 0.65> }
        finish { F_Glass2 }
 
    } 
     
    }
    normal{wrinkles 0.4 scale 1.0}

} 

  
  
  
  sky_sphere {
    pigment {   color rgb <0.4, 0.4, 1> }
}
