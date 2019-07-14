# m13

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: CD-1
  * Weight (g): 23.4
  * Vendor: Charles Rivers
  * Physical abnormalities: none
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: 3.73E+08 FMS

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 161      | 0.27    | 43.2        | 0.86 |
  |Post 5 Aerosol     | 193      | 0.33    | 63.2        | 0.81 |
  |Post 10 Aerosol    | 115      | 0.26    | 30.0        | 0.53 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.64 x 4.64 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt      |   ol    |   fl    |   rd    |       Notes           |
  |:--------:|:---------:|:-------:|:-------:|:-------:|:----------------------|
  |excitation| UVND2     | UVND2   | 485/20  | 560/20  |center wavelength/fwhm |
  |emission  | N/A       | 470/30  | 535/30  | 635/30  |      (nm)             |
  |**Image** |**Exp**    |**Exp**  |**Exp**  |**Exp**  |    **Notes**          |
  |white     |    25     |   125   |  6000   |   167   | 1 drop rhodamine B/10mL OCT |
  |cal       |    20     |    50   |    40   |   200   |                       |
  |images    |   N/A     |    50   | 15000   |   333   |                       |
  |darks     |           |    50   | 15000   |   333   |                       |

  * Notes regarding slicing:
    * The camera needed to be refocused at slice 407.
      
## Airway Segmentation

  * Total centerline length: 599.475 mm
  * Number of branches: 1613
  * Number of terminal branches: 808
  * Maximum generation number: 26
  * Number of outlet areas: 1866

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1202.26 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1202.26
Lobes        | 5 | 240.45±95.69
Sublobes     | 53 | 22.06±21.90
Near acini   | 404 | 2.83±1.57

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 373.93 | 1.24±1.16
cranial | 252.40 | 1.25±1.09
middle | 160.73 | 1.30±0.94
caudal | 305.86 | 1.04±0.83
accessory | 109.34 | 1.06±0.89

## Additional Notes

  * Overall quality: A
  * The walls of some peripheral airways were not well segmented.
  
