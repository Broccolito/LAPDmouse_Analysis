# m27

## Mouse Physiologic Parameters

  * Gender: M
  * Strain: BALB/c
  * Weight (g): 24.4
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 278      | 0.37    | 103.3       | 0.89 |
  |Post 7.5min Aerosol| 239      | 0.28    | 66.6        | 0.86 |
  |Post 15min Aerosol | 223      | 0.28    | 62.4        | 0.84 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.70 x 4.70 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |    33  |   167  |  5000  |   167  |Rhodamine B in OCT     |
  |cal       |    20  |   125  |    67  |   400  |                       |
  |images    |        |    77  | 20000  |  2000  |                       |
  |darks     |        |    77  | 20000  |  2000  |                       |

  * Notes regarding slicing:
    * Top part of trachea is oblong before it rounds out.
    * A small piece of tissue detached from the main sample around
      slices 1450-1650.
    * Very high aerosol signal.
    * Sub-optimal sample because of the blow-out.
    
## Airway Segmentation

  * Total centerline length: 598.31 mm
  * Number of branches: 1584
  * Number of terminal branches: 793
  * Maximum generation number: 26
  * Number of outlet areas: 2152

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1123.09 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1123.09
Lobes        | 5 | 224.62±111.51
Sublobes     | 58 | 18.97±20.58
Near acini   | 334 | 3.20±2.29

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 404.70 | 1.28±6.72
cranial | 191.25 | 1.44±9.96
middle | 146.86 | 1.05±7.71
caudal | 290.64 | 0.78±6.21
accessory | 89.64 | 1.00±6.37

## Additional Notes

  * Overall quality: A
  * Top of trachea is too narrow
