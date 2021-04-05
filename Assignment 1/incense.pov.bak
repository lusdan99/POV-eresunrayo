#include "colors.inc" 
#include "woods.inc"  
#include "glass.inc"
#include "textures.inc"

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
    location <5,15,-25>
    look_at <5,12,4>
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

#declare T0 = texture { T_Wood9 }
#declare T =
texture { T0
    finish { specular 0.70 roughness 0.5 ambient 0.3 }
}

#declare T3 = texture { T translate -x*10 rotate  <-50, 100, 0> translate z*100}

#declare wooden_box = 
union{
    difference{
        box {
            <0, 0, 0> <10, 10, 8>
            texture { T_Wood10
                finish { specular 0.2 roughness 0.05 ambient 0.35 }
                translate x*1
                rotate <0, 20, 0>
            }
        }
        union{
            cylinder{<5,5,-0.01>,<5,5,8.01>, 3.2}
            cylinder{<5,7,4>,<5,10.01,4>, 1.5}
            cylinder{<5,-0.01,4>,<5,7.9,4>, 2.5}
            texture { T_Wood10}
        }
    }
    difference{
        cylinder{<5,8.4,4>,<5,9.8,4> 1.499}
        cylinder{<5,8.39,4>,<5,9.81,4> 0.9}
        pigment{Grey transmit 0.4}
    }
}
 
#declare glass_cylinder = 
difference {
    cylinder{<5,0.01,4>,<5,8,4>, 2.499
        material{
            texture{Glass}
        }
    }
    cylinder{<5,7.9,4>,<5,8.1,4> 2.499
        pigment{transmit 1}
    }             
}

#declare green_goo =
cylinder {<5,0.02,4>,<5,2,4> 2.498
    texture{  
        pigment{rgb <0.645, 0.831, 0.268>}
        normal{
            ripples 0.3
            scale 0.25
            turbulence 0.75
            translate< 1,0,2>
        }
    }
}

#declare incense =
cylinder{<0,0,0>,<0,27,0> 0.2
    pigment{Green}
}             

#declare incense_burner =
union {
    object{wooden_box}
    object{glass_cylinder}
    object{green_goo}
    object{incense
        translate<6.7,-1,4.8>
        rotate<-5,0,15>    
    }
    object{incense
        translate<4.8,-1,2.3>
        rotate<10,0,-5>    
    }
    object{incense
        translate<2.5,-1,4.3>
        rotate<-5,0,-15>    
    }
}

object{incense_burner}  