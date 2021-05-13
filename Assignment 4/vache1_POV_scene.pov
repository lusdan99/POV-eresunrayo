
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
//vache1_POV_main.ini (initialization file - open this to render)
//vache1_POV_scene.pov (scene setup of cameras, lights and geometry)
//vache1_POV_geom.inc (geometry)
//vache1_POV_mat.inc (materials)
//cowmap.jpg
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
//Bounding Box....... from x,y,z=(-0.132045,-0.00181042,-0.423485)
//                      to x,y,z=(0.119511,0.529003,0.468203)
//                 size dx,dy,dz=(0.251556,0.53081342,0.891688)
//                  center x,y,z=(-0.00626699999999999,0.26359629,0.022359)
//                       diagonal 1.06777844018883
//Surface area................... 0.859398978446422
//             Smallest face area 3.61994778368305E-8
//              Largest face area 0.000980808407925684
//Memory allocated for geometry: 1 MByte
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H275 +FN +AM1 +A0.3 +r3 +Q9 +C -UA +MV3.71
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
 
global_settings {
  //This setting is for alpha transparency to work properly.
  //Increase by a small amount if transparent areas appear dark.
   max_trace_level 15
   adc_bailout 0.001
   assumed_gamma 1
 
}
#include "vache1_POV_geom.inc" //Geometry
 
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <5.20417042793042E-18,0,2.13555688037767>
        look_at <5.20417042793042E-18,0,1.13555688037767>
        angle 32.9346087425027 // horizontal FOV angle
        rotate <0,0,3.05827976869673> //roll
        rotate <6.72311450357963,0,0> //pitch
        rotate <0,51.9726371639,0> //yaw
        translate <-0.00626699999999999,0.26359629,0.022359>
        }
 
//PoseRay default Light attached to the camera
light_source {
              <5.20417042793042E-18,0,2.13555688037767> //light position
              color rgb <1,1,1>*1.6
              parallel
              point_at <5.20417042793042E-18,0,0>
              rotate <0,0,3.05827976869673> //roll
              rotate <6.72311450357963,0,0> //elevation
              rotate <0,51.9726371639,0> //rotation
             }
 
//Background
background { color srgb <1,1,1>  }
 
//Assembled object that is contained in vache1_POV_geom.inc with no SSLT components
object{
      vache1_
      }
 

//==================================================
