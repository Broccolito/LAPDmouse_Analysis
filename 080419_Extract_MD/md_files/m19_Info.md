# m19

## Mouse Physiologic Parameters

  * Gender: M
  * Strain: C57BL/6
  * Weight (g): 24.5
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 10 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 276      | 0.29    | 80.3        | 0.88 |
  |Post 5min Aerosol  | 264      | 0.29    | 76.1        | 0.83 |
  |Post 10min Aerosol | 233      | 0.25    | 57.3        | 0.62 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.68 x 4.68 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |    33  |   200  |  6000  |   200  |Rhodamine B in OCT     |
  |cal       |    20  |   167  |    67  |   400  |                       |
  |images    |        |    77  | 20000  |  2000  |                       |
  |darks     |        |    77  | 20000  |  2000  |                       |

  * Notes regarding slicing:
    * Good aerosol signal throughout. Some clumps.
    
     
## Airway Segmentation

  * Total centerline length: 704.979 mm
  * Number of branches: 2285
  * Number of terminal branches: 1146
  * Maximum generation number: 27
  * Number of outlet areas: 2549

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1140.65 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1140.65
Lobes        | 5 | 228.13±102.92
Sublobes     | 53 | 20.93±20.72
Near acini   | 341 | 3.16±1.73

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 365.59 | 1.06±3.31
cranial | 192.15 | 2.67±7.75
middle | 135.25 | 0.89±1.75
caudal | 333.61 | 0.77±1.79
accessory | 114.05 | 0.73±1.89

## Additional Notes

  * Overall quality: B
  * Some artifacts on lung surface
  * Skeleton in caudal main branch is off for one bifurcation
  
