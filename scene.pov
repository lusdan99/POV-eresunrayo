#include "colors.inc" 
#include "woods.inc"  
#include "glass.inc" 

light_source {
 <10, 20, 5>
 color rgb <1, 1, 1>
}
 
camera {
 location <5,10,-15>
 //location<0,20,0>
 look_at <0.5,4,0>
}

plane { // Floor
 <0,-1,0>, 0 //Normal and distance
 texture {
 pigment {
  color rgb <1, 1, 1> 		

 }
   finish {
			//brightness 1.0
			diffuse 1.0

		} 
 }
}  

  sky_sphere {
    pigment {   color rgb <0.1, 0.1, 0.1> }
}
  

//##############################################################################
//CAJA
//############################################################################## 
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

 rotate <0,3,0> 
 
 translate <1,0,8>

 scale <0.2, 0.2, 0.2>
} 

//############################################################################################################
//PORTAVELAS
//###########################################################################################################
   
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
        pigment {color rgbf <1, 1.0, 1, 0.4> }
        finish { F_Glass4 }
 
    } 
    interior {I_Glass caustics 1}
     
    }
    normal{wrinkles 0.4 scale 0.5}
    
    
    translate<-10, 0, 10 >
    scale<0.35, 0.2,0.2>


}

//############################################################################
//ROBERTINHO O CUENCO
//############################################################################

#declare base_bowl =
union {
    //Base sides
    difference {
        torus { 4, 2 pigment{White transmit 1}translate <0,0.1,0>}
        torus { 5, 2.825} 
    }
    //Base bottom
    cylinder { <0,-0.69,0>, <0,-0.68,0>, 2.119}   
} 

#declare bowl =
union {
    //Base
    object {base_bowl scale <1,0.6,1>} 
    //Semisphere
    union{        
        intersection {
            sphere { <0,4.5,0>, 4.5  } 
            plane { y, 3.5 pigment{White transmit 1}}
            translate <0,0.08,0>
        }
        intersection {
            sphere { <0,4.5,0>, 4.4 }
            plane { y, 3.5 pigment{White transmit 1}}
            translate <0,0.08,0> 
        }    
        torus { 4.335, 0.047 translate <0,3.58,0>}
    }
}

object {
    bowl 
    translate <8,0.66,-3>
    scale<0.3,0.3,0.3> 
    pigment {White}
    finish{
        ambient 0.3
        brilliance 0.7
        specular 0.9
        phong 0.9
        phong_size 150
        reflection 0.03
        metallic
 
}

}

//###############################################################################
//LAS PELOTAS
//############################################################################### 

#include "textures.inc"
#declare Rnd_1 = seed (547);   
#declare Rnd_2 = seed (837);
#declare Rnd_3 = seed (374);
#declare Rnd_4 = seed (468);
#declare Rnd_5 = seed (646);
// La posicion de la camara
#declare big_ball =
union {
    difference {
        sphere { <0,0,0> 2}
        plane { y, -1.9} 
    }
}

#declare crystal_ball =
union {
    object {big_ball}
    #for (r, 0.01, 0.1, 0.0002)
        #local X = 4*rand(Rnd_1)-2;
        #local Y = 4*rand(Rnd_2)-2;
        #local Z = 4*rand(Rnd_3)-2;
        #local mag = sqrt(X*X+Y*Y+Z*Z);
        #local d = 1.9*rand(Rnd_4)/mag;
        #if (d < 0.3)
            #local d = d*(rand(Rnd_5)+1.5);
        #end
        #local X = X*d;
        #local Y = Y*d;
        #local Z = Z*d;
        sphere { 
            <X,Y,Z> r 
            /*pigment {Orange}
            finish {
                ambient 0.9
                brilliance 1
                diffuse 0 
                reflection 0.2
                specular 1
                roughness 0.01 
            }*/
        }
    #end
}

object{
    crystal_ball 
    translate<-2,1.9,-2>
    scale<0.65, 0.65, 0.65>
    texture{Orange_Glass}
    finish{
        ambient 0
        brilliance 0
        diffuse 0 
        reflection 0.25
        specular 1
        roughness 0.01
        irid {
          0.1
          thickness .8
          turbulence .9
        }
        phong 0.6
        phong_size 500
    }
}

 