/* --------------------------
Entry: 0002
WWW: http://
Title: Eight Tangent Reflecting Spheres
Author: Dave Matthews
OK, you can only see seven of them.  Or, more precisely, you can only see one of them, reflecting the other seven.  So the scene contains the eight reflecting spheres, with reflection set to {1, 0.5} and a tetrahedron of planes, one each, red, green, blue and black, with diffuse set to 1 and reflection to  {1, 0}.  Everything is set to no_image and no_shadow, except, of course, for the sphere in the image, which is just no_shadow.  The camera and white light are at the origin.  I like this image because you can see how it was made by looking at the reflections outside of the main Sierpinski-like fractal.
I wanted to put this into the short code contest, but I didn't have it looking right, and I could only get the version I did have down to about 400 characters.  Tek could probably get it down to 20.
---------------------------*/

#version 3.5;
global_settings {assumed_gamma 1.0 ambient_light 0 max_trace_level 128 adc_bailout .01}
camera {angle 75 location 0 
           up y
           right x*image_width/image_height
           look_at   -y }                          
#declare R = sqrt(3);
#declare CV1 = <0, -1, 2*sqrt(2) >;
#declare CV2 = <sqrt(6), -1, -sqrt(2) >;
#declare CV3 = <-sqrt(6), -1, -sqrt(2) >;
#declare CV4 = <0, 3, 0>;
light_source { 0 color rgb 1 }
#declare Plane_Finish = finish {diffuse 1 reflection {1, 0} }  
#declare Mirror_Finish =  finish {diffuse 0 reflection {1,0.5} }
#declare TetraSpheres1 = union {							sphere { <0, 0, 0> R finish {Mirror_Finish} translate CV1}
sphere { <0, 0, 0> R finish {Mirror_Finish} translate CV2}
sphere { <0, 0, 0> R finish {Mirror_Finish} translate CV3}
sphere { <0, 0, 0> R finish {Mirror_Finish} translate CV4}
};
#declare TetraSpheres2 = union {							sphere { <0, 0, 0> R finish {Mirror_Finish} translate  CV1 no_image}
sphere { <0, 0, 0> R  finish {Mirror_Finish} translate CV2 no_image}
sphere { <0, 0, 0> R  finish {Mirror_Finish} translate  CV3 no_image}
sphere { <0, 0, 0> R   finish {Mirror_Finish} translate CV4}
};
plane { <0, 1, 0>, -10  finish {Plane_Finish}no_image } 
plane { <-3*sqrt(2), -sqrt(3), -sqrt(6) >, -10 
        pigment {color rgb x} finish {Plane_Finish}no_image }
plane { <3*sqrt(2), -sqrt(3), -sqrt(6) >, -10 
        pigment {color rgb y} finish {Plane_Finish} no_image }
plane { <0, -sqrt(3), 2*sqrt(6) >, -10 
        pigment {color rgb z} finish {Plane_Finish} no_image }
object {TetraSpheres1 no_image  no_shadow}
object {TetraSpheres2 rotate <180, 0, 0> no_shadow }