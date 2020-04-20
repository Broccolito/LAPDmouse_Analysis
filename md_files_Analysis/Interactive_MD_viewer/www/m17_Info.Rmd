# m17

## Mouse Physiologic Parameters

  * Gender: F
  * Strain: C57BL/6
  * Weight (g): NaN
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 281      | 0.24    | 67.5        | 0.92 |
  |Post 5min Aerosol  | 239      | 0.20    | 47.7        | 0.88 |
  |Post 10min Aerosol | 197      | 0.19    | 37.4        | 0.93 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.67 x 4.67 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |    20  |   125  |  5000  |   167  |Rhodamine B in OCT     |
  |cal       |    20  |   167  |    67  |   400  |                       |
  |images    |        |    67  | 15000  |  1000  |                       |
  |darks     |        |    67  | 15000  |  1000  |                       |

  * Notes regarding slicing:
    * Some aerosol clusters.
    * Good sample.
    
## Airway Segmentation

  * Total centerline length: 623.436 mm
  * Number of branches: 1838
  * Number of terminal branches: 921
  * Maximum generation number: 25
  * Number of outlet areas: 1905

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1062.17 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1062.17
Lobes        | 5 | 212.43±99.66
Sublobes     | 54 | 18.98±19.42
Near acini   | 252 | 3.95±2.45

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 357.41 | 1.81±4.72
cranial | 168.55 | 1.22±6.31
middle | 128.94 | 0.67±1.86
caudal | 302.60 | 0.82±1.93
accessory | 104.67 | 0.95±3.08

## Additional Notes

  * Overall quality: A
  * some airway branches missing
  
