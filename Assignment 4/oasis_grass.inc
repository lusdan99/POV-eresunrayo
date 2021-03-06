#include "colors.inc"
#include "mgrass.pov"

#declare Blanc1=rgb<0.90,0.81,0.81>;

#declare Green1=rgb<230,170,50>/255;
#declare Green2=rgb<110,160,8>/255;
// --------------------------------------
// Grass texture
// --------------------------------------
#declare P_Spotted =pigment {
spotted
    color_map {
        [0.0, 0.2   color Tan*0.1 color Tan*0.4]
        [0.2, 0.3   color Tan*0.4 color Green1]
        [0.3, 1.01   color Green1 color Green1*1.2]
    }
}

#declare P_Earth =pigment {
    spotted
    color_map {
        [0 color Tan*0.3]
        [0.6 color Tan*0.3]
        [0.6 color Green1*0.4]
        [1   color Green1*0.4]
    }
}
#declare P_Green=pigment{Green2*1.3}
//#declare P_Spotted=pigment{Red}
//#declare P_Earth=pigment{Blue}
#declare T_Grass=texture {                  
    pigment {
        gradient y
        turbulence 0.2
        pigment_map {                                
            [0.0 P_Earth]
            [0.3 P_Green]
            [0.9 P_Spotted]
            [1.00 P_Earth]
        }
    }
    finish{ambient 0.01 diffuse 0.7 specular 0.2 roughness 0.015}
    scale <0.001,1,0.001>
 
} 
// --------------------------------------
// Patch parameters
// --------------------------------------
// Final number of triangles = nBlade x nBlade x segBlade x 2 (or 4 if dofold = true)
// --------------------------------------
#declare lPatch=50;               // size of patch
//#declare nBlade=4;                // number of blades per line (there will be nBlade x nBlade blades)
#declare nBlade=10;                // number of blades per line (there will be nBlade x nBlade blades)
#declare ryBlade = 0;            // initial y rotation of blade
#declare segBlade= 15;            // number of blade segments
#declare lBlade = 25;             // length of blade
#declare wBlade = 1;              // width of blade at start
#declare wBladeEnd = 0.3;         // width of blade at the end
#declare doSmooth=false;          // true makes smooth triangles
#declare startBend = <0,1,0.3>;   // bending of blade at start (<0,1,0>=no bending)
#declare vBend = <0,-0.5,0>;         // force bending the blade (<0,1,1> = 45�)
#declare pwBend = 3;              // bending power (how slowly the curve bends)
#declare rd = 459;                // seed
#declare stdposBlade = 1;         // standard deviation of blade position 0..1
#declare stdrotBlade = 360;       // standard deviation of rotation
#declare stdBlade = 1.2;           // standard deviation of blade scale;
#declare stdBend = 2;            // standard deviation of blade bending;
#declare dofold = true;          // true creates a central fold in the blade (twice more triangles)
#declare dofile = true;          // true creates a mesh file
#declare fname = "fgrass1.inc"     // name of the mesh file to create

// --------------------------------------
// Prairie parameters
// --------------------------------------
#declare nxPrairie=3;             // number of patches for the first line
#declare addPatches=1;            // number of patches to add at each line
#declare nzPrairie=5;             // number of lines of patches
#declare rd=seed(779);            // random seed
#declare stdscale=1;              // stddev of scale
#declare stdrotate=1;             // stddev of rotation
#declare doTest=false;            // replaces the patch with a sphere

// --------------------------------------
// Create the patch and the prairie
// --------------------------------------
#if (dofile=true) // if the patch is already created, turn off the next line
        MakeGrassPatch(lPatch,nBlade,ryBlade,segBlade,lBlade,wBlade,wBladeEnd,doSmooth,startBend,vBend,pwBend,rd,stdposBlade,stdrotBlade,stdBlade,stdBend,dofold,dofile,fname)
        #declare objectPatch=#include fname
#else        
        #declare objectPatch=object{MakeGrassPatch(lPatch,nBlade,ryBlade,segBlade,lBlade,wBlade,wBladeEnd,doSmooth,startBend,vBend,pwBend,rd,stdposBlade,stdrotBlade,stdBlade,stdBend,dofold,dofile,fname)}
#end          
