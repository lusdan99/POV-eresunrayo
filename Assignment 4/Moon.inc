#declare moon=
sphere{ 
    <0,0,0>, 1.5
    texture{  
        pigment{
            average 
            pigment_map{
                [1 bozo color_map{
                    [.7 rgb <0.75,0.75,0.70>]
                    [.85 rgb <0.75,0.75,0.70>*.5]
                }
                turbulence 1 
                octaves 8 
                omega .8 
                lambda 3
                scale .5]
                [1 leopard color_map{
                    [.3 rgb <0.75,0.75,0.70>]
                    [.5 rgb <0.75,0.75,0.70>*.5]
                    [.7 rgb <0.75,0.75,0.70>]
                }
                turbulence .2 
                octaves 8 
                omega .8 
                lambda 3
                scale .2]
                [1 leopard color_map{
                    [.2 rgb <0.75,0.75,0.70>]
                    [.4 rgb <0.75,0.75,0.70>*.5]
                    [.5 rgb <0.75,0.75,0.70>]
                }
                turbulence .2 
                octaves 8 
                omega .8 
                lambda 3
                scale .07]
                [1 granite color_map{
                    [0 rgb <0.75,0.75,0.70>]
                    [1 rgb <0.75,0.75,0.70>*.5]
                }
                scale .1]
            }
        }
        finish{
            ambient 0.55 
            diffuse .6 
            brilliance .3
        }   
        normal{ 
            wrinkles 0.3 
            scale 0.10
        }
    }
    photons{
	    target
	    reflection on
	    refraction on
	}
}