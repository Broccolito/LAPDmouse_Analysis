# m05

## Mouse Physiologic Parameters

  * Gender: Male
  * Strain: CD-1
  * Weight (g): unknown
  * Vendor: Charles Rivers
  * Physical abnormalities: none
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: unknown

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 125      | 0.31    | 39.1        | 0.85 |
  |Post 5 Aerosol     | 122      | 0.28    | 33.8        | 0.68 |
  |Post 10 Aerosol    | 123      | 0.31    | 37.7        | 0.71 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.56 x 4.56 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt      |   ol    |   fl    |   rd    |       Notes           |
  |:--------:|:---------:|:-------:|:-------:|:-------:|:----------------------|
  |excitation| UVND2     | UVND2   | 485/20  | 560/20  |center wavelength/fwhm |
  |emission  | N/A       | 470/30  | 535/30  | 635/30  |      (nm)             |
  |**Image** |**Exp**    |**Exp**  |**Exp**  |**Exp**  |    **Notes**          |
  |white     | 12.5      | 76.9    |  5000   | 125     | rhodamine b in OCT    |
  |cal       | 12.5      |  50     |    40   | 200     |                       |
  |images    |   N/A     |  40     | 13000   | 250     |                       |
  |darks     |           |  40     | 13000   | 250     |                       |

  * Notes regarding slicing:
    * The lung was twisted in the OCT.
    * The left lung may have gone slightly out of the field of view.
    * The right lung touched one of the fiducial markers.
    * Lung "tips" are very bright.
      
## Airway Segmentation

  * Total centerline length: 569.515 mm
  * Number of branches: 1348
  * Number of terminal branches: 675
  * Maximum generation number: 23
  * Number of outlet areas: 1709

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1211.21 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1211.21
Lobes        | 5 | 242.24±109.87
Sublobes     | 55 | 21.23±21.90
Near acini   | 465 | 2.43±1.33

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 400.16 | 1.57±1.55
cranial | 233.10 | 1.28±1.21
middle | 150.64 | 0.94±0.86
caudal | 326.14 | 0.80±0.74
accessory | 101.17 | 1.12±1.00

## Additional Notes

  * Overall quality: B
  * Lung tissue in part of left lobe looked unusual
  * Small tip of accessory lobe is includes in cranial lobe segmentation
  * Cryomicrotome stoppage lead to imaging artifacts and some missing airway branches
  
  

