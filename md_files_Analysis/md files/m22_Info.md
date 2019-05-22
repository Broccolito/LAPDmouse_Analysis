# m22

## Mouse Physiologic Parameters

  * Gender: Male
  * Strain: B6C3F1
  * Weight (g): 23.6
  * Vendor: Charles River
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 203      | 0.19    | 38.6        | 0.97 |
  |Post 5min Aerosol  | 196      | 0.21    | 40.4        | 0.97 |
  |Post 10min Aerosol | 204      | 0.19    | 39.2        | 0.87 |

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
    * Trachea sleemed very short.
    * Lots of shards left on sample during slicing.
    * Good aerosol signal throughout with some bright "stars."
      
## Airway Segmentation

  * Total centerline length: 606.968 mm
  * Number of branches: 1833
  * Number of terminal branches: 919
  * Maximum generation number: 26
  * Number of outlet areas: 1923

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1085.74 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1085.74
Lobes        | 5 | 217.15±98.35
Sublobes     | 54 | 19.55±20.48
Near acini   | 356 | 2.89±1.89

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 366.41 | 1.21±2.58
cranial | 192.18 | 1.57±1.71
middle | 128.70 | 1.11±1.12
caudal | 291.43 | 1.15±1.60
accessory | 107.03 | 0.79±1.31

## Additional Notes

  * Overall quality: A
  * Small artifacts in segmentation of accessory lobe
  
