# m34

## Mouse Physiologic Parameters

  * Gender: M
  * Strain: BALB/c
  * Weight (g): 25.3
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 0.5 microns
  * Exposure time: 10 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 235      | 0.32    | 75.4        | 0.77 |
  |Post 5min Aerosol  | 168      | 0.22    | 36.1        | 0.45 |
  |Post 10min Aerosol | 164      | 0.25    | 41.3        | 0.58 |

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
  |white     |    50  |   250  |  8000  |   250  |Rhodamine B in OCT     |
  |cal       |    20  |   167  |    67  |   400  |                       |
  |cal-2     |    40  |   250  |   100  |   500  |Increased all exposures|
  |images    |        |    77  | 20000  |  3000  |                       |
  |darks     |        |    77  | 20000  |  3000  |                       |

  * Notes regarding slicing:
    * Tons of camera hours. One 4-hr down-time, but with just main
      bronchi showing.
    * Many shards in this sample.
    * Good aerosol signal, though some saturated "stars."
    * Overall, this looks ok.
      
## Airway Segmentation

  * Total centerline length: 622.585 mm
  * Number of branches: 1714
  * Number of terminal branches: 859
  * Maximum generation number: 27
  * Number of outlet areas: 2088

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1185.52 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1185.52
Lobes        | 5 | 237.10±109.75
Sublobes     | 55 | 21.19±20.22
Near acini   | 349 | 3.27±1.99

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 404.20 | 1.16±2.63
cranial | 221.55 | 1.38±1.42
middle | 136.73 | 1.13±1.48
caudal | 313.19 | 1.07±1.05
accessory | 109.84 | 1.05±3.16

## Additional Notes

  * Overall quality: B
  * Image data looks blurrier than usual
  
