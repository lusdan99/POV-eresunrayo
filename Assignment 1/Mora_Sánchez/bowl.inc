#declare base_bowl =
union {
    //Base sides
    difference {
        torus { 4, 2 pigment{transmit 1}translate <0,0.1,0>}
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
            plane { y, 3.5 pigment{transmit 1}}
            translate <0,0.08,0>
        }
        intersection {
            sphere { <0,4.5,0>, 4.25 }
            plane { y, 3.5 pigment{transmit 1}}
            translate <0,0.08,0> 
        }    
        torus { 4.255, 0.13 translate <0,3.54,0>}
    }
    material{
        texture{
            pigment{ rgb <1, 1, 1>}
                finish{                 
                    ambient 0.4
                    brilliance 0.7
                    specular 1
                    phong 0.9
                    phong_size 150
                    reflection 0.05
                    metallic
                }
        }       
    }
}