# m11

## Mouse Physiologic Parameters

  * Gender: Male
  * Strain: B6C3F1
  * Weight (g): 23.4
  * Vendor: Charles Rivers
  * Physical abnormalities: none
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: 3.83e+08 FMS

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 259      | 0.20    | 53.0        | 1.10 |
  |Post 5 Aerosol     | 202      | 0.19    | 38.0        | 1.19 |
  |Post 10 Aerosol    | 262      | 0.22    | 57.7        | 1.09 |

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
    * Sample is mostly good, though a small pinch in the lung apices from the mold.
    * Lots of shards around slices 800-1100.
      
## Airway Segmentation

  * Total centerline length: 580.084 mm
  * Number of branches: 1449
  * Number of terminal branches: 727
  * Maximum generation number: 24
  * Number of outlet areas: 1990

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1097.30 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1097.30
Lobes        | 5 | 219.46±100.68
Sublobes     | 54 | 19.54±20.90
Near acini   | 425 | 2.40±1.30

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 368.52 | 1.27±1.15
cranial | 187.23 | 1.29±1.16
middle | 129.24 | 1.49±1.20
caudal | 303.44 | 1.00±0.96
accessory | 108.86 | 1.09±0.95

## Additional Notes

  * Overall quality: A
  * Segmentation of accessory lobe requires some manual slice by slice editing; the final surface is a little bit jagged.
  
