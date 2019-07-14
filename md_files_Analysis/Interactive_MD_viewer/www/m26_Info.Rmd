# m26

## Mouse Physiologic Parameters

  * Gender: F
  * Strain: BALB/c
  * Weight (g): 22.3
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 219      | 0.23    | 51.0        | 0.89 |
  |Post 7.5min Aerosol| 193      | 0.22    | 43.0        | 1.01 |
  |Post 15min Aerosol | 238      | 0.21    | 50.7        | 0.84 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.71 x 4.71 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |    25  |   167  |  5000  |   200  |Rhodamine B in OCT     |
  |cal       |    20  |   125  |    67  |   400  |                       |
  |images    |        |    77  | 20000  |  1000  |                       |
  |darks     |        |    77  | 20000  |  1000  |                       |

  * Notes regarding slicing:
    * Good trachea length.
    * Small pinch in the apex of the right lung.
    * Good aerosol signal. Some areas hove multiple red images.
    
## Airway Segmentation

  * Total centerline length: 615.716 mm
  * Number of branches: 1487
  * Number of terminal branches: 745
  * Maximum generation number: 26
  * Number of outlet areas: 2251

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1166.22 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1166.22
Lobes        | 5 | 233.24±110.94
Sublobes     | 53 | 21.47±21.04
Near acini   | 358 | 3.07±2.08

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 387.11 | 1.28±4.20
cranial | 184.94 | 1.44±7.79
middle | 156.48 | 1.16±2.28
caudal | 339.73 | 0.95±2.41
accessory | 97.97 | 1.13±2.60

## Additional Notes

  * Overall quality: A
  
