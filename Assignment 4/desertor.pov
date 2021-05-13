  #include "colors.inc"
  global_settings {
    assumed_gamma 1.6
  }
 
  camera{
    location <-2.5, 2, -9>
    look_at <3, 0.5, 1>
    angle 30
  }
   light_source{ <-5500,5500,35> White }   
   light_source{<12,3,35>, White}
   
   #declare wvs = normal {

	gradient x
	slope_map {
		[0    <0.5, 1>]   
		[0.4 <1.0, 0>]   
		[0.65  <0.5,-1>]   
		[0.85 <0.0, 0>]   
		[1    <0.5, 1>]   
	}
		scale 0.15
		warp { turbulence 0.4 octaves 5 lambda 3.0 }
		scale 1.0/0.15
}

#declare sand1 = texture {
		pigment {colour rgb <0.75,0.55,0.35>}
        normal {
               average
               normal_map {
                          [0.5 wvs 1.0]
                          [0.5 wrinkles 1 scale 0.0025]
                          }
                }
		finish  {
			ambient 0.15
			diffuse 0.8
			}
   }
   
    height_field {
    png "dunes_heightmap.png"
    smooth
    texture{
sand1
   }

    
    
    translate <-.5, 0, -.5>
    scale <17, 1.75, 17>
  }
      
 #include "stars.inc"
sphere{ <0,0,0>, 1
        texture{ Starfield1 scale 0.0000001
               } // end of texture
        scale 10000
      } //end of sphere 



sphere{ <12,3,35>, 1.5
           texture{ 
           
        pigment{colour rgb <0.65,0.65,0.65>}  
        finish{ambient 0.55}
       }
      } //end of sphere


