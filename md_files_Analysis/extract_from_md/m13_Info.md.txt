# m13

[Go to data folder](https://drive.google.com/open?id=1-wjrRXWVGWk6zGfwrEUnS13SQH1gUg-u)

![Screenshot showing aerosol deposition](https://drive.google.com/uc?export=download&amp;id=1iZ_UeeeN5tBjKeSpuOopWb5PhjDhXiXk =400x*)

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: CD-1
  * Weight (g): 23.4
  * Vendor: Charles Rivers
  * Physical abnormalities: none
  * Protocol (link XXX)

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
  * Total aerosol deposition: 822101.52

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lobes        | 5 | 240.45±95.69
Sublobes     | 53 | 22.06±21.90
Near acini   | 404 | 2.83±1.57

Lobe      | Volume (mm^3) | Aerosol deposition density
--------- | ------------- | ----------------------
left | 373.93 | 717.96±592.26
cranial | 252.40 | 721.78±521.76
middle | 160.73 | 751.61±464.46
caudal | 305.86 | 600.36±424.83
accessory | 109.34 | 612.99±444.30

## Additional Notes

  * Overall quality: A
  * The walls of some peripheral airways were not well segmented.
  
