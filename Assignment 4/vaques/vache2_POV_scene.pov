//wrap the file with the version
#local Temp_version = version;
//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.13.31.705
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: https://sites.google.com/site/poseray/
//==================================================
//Files needed to run the POV-Ray scene:
//vache2_POV_main.ini (initialization file - open this to render)
//vache2_POV_scene.pov (scene setup of cameras, lights and geometry)
//vache2_POV_geom.inc (geometry)
//vache2_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 18944
//Number of vertices............. 9478
//Number of normals.............. 9478
//Number of UV coordinates....... 10535
//Number of lines................ 0
//Number of materials............ 8
//Number of groups/meshes........ 35
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.012438,0.10919)
//                        to u,v=(0.987562,0.915032)
//Bounding Box....... from x,y,z=(-0.174641,-0.00458835,-0.572468)
//                      to x,y,z=(0.119511,0.580978,0.484687)
//                 size dx,dy,dz=(0.294152,0.58556635,1.057155)
//                  center x,y,z=(-0.027565,0.288194825,-0.0438905)
//                       diagonal 1.24378054470285
//Surface area................... 0.864885415810308
//             Smallest face area 3.5963424631842E-8
//              Largest face area 0.000980807524687478
//Memory allocated for geometry: 1 MByte
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H240 +FN +AM1 +A0.3 +r3 +Q9 +C -UA +MV3.71
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
 
global_settings {
  //This setting is for alpha transparency to work properly.
  //Increase by a small amount if transparent areas appear dark.
   max_trace_level 15
   adc_bailout 0.001
   assumed_gamma 1
 
}
#include "vache2_POV_geom.inc" //Geometry
 
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <-6.93889390390723E-18,0,2.4875610894057>
        look_at <-6.93889390390723E-18,0,1.4875610894057>
        angle 32.9346087425027 // horizontal FOV angle
        rotate <0,0,0> //roll
        rotate <-25,0,0> //pitch
        rotate <0,45,0> //yaw
        translate <-0.027565,0.288194825,-0.0438905>
        }
 
//Light_1
light_source {
              <-0.027565,0.910085097351426,-0.0438905> //light position
              color rgb <1,1,1>*1600
              area_light
              <0.02,0,0> <0,0,0.02>
              4,4
              jitter
              circular
              adaptive 2
              orient
              fade_power 2
              fade_distance 1
        }
 
//Background
background { color srgb <1,0.2,1>  }
 
//Assembled object that is contained in vache2_POV_geom.inc with no SSLT components
object{
      vache2_
      }
 
//restore the version used outside this file
#version Temp_version;
//==================================================
