# m05

[Go to data folder](https://drive.google.com/open?id=12YI7gfVWvAhyfOrlDXxZZ0fLqg8_He0P)

![Screenshot showing aerosol deposition](https://drive.google.com/uc?export=download&amp;id=1phyReF3J8Q7ZbWKwrUNb9PiMqo9VP8fi =400x*)

## Mouse Physiologic Parameters

  * Gender: Male
  * Strain: CD-1
  * Weight (g): unknown
  * Vendor: Charles Rivers
  * Physical abnormalities: none
  * Protocol (link XXX)

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

  * Lung volume: 1211.22 (mm^3)
  * Total aerosol deposition: 628577.82

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lobes        | 5 | 242.24±109.87
Sublobes     | 55 | 21.23±21.90
Near acini   | 465 | 2.43±1.33

Lobe      | Volume (mm^3) | Aerosol deposition density
--------- | ------------- | ----------------------
left | 400.17 | 683.66±603.56
cranial | 233.10 | 557.36±456.63
middle | 150.64 | 409.06±331.62
caudal | 326.14 | 349.60±284.94
accessory | 101.17 | 488.68±385.52

## Additional Notes

  * Overall quality: B
  * Lung tissue in part of left lobe looked unusual
  * Small tip of accessory lobe is includes in cranial lobe segmentation
  * Cryomicrotome stoppage lead to imaging artifacts and some missing airway branches
  
  

