//############################################################################
//Imports & materials
//############################################################################

#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
 
#declare transparent_with_media = material{
	texture {
		pigment {
			rgbt 1 
		}
		finish {
			ambient 0
			diffuse 0
		}
	}
	interior{
		media {
			scattering {
				1, 
				rgb <0.1, 0.1, 0.1>
				extinction 0.000001
			}
			samples 20,50
		}
	}
} 
 
//############################################################################
//Scene setting
//############################################################################

//Light source
light_source {
    <-5, 10, -5>
    color rgb <1, 1, 1>*0.3
    parallel
    photons{
        refraction on
        reflection on
    }
}

//Camera 
camera {
    location <0,0.9,2>
    look_at <0,0.8,0>
    right x*image_width/image_height
}

//Floor
plane { 
    <0,-1,0>, 0 
    texture {
        pigment {
            color rgb <0.8, 0.5, 0.3> 		
        }
        finish {
			diffuse 1.0
        } 
    }
}
  

  
//############################################################################
//Basic ring components
//############################################################################ 
 
#declare ufo_top=
intersection {
    difference {
        sphere { 
            <0,0,0>, 1 
            material{
                texture{  
                    pigment{rgb <0.39, 0.41, 0.43>}
                    finish{
                        ambient 0.2
                        brilliance 3
                        diffuse 0.3
                        specular 1
                        phong 0.9
                        phong_size 20
                        roughness 1/100
                        reflection 0.1
                        metallic
                    }
                }
            }
            photons {
                refraction on
                reflection on
            }
        }  
        plane {
            y, 0.8
            pigment {transmit 1}
        }
    } 
    plane {
        y, 0.96
        pigment {transmit 1}
    }  
}

#declare ufo_base_ring=
#local A = radians(20);
#for (i, 1, 18, 1)
    #local A = radians(degrees(A)+20);
    #local X = 0.5*cos(A);
    #local Z = 0.5*sin(A);
    light_source {
        <1.15*X,0.6,1.1*Z>
        color Cyan
        spotlight
        radius 20
        falloff 35
        point_at <X,0.75,Z>       
        photons{
            refraction on
            reflection on
        }                     
    }     
    sphere { 
        <X,0.75,Z>, 0.03 
        material{
            texture{
                pigment{ rgbf <0.345, 0.968, 0.992, 0.8>}
                finish{                 
                    ambient 0.1
                    diffuse 0.3      
                    reflection 0.3
                    specular 1
                    roughness 0.001
                    phong 0.9
                    phong_size 1
                }
            }    
            interior {
                ior 1
            }
        
        }
        photons { 
            target
            refraction on
            reflection on
        }                        
    }
#end

#declare ufo_base=
union{
    object {
        ufo_top
        scale <1,0.8,1>
        rotate <180,0,0>
        translate <0,0.8+0.8*0.8,0>
    }     
    cylinder { 
        <0,0.68,0>,<0,0.69,0>, 0.3 
        material{
            texture{  
                pigment{rgbf <0.760, 0.866, 0.878, 0.6>}
                finish{
                    ambient 0.1
                    diffuse 0.2
                    refraction 1
                    reflection 0.3
                    specular 1
                    roughness 0.001
                    phong 0.9
                    phong_size 20
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
    light_source{
        <0,0.68,0>
        color Cyan*2
        spotlight
        radius 45
        falloff 60
        tightness 10
        point_at <0, 0, 0>       
        photons{
            refraction on
            reflection on
        }
    } 
}

#declare ufo_base_edge=
cylinder { 
    <0,-0.0075,0>,<0,0.0075,0>, 0.6+0.01 
    material{
        texture{  
            pigment{rgb <0.145, 0.152, 0.149>}
            finish{
                ambient 0.3
                brilliance 0.6
                diffuse 0.3
                specular 1
                phong 0.9
                phong_size 2
                roughness 1/100
                reflection 0.1
                metallic
            }
        }
    }
    photons { 
        refraction on
        reflection on
    }
    translate <0,0.8,0>
}

#declare ufo_cabin=
union{
    difference{
        sphere { 
            <0,0.9,0>, 0.28 
            material{
                texture{  
                    pigment{rgbf <0.760, 0.866, 0.878, 0.4>}
                    finish{
                        ambient 0.1
                        diffuse 0.2
                        refraction 1
                        reflection 0.3
                        specular 1
                        roughness 0.001
                        phong 0.9
                        phong_size 20
                    }
                }
            }
            photons {
                target 
                refraction on
                reflection on
            }
        }  
        plane {
            y, 0.96
            pigment {transmit 1}
        }
    }
    difference{
        torus { 
            0.28,0.015 
            material{
                texture{  
                    pigment{rgb <0.145, 0.152, 0.149>}
                    finish{
                        ambient 0.3
                        brilliance 3
                        diffuse 0.3
                        specular 1
                        phong 0.9
                        phong_size 2
                        roughness 1/100
                        reflection 0.2
                        metallic
                    }
                }
            }
            photons { 
                refraction on
                reflection on
            }
            translate <0,0.96,0>
        }               
        plane {
            y, 0.94
            pigment {transmit 1}
        }
    }
}

#declare ufo=
union {
    object {ufo_cabin}
    object {ufo_top}
    object {ufo_base_edge}
    merge{
        object {ufo_base}
        object {ufo_base_ring}
    }
}
 
object {ufo}  
 
global_settings {
    photons {
        spacing 0.005
    }
    assumed_gamma 1.0
    max_trace_level 5
}

