# m03

[Go to data folder](https://drive.google.com/open?id=1i06Tq-UPdcRzOlIKv1aZ501Ayote3Ice)

![Screenshot showing aerosol deposition](https://drive.google.com/uc?export=download&amp;id=1k3J8BLj6ZHwkfQkdtNJebJN8hMpu6kzl =400x*)

## Mouse Physiologic Parameters

  * Gender: Male
  * Strain: BALB/c
  * Weight (g): 23.8
  * Vendor: Jackson Labs
  * Physical abnormalities: some OCT on left lung after freezing
  * Protocol (link XXX)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: unknown

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 279      | 0.19    | 54.1        | 0.94 |
  |Post 5 Aerosol     | 305      | 0.19    | 57.6        | 0.94 |
  |Post 10 Aerosol    | 184      | 0.12    | 21.9        | 0.69 |

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
  |white     | 25        | 125     |   100   | 500     | white paper, x=UVND2  |
  |white     | 25        |  25     |     4   |   4     | white paper, m=EMPTY  |
  |cal       | 50        |  50     |    50   | 100     |                       |
  |images    |   N/A     |  50     | 20000   | 400     |                       |
  |darks     |           |  50     | 20000   | 400     |                       |

  * Notes regarding slicing:
    * This lung looked good overall, though it was a bit rotated in the
      mold.
    * There was one long stoppage. I tried smearing the sample surface
      with OCT instead of a wet Kimwipe. This is not an optimale way to
      recover after the sample sits dormant for many hours.
      
## Airway Segmentation

  * Total centerline length: 556.905 mm
  * Number of branches: 1309
  * Number of terminal branches: 655
  * Maximum generation number: 25
  * Number of outlet areas: 1725

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1142.07 (mm^3)
  * Total aerosol deposition: 409899.22

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lobes        | 5 | 228.41±108.80
Sublobes     | 56 | 19.96±20.79
Near acini   | 303 | 3.60±2.57

Lobe      | Volume (mm^3) | Aerosol deposition density
--------- | ------------- | ----------------------
left | 404.06 | 396.70±453.77
cranial | 196.08 | 407.77±468.76
middle | 147.44 | 340.69±285.77
caudal | 294.17 | 286.57±281.97
accessory | 100.33 | 350.06±381.64

## Additional Notes

  * Overall quality: B
  * OCT leakage and lung lobe shapes caused some issues for segmentation of accessory and caudal lobe
  * Imaging artifacts caused some missing peripheral airway subtrees and inaccuracies of airway wall surface segmentations

