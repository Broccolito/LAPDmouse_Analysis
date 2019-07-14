# m33

## Mouse Physiologic Parameters

  * Gender: F
  * Strain: BALB/c
  * Weight (g): 20.7
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 0.5 microns
  * Exposure time: 10 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 233      | 0.24    | 56.3        | 0.85 |
  |Post 5min Aerosol  | 222      | 0.21    | 46.0        | 0.77 |
  |Post 10min Aerosol | 195      | 0.19    | 37.4        | 0.64 |

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
  |white     |    40  |   250  |  8000  |   250  |Rhodamine B in OCT     |
  |cal       |    20  |   167  |    67  |   400  |                       |
  |images    |        |    77  | 20000  |  3000  |                       |
  |darks     |        |    77  | 20000  |  3000  |                       |

  * Notes regarding slicing:
    * Good aerosol signal.
    * Fl channel also looked okay.
      
## Airway Segmentation

  * Total centerline length: 506.133 mm
  * Number of branches: 1281
  * Number of terminal branches: 641
  * Maximum generation number: 26
  * Number of outlet areas: 1677

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1040.31 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1040.31
Lobes        | 5 | 208.06±91.70
Sublobes     | 57 | 17.92±18.70
Near acini   | 327 | 3.05±1.86

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 351.08 | 1.11±1.90
cranial | 187.23 | 1.31±1.90
middle | 134.12 | 1.29±1.33
caudal | 269.16 | 1.09±1.44
accessory | 98.71 | 1.17±3.07

## Additional Notes

  * Overall quality: B
  * Trachea was deformed and does not look physiologically correct; Segmentation does not model shape and does not attach to airway wall in some areas
  
