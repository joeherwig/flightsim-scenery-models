Textures
====================================================================

**Purpose of folder:**
original textures to be re-used in multiple models (PSD, XCF, PNG).

**Documentation:** 
- [Texturing technical info](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Textures/Texturing_Technical_Info.htm)
- [comp-textures explained (YouTube)](https://www.youtube.com/watch?v=J0_EdyH7FR8&t=124s)

# comp texture
is a RGB Texture **comp**osed of the following greyscale channels
- red (R): Ambient occlusion - kind of 'baked in shadows'
  - white ➜ keeps the baseColor texture as is  
  - black ➜ darkens the base color texture 
- green (G): Roughness
  - white ➜ rough 
  - black ➜ smooth 
  This value is linear. And can be used to create reflection scale like for windows, clean car paint, or even in combination mit the B-Channel for mirrors / chrome.
- blue (B): Metallic
  - white ➜ metal
  - black ➜ dielectric
  Values in between are for blending between metals and dielectrics such as dirty metallic surfaces. This value is linear.

# Normal map
is created based on a height map and used to generate an impression of a 3D material without the need of creating each detail in the mesh.

## Height map
is a helper to create a normal map.
- white ➜ elevated
- black ➜ indented
Values in between are for different heights. In case you use libraries (for instance for windows and doors) ensure you take into account the height of the base texture you want to use it in.

Once you have the height map, you can use it to create the normal map using GIMP Filter "Generic / Normal map".