#include "woods.inc"  
#include "glass.inc"   

#declare T0 = texture { T_Wood9 }

#declare T =
texture { T0
    finish { specular 0.70 roughness 0.5 ambient 0.3 }
}


#declare T3 = texture { T translate -x*10 rotate  <-50, 100, 0> translate z*100}

camera {
 location <6,8,-10>
 look_at <0,1,2>
}
light_source {
 <-20, 24, -20>
 color rgb <1, 1, 1>
}
 
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

<2,0.5,1>, 
<13,20,6>,
0.2

pigment {   color rgb <0.2, 0.4, 0> }


}   

cylinder{

<6,0.5,2>, 
<6,20,8>,
0.2

pigment {   color rgb <0.2, 0.4, 0> }


}

cylinder{

<8,0.5,1>, 
<2,20,6>,
0.2

pigment {   color rgb <0.2, 0.4, 0> }


} 



} 

 rotate <15,0,0> 
 
 translate <1,0,4>

 scale <0.3, 0.3, 0.3>
}
 

sky_sphere {
    pigment {   color rgb <0.4, 0.4, 1> }
}
