#include "oasis_grass.inc"

#declare oasis_water= 
cylinder{
    <0,0,0>,<0,1,0>,1
    texture{
        pigment{rgbf <0.180, 0.541, 0.454, 0.6>}
        finish {
            ambient 0.15
            diffuse 0.7
            brilliance 6.0
            phong 0.8
            phong_size 12
            reflection 0.2
        }
    }
    normal{ 
        bumps 0.6
        scale <1,0.25,0.25>*0.5
        turbulence 0.2
    }
    scale <2.5,1,1.5>
    translate<3.5,-0.98,5.8>
}

#declare oasis=
union {
    object{
        MakePrairie(lPatch,nxPrairie,addPatches,nzPrairie,objectPatch,rd,stdscale,stdrotate,doTest)
        texture{
            T_Grass 
            scale 40
        }
        scale <0.01,0.005,0.005>
        translate <4,0.1,6.5>
    }
    object{
        MakePrairie(lPatch,nxPrairie,addPatches,nzPrairie,objectPatch,rd,stdscale,stdrotate,doTest)
        texture{
            T_Grass 
            scale 40
        }
        scale <0.005,0.0075,0.005>
        translate <5.75,0.125,5.5>
    }
    object{
        MakePrairie(lPatch,nxPrairie,addPatches,nzPrairie,objectPatch,rd,stdscale,stdrotate,doTest)
        texture{
            T_Grass 
            scale 40
        }
        scale <0.007,0.005,0.005>
        translate <3.7,0,3.8>
    }
    object{oasis_water}
}