# m28

## Mouse Physiologic Parameters

  * Gender: M
  * Strain: BALB/c
  * Weight (g): 25.3
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 261      | 0.39    | 100.5       | 0.85 |
  |Post 7.5min Aerosol| 235      | 0.27    | 63.0        | 0.83 |
  |Post 15min Aerosol | 227      | 0.28    | 64.4        | 0.84 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.73 x 4.73 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |    25  |   100  |  3000  |   100  |Rhodamine B in OCT     |
  |cal       |    20  |   125  |    67  |   400  |                       |
  |images    |        |    77  | 15000  |  2000  |                       |
  |darks     |        |    77  | 15000  |  2000  |                       |

  * Notes regarding slicing:
    * Very high aerosol with many multiple red images.
    * First couple mm of trachea are narrowed and misshapen.
    * Generally a good sample.
    
## Airway Segmentation

  * Total centerline length: 580.42 mm
  * Number of branches: 1477
  * Number of terminal branches: 740
  * Maximum generation number: 26
  * Number of outlet areas: 2066

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1120.26 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1120.26
Lobes        | 5 | 224.05±112.52
Sublobes     | 53 | 20.76±21.60
Near acini   | 380 | 2.82±1.69

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 409.24 | 1.18±4.11
cranial | 184.12 | 1.23±3.91
middle | 148.23 | 1.31±4.28
caudal | 287.46 | 0.90±3.66
accessory | 91.21 | 1.22±3.21

## Additional Notes

  * Overall quality: B
  * Left lobe was mishaped
  * Entrance to cranial lobe was very narrow and unusually shaped. Segmentation is a little bit off at the one side.
  * Some local artifacts in airway segmentation due to imaging artifacts (occlusions along airway, broken off lung pieces, ...)
  
  
