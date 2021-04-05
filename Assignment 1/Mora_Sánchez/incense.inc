#include "colors.inc"   
#include "glass.inc"
#include "woods.inc"

#declare P_WoodGrain10A =
pigment {
    wood  
    turbulence 0.02
    octaves 2
    lambda 3
    scale 0.7
}

#declare M_Wood10A = 
color_map { 
    [0.0, 1.0 color rgb <0.99, 0.87, 0.70>
              color rgb <0.99, 0.87, 0.70>]
    [0.5, 0.7 color rgb <0.99, 0.87, 0.70>
              color rgb <0.99, 0.87, 0.70>]
    [0.7, 1.0 color rgb <0.99, 0.87, 0.70>
              color rgb <0.99, 0.87, 0.70>]
}
#declare M_Wood10B = 
color_map { 
    [0.0, 0.3 color rgbt <1.00, 0.78, 0.44, 0.60>
              color rgbt <0.99, 0.82, 0.58, 0.40>]
    [0.3, 0.7 color rgbt <0.99, 0.82, 0.58, 0.40>
              color rgbt <0.99, 0.82, 0.58, 0.40>]
    [0.7, 1.0 color rgbt <0.99, 0.82, 0.58, 0.40>
              color rgbt <0.99, 0.82, 0.58, 0.40>]
}

#declare P_WoodGrain10B =
pigment {
    wood
    turbulence 0.025
    octaves 2
    lambda 2.8
    scale 0.7
    rotate <2, 2, 0>
    translate <0.0175, 0.0175, 0.0175>
}

#declare T_Wood10 = 
    texture {  pigment{ P_WoodGrain10A color_map { M_Wood10A }}} 
    texture {  pigment{ P_WoodGrain10B color_map { M_Wood10B }}}

#declare wooden_box = 
union{
    difference{
        box {
            <0, 0, 0> <10, 10, 8>
            texture { T_Wood10
                finish {  
                    ambient 0.3
                    brilliance 0.8
                    diffuse 0.8
                    specular 0.6
                    }
                scale<1.5,1,1>
                rotate <90, 20, 92>
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
        material{
            texture{
                pigment{rgb <0.75,0.75, 0.75>}
                finish{
                    ambient 0.2
                    brilliance 0.9
                    diffuse 0.2
                    specular 0.5 
                }
            }
        }
    }
}
 
#declare glass_cylinder = 
difference {
    cylinder{<5,0.01,4>,<5,8,4>, 2.499
        material{
            texture{
                pigment{rgbf <1, 1, 1, 0.7>}
                finish{
                    specular 1
                    roughness 0.001
                    ambient 0
                    brilliance 0.2
                    diffuse 0
                    reflection 0.05
                    refraction 1
                    phong 0.8
                    phong_size 250
                }
            }
            interior{
                ior 1.5
            }
        }
        photons { 
            target
            refraction on
            reflection on
        } 
    }
    cylinder{<5,7.9,4>,<5,8.1,4> 2.499
        pigment{transmit 1}
    }             
}

#declare green_goo =
cylinder {<5,0.02,4>,<5,2.125,4> 2.498
    texture{  
        pigment{rgb <0.645, 0.831, 0.268>}
        finish {
            specular 0.6
            brilliance 0.4
            ambient 0.1
            phong 0.1
            phong_size 5000
        }
        normal{
            ripples 0.3
            scale 0.25
            turbulence 0.75
            translate< 1,0,2>
        }
    }
    interior{
        ior 1.3    
    }
    photons { 
        target
        reflection on
    }
}

#declare incense =
cylinder{<0,0,0>,<0,27,0> 0.2
    texture{T_Wood7}
}             

#declare incense_burner =
union {
    object{wooden_box}
    object{glass_cylinder}
    object{green_goo}
    object{incense
        scale<1,0.88,1>
        translate<6.7,-1,4.8>
        rotate<-5,0,15>    
    }
    object{incense
        scale<1,1,1>
        translate<5.6,-1,2.9>
        rotate<10,0,5>    
    }
    object{incense
        scale<1,0.97,1>
        translate<2.5,-1,4.3>
        rotate<-5,0,-15>    
    }
}