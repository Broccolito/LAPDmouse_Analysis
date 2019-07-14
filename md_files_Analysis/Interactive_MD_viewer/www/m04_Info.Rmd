# m04

## Mouse Physiologic Parameters

  * Gender: Male
  * Strain: CD-1
  * Weight (g): 24.4
  * Vendor: Charles Rivers
  * Physical abnormalities: none
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: 2.65e8 FMS

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 129      | 0.32    | 40.9        | 0.86 |
  |Post 5 Aerosol     |  99      | 0.33    | 32.4        | 1.06 |
  |Post 10 Aerosol    | 100      | 0.27    | 26.8        | 0.56 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.57 x 4.57 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt      |   ol    |   fl    |   rd    |       Notes           |
  |:--------:|:---------:|:-------:|:-------:|:-------:|:----------------------|
  |excitation| UVND2     | UVND2   | 485/20  | 560/20  |center wavelength/fwhm |
  |emission  | N/A       | 470/30  | 535/30  | 635/30  |      (nm)             |
  |**Image** |**Exp**    |**Exp**  |**Exp**  |**Exp**  |    **Notes**          |
  |white     | 25        | 125     |   100   | 500     | white paper, x=UVND2  |
  |white     | 25        |  25     |     4   |   4     | white paper, m=EMPTY  |
  |cal       | 50        |  50     |    50   | 100     |                       |
  |images    |   N/A     |  50     | 20000   | 400     |                       |
  |darks     |           |  50     | 20000   | 400     |                       |

  * Notes regarding slicing:
    * The beginning of the sample had lots of shards.
    * Used clear OCT on sample surface before restarting after long stoppage.
      
## Airway Segmentation

  * Total centerline length: 453.592 mm
  * Number of branches: 994
  * Number of terminal branches: 498
  * Maximum generation number: 24
  * Number of outlet areas: 1167

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1224.19 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1224.19
Lobes        | 5 | 244.84±114.40
Sublobes     | 54 | 22.19±21.39
Near acini   | 412 | 2.84±1.63

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 410.59 | 1.42±1.63
cranial | 237.22 | 1.24±1.26
middle | 149.80 | 0.89±0.87
caudal | 329.24 | 1.08±1.27
accessory | 97.34 | 1.00±1.15

## Additional Notes

  * Overall quality: B
  * Cryomictrome stoppage lead to imaging artifacts, which in return resulted in missing airway branches in this area.

