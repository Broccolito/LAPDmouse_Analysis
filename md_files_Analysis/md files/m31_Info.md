# m31

## Mouse Physiologic Parameters

  * Gender: F
  * Strain: C57BL/6
  * Weight (g): 22.7
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 1 microns
  * Exposure time: 10 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 255      | 0.21    | 52.9        | 1.00 |
  |Post 5min Aerosol  | 246      | 0.20    | 48.8        | 0.83 |
  |Post 10min Aerosol | 257      | 0.23    | 59.3        | 0.89 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.72 x 4.72 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |    33  |   167  |  5000  |   200  |Rhodamine B in OCT     |
  |cal       |    20  |   125  |    67  |   400  |                       |
  |images    |        |    77  | 20000  |   500  |                       |
  |darks     |        |    77  | 20000  |   500  |                       |

  * Notes regarding slicing:
    * First ~100 slices have incomplete tracheal wall because of a break
      in the sample. There are still a few good mm of trachea.
    * Small OCT leak in the upper part of the right lung.
    * Good aerosol signal. Some multiple red images.
    * Good sample overall.
    
## Airway Segmentation

  * Total centerline length: 670.061 mm
  * Number of branches: 1948
  * Number of terminal branches: 976
  * Maximum generation number: 25
  * Number of outlet areas: 2346

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1118.92 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1118.92
Lobes        | 5 | 223.78±104.82
Sublobes     | 51 | 21.24±21.75
Near acini   | 442 | 2.36±1.22

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 359.69 | 1.20±1.12
cranial | 175.59 | 1.53±1.26
middle | 138.62 | 1.15±0.75
caudal | 338.45 | 1.05±0.84
accessory | 106.57 | 1.09±0.96

## Additional Notes

  * Overall quality: A
  
