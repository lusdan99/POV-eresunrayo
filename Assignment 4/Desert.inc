#declare wvs = 
normal {
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

#declare sand1 = 
texture {
    pigment {
        colour rgb <0.75,0.55,0.35>
    }
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

#declare desert=   
height_field {
    png "dunes_heightmap.png"
    smooth
    texture{
        sand1
    }
    photons{
	    target
	    reflection on
	    refraction on
	}
}