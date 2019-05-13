# m09

[Go to data folder](https://drive.google.com/open?id=1h4t-6lWMCKFo8Hn50PAhWwLsDEcnLUeu)

![Screenshot showing aerosol deposition](https://drive.google.com/uc?export=download&amp;id=1gk22bAxWa1chs96O2ZS-paR1L2wrtKpx =400x*)

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: BALB/c
  * Weight (g): 23.7
  * Vendor: Jackson Labs
  * Physical abnormalities: none
  * Protocol (link XXX)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: 1.37E+08 FMS

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 220      | 0.24    | 53.6        | 0.90 |
  |Post 5 Aerosol     | 216      | 0.21    | 46.4        | 0.75 |
  |Post 10 Aerosol    | 236      | 0.29    | 67.7        | 0.80 |

## Slicing Info

  * Approximate lung orientation: LAS (rotated ~45 deg CCW)
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.64 x 4.64 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt      |   ol    |   fl    |   rd    |       Notes           |
  |:--------:|:---------:|:-------:|:-------:|:-------:|:----------------------|
  |excitation| UVND2     | UVND2   | 485/20  | 560/20  |center wavelength/fwhm |
  |emission  | N/A       | 470/30  | 535/30  | 635/30  |      (nm)             |
  |**Image** |**Exp**    |**Exp**  |**Exp**  |**Exp**  |    **Notes**          |
  |white     |    25     |   125   |  6000   |  167    | 1 drop rhodamine B/10mL OCT |
  |cal       |    20     |    50   |    40   |  200    |                       |
  |images    |   N/A     |    50   | 15000   |  333    |                       |
  |darks     |           |    50   | 15000   |  333    |                       |

  * Notes regarding slicing:
    * One 'hanging' shard covered a portion of the lung for tens of
      slices in the caudal region (around slice 1945)
    * The apex of the right lung may have a break in it.
      
## Airway Segmentation

  * Total centerline length: 529.485 mm
  * Number of branches: 1246
  * Number of terminal branches: 628
  * Maximum generation number: 26
  * Number of outlet areas: 1810

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1128.40 (mm^3)
  * Total aerosol deposition: 431969.76

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lobes        | 5 | 225.68±104.88
Sublobes     | 52 | 21.23±19.36
Near acini   | 376 | 2.85±1.75

Lobe      | Volume (mm^3) | Aerosol deposition density
--------- | ------------- | ----------------------
left | 382.24 | 410.96±369.57
cranial | 172.30 | 415.85±428.07
middle | 146.63 | 388.36±310.06
caudal | 316.33 | 325.99±292.18
accessory | 110.91 | 389.21±314.09

## Additional Notes

  * Overall quality: A
  * Bottom tip of caudal lobe has dark/out of focus areas which affected visibility of some peripheral airways
  
