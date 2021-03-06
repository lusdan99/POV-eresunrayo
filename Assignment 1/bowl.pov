#include "colors.inc"
// La posicion de la camara
camera {
 location <3,10,13>
 look_at <0,2,0>
}
// Punto de luz
light_source {
 <0,100,-60>
 color rgb <1,1,1> // White
}

plane {
    y, 0
    pigment {Red}
}


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
            sphere { <0,4.5,0>, 4.25 }
            plane { y, 3.5 pigment{White transmit 1}}
            translate <0,0.08,0> 
        }    
        torus { 4.255, 0.13 translate <0,3.54,0>}
    }
}

object {
    bowl 
    translate <0,0.66,0>
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