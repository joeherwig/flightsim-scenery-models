# source

**Zweck:**
Rohmodelle-Dateien (.blend) in einem eigenen Ordner je Modell mit zugehörigen Texturen.
Ich generiere die Modelle von Blender in Unterordner-Strukturen gem.
```
<category>/
└── <model-name>/
    └── /blender-textures
    └── msfs-model/
        └── texture/
        └── <model-folder-from-blender-export-path>

```
Also Beispielsweise
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
In diesem Beispiel nutze ich Dasselbe Modell um mit nur einer ausgetauschten Textur drei unterschiedliche Modelle für den Simulator zu generieren.

Wenn ich dann das Modell für Modellbibliotheken im Simulator nutzen möchte, brauche ich nur die Inhalte unterhalb vonb "msfs-models" in den entsprechenden PackageSources library Ordner zu kopieren (oder als junction link einfügen), um  die model-lib mit diesen Modellen zu erstellen.

**Dokumentation:** [LOD_Technical_Information.htm](https://docs.flightsimulator.com/msfs2024/html/3_Models_And_Textures/Modeling/LODs/LOD_Technical_Information.htm)


