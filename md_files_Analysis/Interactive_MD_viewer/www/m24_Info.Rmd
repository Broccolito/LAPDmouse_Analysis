# m24

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: B6C3F1
  * Weight (g): 20.7
  * Vendor: Charles River
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 252      | 0.19    | 46.8        | 1.20 |
  |Post 5min Aerosol  | 232      | 0.31    | 71.4        | 0.99 |
  |Post 10min Aerosol | 211      | 0.22    | 45.5        | 0.83 |

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
  |white     |    33  |   200  |  8000  |   200  |Rhodamine B in OCT     |
  |cal       |    20  |   167  |    67  |   400  |                       |
  |images    |        |    77  | 20000  |  2000  |                       |
  |darks     |        |    77  | 20000  |  2000  |                       |

  * Notes regarding slicing:
    * Lost a small amount of ventral lung when it fell out of the field
      of view.
    * The top bit of trachea fell off, but there are still several mm
      remaining.
    * Good aerosol signal. There were some very large clumps.
      
## Airway Segmentation

  * Total centerline length: 633.751 mm
  * Number of branches: 1744
  * Number of terminal branches: 873
  * Maximum generation number: 25
  * Number of outlet areas: 2142

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1175.21 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1175.21
Lobes        | 5 | 235.04±103.46
Sublobes     | 55 | 20.73±21.45
Near acini   | 339 | 3.25±1.98

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 381.88 | 1.22±3.10
cranial | 202.42 | 1.50±2.46
middle | 142.69 | 1.25±1.87
caudal | 329.29 | 1.00±1.62
accessory | 118.92 | 1.04±1.53

## Additional Notes

  * Overall quality: B
  * Tip of accessory lobe not imaged
  * Top part of trachea is deformed and in sample and not perfectly segmented
  * Some distal airway segments missing.
  
