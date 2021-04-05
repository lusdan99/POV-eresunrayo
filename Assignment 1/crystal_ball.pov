#include "colors.inc"
#include "textures.inc"
#declare Rnd_1 = seed (547);   
#declare Rnd_2 = seed (837);
#declare Rnd_3 = seed (374);
#declare Rnd_4 = seed (468);
#declare Rnd_5 = seed (646);
// La posicion de la camara
camera {
 location <-3,40,50>
 look_at <0,1,0>
}      
plane {
    y, 0
    pigment {White}
}
// Punto de luz
light_source {
 <-2,15,-20>
 color rgb <1,1,1> // White
 photons{
      refraction on
      reflection on
    }
}
#declare big_ball =
union {
    difference {
        sphere { <0,0,0> 2}
        plane { y, -1.9} 
    }
}

#declare crystal_ball =
difference {
    object {big_ball}
    #for (r, 0.01, 0.1, 0.00015)
        #local X = 4*rand(Rnd_1)-2;
        #local Y = 4*rand(Rnd_2)-2;
        #local Z = 4*rand(Rnd_3)-2;
        #local mag = sqrt(X*X+Y*Y+Z*Z);
        #local d = 1.9*rand(Rnd_4)/mag;
        #if (d < 0.5)
            #local d = d*100*(rand(Rnd_5));
        #end
        #local X = X*d;
        #local Y = Y*d;
        #local Z = Z*d;
        sphere {<X,Y,Z> r
            material{
                texture{
                    pigment{ rgbf <0.682, 0.435, 0.219, 0.8>}
                    finish{                 
                        ambient 0.1
                        diffuse 0.1   
                        reflection 0.8
                        specular 1
                        roughness 0.001
                        phong 0.9
                        phong_size 10
                    }
                }    
                interior {
                    ior 1.5
                }
        
            }
            photons { 
                target
                refraction on
                reflection on
            } 
        }
    #end
}

object{
    crystal_ball 
    translate<0,1.9,0>
    material{
        texture{
            pigment{ rgbf <0.474, 0.133, 0.047, 0.9>}
            finish{                 
                ambient 0.15
                diffuse 0.1
                refraction 1
                reflection 0.2
                specular 1
                roughness 0.001
                phong 0.9
                phong_size 200
            }
        }    
        interior {
            ior 1.5
        }
    }    
    photons { 
        target
        refraction on
        reflection on
    }
}

global_settings {
    photons {
        spacing 0.005
    }
    assumed_gamma 1.0
    max_trace_level 5
}
