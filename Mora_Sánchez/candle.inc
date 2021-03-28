#declare candle_holder =
union{
    difference{
        union{
            prism {
                linear_sweep
                linear_spline
                0, 16.5, 4,
                <6,0>, <0,10>, <12,10>, <6,0>  
            } 
            prism{
                linear_sweep
                linear_spline
                0, 20, 4,
                <6,13>, <0,3>, <12,3>, <6,13> 
            }
            prism{
                linear_sweep
                linear_spline
                0, 15, 7,
                <3,2>, <0.5,7>, <3,12>, <9,12>, <11.5,7>,<9,2>, <3,2>  
            } 
        }
        intersection{   
            prism {
                linear_sweep
                linear_spline
                3, 23, 4,
                <6,0>, <0,10>, <12,10>, <6,0>  
            } 
            prism{
                linear_sweep
                linear_spline
                3, 23, 4,
                <6,13>, <0,3>, <12,3>, <6,13> 
            }     
        } 
        prism {
            linear_sweep
            linear_spline
            16.6, 23.5, 4,
            <6,0>, <0,9.75>, <12,9.75>, <6,0>
        }
        box {
            <5, 20, 1> <7, 0, 0>
        } 
        box {
            <5, 23, 13> <7, 0, 12>
        }
        prism {
            linear_sweep
            linear_spline
            -1, 23.5, 5,
            <1.5,2>, <0,5>, <-2,5>, <-2,2>, <1.5,2>
        }
        prism {
            linear_sweep
            linear_spline
            -1, 23.5, 5,
            <10.5,2>, <12,5>, <14,5>, <14,2>, <10.5,2>
        }
        prism {
            linear_sweep
            linear_spline
            -1, 23.5, 5,
            <1.5,12>, <0,9>, <-2,9>, <-2,12>, <1.5,12>
        }
        prism {
            linear_sweep
            linear_spline
            -1, 23.5, 5,
            <10.5,12>, <11.5,9>, <14,9>, <14,12>, <10.5,12>
        }
    }
    material{
        texture {
            pigment {color rgbf <1, 1.0, 1, 0.9> }
            finish {
                ambient 0.4
                diffuse 0.7 
                refraction 1
                reflection 0.05
                specular 0.9
                phong 0.6
                phong_size 200    
            }
        } 
        interior {
            ior 1.3
        }
    }    
    photons { 
        target
        refraction on
        reflection on
    }
    normal{wrinkles 0.4 scale 0.9}
}