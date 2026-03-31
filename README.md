MSFS 2024 Scenery Object Naming Convention & Build Process Guide
================================================================

* * *

Introduction
------------

This document outlines the recommended naming convention and build process for scenery objects (textures, models, libraries, XML files) created by JOE simtech for Microsoft Flight Simulator 2024 (MSFS-2024). The primary goal is to ensure compatibility, avoid conflicts with other add-ons, and maintain a clear, organized structure.

**Official SDK Reference:**

*   [MSFS 2024 SDK Documentation - Introduction](https://docs.flightsimulator.com/msfs2024/html/1_Introduction/Introduction.htm)

* * *

Workspace-Setup
---------------

### Development Folders

I've good experience with setting up a project workspace for the creation of my personal projects. They're located in a folder

    %UserProfile%/
    └── projects
        ├── flightsim-scenery-models
        └── fsprojects
    

Where  
**`flightsim-scenery-models`** contains the blender data in the form for each asset for instance

    %UserProfile%/
    └── projects
        ├── flightsim-scenery-models
        │   ├── assets
        │   │   └── CLU
        │   │       └── waste-bin-120l
        │   │           ├── blender-textures
        │   │           │   ├── xyz_clu_waste-bin-120l_baseColor-Black.png
        │   │           │   ├── xyz_clu_waste-bin-120l_baseColor-Blue.png
        │   │           │   ├── xyz_clu_waste-bin-120l_baseColor-Green.png
        │   │           │   ├── xyz_clu_waste-bin-120l_baseColor-Grey.png
        │   │           │   ├── xyz_clu_waste-bin-120l_comp.png
        │   │           │   └── xyz_clu_waste-bin-120l_normal.png
        │   │           └── waste-bin-120l.blend
        │   └── texture-shared
        │       └── xyz_metal_sheet_box-profile_baseColor-orange-corrogated.png
        │       └── xyz_metal_sheet_box-profile_comp.png
        │       └── xyz_metal_sheet_box-profile_normal.png
        └── fsprojects
            └── {ProjectName}
                    └── PackageSources
                            └── {LibraryName}
                                └── Scenery
                                    └── {LibraryName}
                                        └── {ModelName}
                                        └── {ModelName2}
                                        └── {ModelName3}
                                        └── texture 
    

While **`fsprojects`** is the place where MSFS Developer Mode is saving the WIP Projects.  
So I'm splitting modeling/textureing and libraray-generation/object-placement deliberately to two different folders.

* * *

### Tools

I'm using:

#### Blender for 3D models

with the [io\_scene\_gltf2\_msfs\_2024](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Plugins/Blender_Plugin/The_Blender_Plugin.htm) plugin from MSFS 2024 SDK  
Currently there seem to be some issues with latest Blender versions so I currently use 3.6 LTS successfully with the SDK gltf exporter plugin  
To export models using the SDK gltf Plugin, define as export-path

    %UserProfile%\projects\fsprojects\{ProjectName}\PackageSources\{LibraryName}\Scenery\{LibraryName}\{ModelName}\
    

##### LODs

Ensure you create LOD optimized models to reduce the poping effect and keep performance good in your sceneries. See [LODs in the SDK documentation](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Modeling/LODs/LOD_Technical_Information.htm).

#### GIMP & Inkscape

for texturing. No need to buy expensive tools if you can use donation ware.  
⚠️ Ensure you **respect the [texturing guidelines](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Textures/Texturing_Technical_Info.htm)** from MSFS SDK documentation!

**texture naming**  
It is strongly recommended to adhere to the recommendation to use clear unique naming conventions as generic names [are prone to cause problems](https://forums.flightsimulator.com/t/texture-naming-be-sure-to-use-unique-names/447057) in case someone else used the same names in their projects as well.

#### Microsoft PowerToys

for batch-renaming for instance if I downloaded free textures it makes sense to use PowerRename from the Microsoft PowerToys package.

### Versioning

I strongly recommend to make use of [Git](https://git-scm.com/book/ms/v2/Getting-Started-About-Version-Control) as versioning system to ensure you have a valid history in case you inadvertently distroy something.

### Fair use / legal

Keep in Mind that if you download or modify assets from others (models/textures/effects etc.) they might be under a special license like CC-BY-SA-NC and thus need to be respected. It's on you to ensure properly licensed useage!

* * *

Rationale
---------

*   **Author Prefix (xyz\_):** Adding a unique author prefix (e.g., xyz\_) to all object names and folder names is crucial. It prevents file name collisions between different creators' add-ons, ensuring your assets are loaded correctly and uniquely identified. This is a standard recommended practice by Asobo.
*   **Category Prefix (3-Char Code):** Using a three-character code at the beginning of object names (or within folder structures where appropriate) clearly categorizes the object's content (e.g., City, Clutter, Airport). This aids in organization and helps the loading system understand the object's purpose.
    *   ARP ➜ airport
    *   BLD ➜ building
    *   CLU ➜ clutter
    *   CTY ➜ city
    *   EFF ➜ effect
    *   VEG ➜ vegetation
    *   VEH ➜ vehicle
    *   SIG ➜ signs (road signs - company signs)
*   **ICAO Code** (for Airports): **UN/LOCODE** for location specific objects  
    ICAO code (e.g., EDDI, KLAX) only if applicable. - In case of location specific city/non-ARP models it is recommended to use the [UN/LOCODE](https://unece.org/trade/cefact/unlocode-code-list-country-and-territory) standard. It is well known in aviation as the IATA airport codes use often the LoCode (LEJ ➜ Leipzig, STR = Stuttgart, FRA ➜ Frankfurt, HAM ➜ Hamburg etc.) Including the ICAO code (e.g., EDDI, KLAX) in the sub-folder names or object names for airport-related items (like runways, taxiways, ramps, buildings) links the object directly to a specific airport location. This is essential for proper placement and loading.
*   **PBR Texture Standard:** Using the PBR (Principle-Based Rendering) texture naming convention ensures consistency with modern rendering pipelines and makes it easier to manage materials.

**Official SDK Reference:**

*   [Creating Or Replacing An Airport - SDK Documentation](https://docs.flightsimulator.com/html/Samples_And_Tutorials/Tutorials/Creating_Or_Replacing_An_Airport.htm)
*   [FlightSim Materials - SDK Documentation](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Textures/Materials/FlightSim_Materials.htm)

* * *

Folder Structure
----------------

*   **Project Structure:** Assets are organized within the `fsprojects\<projectName>\PackageSources\Scenery\<assetGroupName>` directory structure.
*   **Texture Export:** Export textures directly to `..\texture` from Blender export setup. That ensures that all commonly used textures in a library on multiple objects will be there just once.  
    So
*   **Model Export:** Export Blender models directly to `fsprojects\<projectName>\PackageSources\Scenery\<assetGroupName>`.

**Official SDK Reference:**

*   [Using The SDK - SDK Documentation](https://docs.flightsimulator.com/msfs2024/flighting/html/1_Introduction/Using_The_SDK.htm)
*   [Components And Concepts - Package Tool](https://docs.flightsimulator.com/msfs2024/html/8_SDK_Tools/Package_Tool/Components_And_Concepts.htm)

* * *

Texture Naming Convention (PBR)
-------------------------------

*   **Base Color (Albedo RGBA):** `{creatorShortcut}_{Category}_{ModelName}_baseColor{optional: _styleVariant}.png`
*   **Occlusion(R) Roughness(G) Metallic(B):** `{creatorShortcut}_{Category}_{ModelName}_comp.png`
*   **Normal Map:** `{creatorShortcut}_{Category}_{ModelName}_normal.png`
*   **Emissive (Optional):** `{creatorShortcut}_{Category}_{ModelName}_emissive.png`
*   **Detail Color(RGB) Alpha(A) (Optional):** `{creatorShortcut}_{Category}_{ModelName}_detail.png`
*   **Detail Occlusion(R) Roughness(G) Metallic(B) (Optional):** `{creatorShortcut}_{Category}_{ModelName}_dORM.png`

**Where:**

*   `{creatorShortcut}`: Your unique creator identifier (e.g., xyz)
*   `{Category}`: 3-letter category code (e.g., CLU, CTY, ARP, BLD, VEH)
*   `{ModelName}`: Name of the model
*   `{optional: _styleVariant}`: Optional suffix for different variants of the same model (e.g., \_blue, \_large)

**Examples:**

*   `xyz_CLU_waste-bin_baseColor_silver.png`
*   `xyz_CLU_waste-bin_comp.png`
*   `xyz_CLU_waste-bin_normal.png`
*   `xyz_CTY_building_baseColor_512.png`
*   `xyz_ARP_EDDS_terminal3_emissive.png`

**Official SDK Reference:**

*   [Textures - SDK Documentation](https://docs.flightsimulator.com/msfs2024/html/5_Content_Configuration/Textures/Textures.htm)
*   [FlightSim Materials - SDK Documentation](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Textures/Materials/FlightSim_Materials.htm)

* * *

Model File (.gltf / .obj) Naming Convention
-------------------------------------------

**General Pattern:**  
`{Category}_{ICAO_or_LOCODE_IfExists}_{ModelName}`

**Where:**

*   `{Category}`: 3-letter category code (e.g., CLU, CTY, ARP, BLD, VEH)
*   `{ICAO_or_LOCODE_IfExists}`: ICAO code (e.g., EDDI, KLAX) only if applicable. - In case of location specific city/non-ARP models it is recommended to use the [UN/LOCODE](https://unece.org/trade/cefact/unlocode-code-list-country-and-territory) standard. It is well known in aviation as the IATA airport codes use often the LoCode (LEJ ➜ Leipzig, STR = Stuttgart, FRA ➜ Frankfurt, HAM ➜ Hamburg etc.)
*   `{ModelName}`: Name of the model

**Examples:**

*   `CLU_waste-bin.obj`
*   `CTY_DE-HAM_city-hall.gltf`
*   `CTY_DE-STR_tv-tower.gltf`
*   `ARP_EDDS_terminal3.gltf`
*   `ARP_EDDS_terminal3.gltf`

**Official SDK Reference:**

*   [Models - SDK Documentation](https://docs.flightsimulator.com/msfs2024/html/5_Content_Configuration/Models/Models.htm)
*   [Model Exporting - SDK Documentation](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Modeling/Aircraft/Model_Exporting.htm?agt=index)

* * *

Library Naming Convention
-------------------------

**General Pattern:**  
is used to name the library being created from SDK. When rendered it will be prefixed with the creator-prefix automatically helping to identify the library on object selection.  
`{Category}_{ICAO_or_LOCODE_IfExists}_{LibraryName}`

**Where:**

*   `{Category}`: 3-letter category code (e.g., CLU, CTY, ARP, BLD, VEH)
*   `{ICAO_or_LOCODE_IfExists}`: ICAO or UN/LOCODE (e.g., EDDL, KLAX, DE-MUC) only if applicable
*   `{LibraryName}`: Name of the library

**Examples:**

*   `CLU_DE_apron` (will be exported as `CLU_DE_apron.bgl`)
*   `ARP_EDDM_Terminals`
*   `CTY_DE-VER_buildings`

* * *

Links
-----

**Official SDK Reference:**

*   [Components And Concepts - Package Tool](https://docs.flightsimulator.com/msfs2024/html/8_SDK_Tools/Package_Tool/Components_And_Concepts.htm)

### Asset sources

**Model sources**

*   [sketchfab.com](https://sketchfab.com/&type=models)
*   [cgtrader.com](https://www.cgtrader.com/)

**PBR Material Sources**

*   [freepbr.com](https://freepbr.com/)
*   [a23d.co](https://www.a23d.co/textures/free-materials)
*   [polyhaven.com](https://polyhaven.com/textures)

©️ by Joachim Herwig - Licensed: CC-BY-NC-SA