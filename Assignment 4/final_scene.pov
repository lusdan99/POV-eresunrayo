//############################################################################
//Imports & Materials
//############################################################################

#include "colors.inc"
#include "UFO.inc"
#include "Desert.inc"
#include "Starfield.inc"
#include "Moon.inc"
#include "oasis.inc"

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
        spacing 0.005
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
    translate <-1,1,2>
}

object{oasis}