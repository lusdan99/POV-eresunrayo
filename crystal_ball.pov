#include "colors.inc"
#include "textures.inc"
#declare Rnd_1 = seed (547);   
#declare Rnd_2 = seed (837);
#declare Rnd_3 = seed (374);
#declare Rnd_4 = seed (468);
#declare Rnd_5 = seed (646);
// La posicion de la camara
camera {
 location <-3,4,5>
 look_at <0,1,0>
}      
plane {
    y, 0
    pigment {White}
}
// Punto de luz
light_source {
 <-2,20,-10>
 color rgb <1,1,1> // White
}
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
    translate<0,1.9,0>
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

// create a point "spotlight" (conical directed) light source
light_source {
  <0,3,-1>                 // light's position (translated below)
  color rgb <1,1,1>       // light's color
  spotlight               // this kind of light source
  translate <-2, 5, -2> // <x y z> position of light
  point_at <1, 0, 1>      // direction of spotlight
  radius 2                // hotspot (inner, in degrees)
  tightness 80            // tightness of falloff (1...100) lower is softer, higher is tighter
  falloff 8               // intensity falloff radius (outer, in degrees)
}


light_source {
    <0,1.5,-1>
    color rgb <1,1,1>
}
