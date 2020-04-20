# m30

## Mouse Physiologic Parameters

  * Gender: M
  * Strain: BALB/c
  * Weight (g): 23.4
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 1 microns
  * Exposure time: 10 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | NaN      | NaN     | NaN         | NaN  |
  |Post 5min Aerosol  | 259      | 0.24    | 62.8        | 0.86 |
  |Post 10min Aerosol | 234      | 0.26    | 61.5        | 0.81 |

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
  |white     |    33  |   167  |  5000  |   200  |Rhodamine B in OCT     |
  |cal       |    20  |   125  |    67  |   400  |                       |
  |images    |        |    77  | 20000  |   500  |                       |
  |darks     |        |    77  | 20000  |   500  |                       |

  * Notes regarding slicing:
    * Pre-aerosol respiratory tracings are missing.
    * Trachea starts narrowed with an "indent". There is 1-2mm of good
      trachea.
    * Good aerosol signal. Some multiple red images.
    * The accessory lobe is not wrapped around the heart very well.
    * Small leak in the left lung. Left and right apices are pinched by
      the mold.
    
## Airway Segmentation

  * Total centerline length: 652.056 mm
  * Number of branches: 1729
  * Number of terminal branches: 866
  * Maximum generation number: 30
  * Number of outlet areas: 2458

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1163.07 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1163.07
Lobes        | 5 | 232.61±105.25
Sublobes     | 52 | 21.91±21.42
Near acini   | 398 | 2.78±1.71

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 382.82 | 1.17±1.23
cranial | 197.52 | 1.36±1.71
middle | 148.63 | 1.29±1.21
caudal | 326.73 | 1.05±1.15
accessory | 107.37 | 1.05±1.02

## Additional Notes

  * Overall quality: B
  * Top of trachea is misshaped in image data and segmentation doesn't model all details.
  
