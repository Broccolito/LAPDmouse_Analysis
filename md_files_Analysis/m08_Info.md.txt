# m08

[Go to data folder](https://drive.google.com/open?id=1mIlPeF4HnUxO2SecubYl3m0xt5YVn4bV)

![Screenshot showing aerosol deposition](https://drive.google.com/uc?export=download&amp;id=1tu5UpFFu0GDkzmqlxvvOtV4jYqAXzRYq =400x*)

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: C57BL/6
  * Weight (g): 23.0
  * Vendor: Jackson Labs
  * Physical abnormalities: none
  * Protocol (link XXX)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: unknown

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 240      | 0.30    | 71.3        | 0.81 |
  |Post 5 Aerosol     | 210      | 0.24    | 50.0        | 0.66 |
  |Post 10 Aerosol    | 180      | 0.27    | 48.3        | 0.61 |

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
    * Small amount of OCT leakage at the trachea just superior to the carina.
    * Lots of shards early in the slicing.
    * Good aerosol signal throughout.
    * Tip of the left lung fell out around slice 1868.
    * Ran without stopping.
      
## Airway Segmentation

  * Total centerline length: 597.903 mm
  * Number of branches: 1718
  * Number of terminal branches: 861
  * Maximum generation number: 25
  * Number of outlet areas: 1995

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1055.43 (mm^3)
  * Total aerosol deposition: 671053.58

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lobes        | 5 | 211.09±93.96
Sublobes     | 55 | 18.38±19.37
Near acini   | 378 | 2.58±1.26

Lobe      | Volume (mm^3) | Aerosol deposition density
--------- | ------------- | ----------------------
left | 340.92 | 512.61±387.23
cranial | 158.80 | 792.40±550.23
middle | 131.24 | 861.88±528.19
caudal | 307.57 | 610.95±465.79
accessory | 116.90 | 594.00±442.61

## Additional Notes

  * Overall quality: A
  * Airway surface wall for bifuraction leading into accessory lobe is not modeled well.
  
