# source

**Purpose:**
Raw model files (.blend).
Rohmodelle-Dateien (.blend) in einem eigenen Ordner je Modell mit zugehörigen Texturen.
I create the models in Blender in folder structures according to

```
<category>/
└── <model-name>/
    └── /blender-textures
    └── msfs-model/
        └── texture/
        └── <model-folder-from-blender-export-path>

```
So for instance
```
clutter/
└── waste-bin-120l/
    └── /blender-textures
    └── msfs-model/
        └── texture/
        └── waste-bin-120l-black/
        └── waste-bin-120l-blue/
        └── waste-bin-120l-green/

```
In this example I'm using the same model with just one texture replace to create three different models for the Sim.

If I then want to build model libs for MSFS I only need to copy over (or link via junction link) the content of "msfs-model" folder to the right PackageSources library folder to build the model-lib using those models.

**Documentation:** [LOD_Technical_Information.htm](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Modeling/LODs/LOD_Technical_Information.htm)


