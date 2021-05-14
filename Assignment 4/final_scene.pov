//############################################################################
//Imports & Materials
//############################################################################

#include "colors.inc"
#include "UFO.inc"
#include "Desert.inc"
#include "Starfield.inc"
#include "Moon.inc"
#include "oasis.inc"
#include "cactus.inc"
#include "vache1_POV_geom.inc"

//############################################################################
//Scene setting
//############################################################################

camera{
    location <0, 4, -8>
    look_at <-0.5, 2.5, 0>
    right x*image_width/image_height
}

light_source{ 
    <-24,12,40> 
    White*0.7
    parallel 
    photons{
        refraction on
        reflection on
    }
}

light_source{
    <-24,12,40> 
    White*0.8
    spotlight              
    radius 10
    falloff 20
    point_at <-30, 15, 50> 
    photons{
        refraction on
        reflection on
    }
}

global_settings {
    photons {
        spacing 0.01
    }
    assumed_gamma 1.0
    max_trace_level 5
}

//############################################################################
//Setting objects
//############################################################################     

object{
    desert
    scale<25,3,25>
    rotate y*-60
    translate<3.5,-2,-10> 
}

object{
    desert
    scale<25,3,25>
    rotate y*-60
    translate<-15,-2.5,-5> 
}

object {
    stars
}

object {
    moon
    no_shadow
    scale 2
    translate <-30, 15, 50>
}
 
//############################################################################
//Scene models
//############################################################################

object {
    ufo
    scale 4
    translate <-0.9,1,1.5>
}

object{
    vache1_
    scale 2
    rotate <0,-90,0>
    translate<-1,-0.5,1>
}

union{
    object{cactusshape}
    object{sombrero}
    scale .1
    rotate <0,15,0>
    translate<-6.5,0,10>
}

object{oasis}   

