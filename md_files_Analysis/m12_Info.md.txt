# m12

[Go to data folder](https://drive.google.com/open?id=1XaYpes67y3nkRMlD6KZtgez3f8s9d-BK)

![Screenshot showing aerosol deposition](https://drive.google.com/uc?export=download&amp;id=1WCNriWOOeV7tlwP4knTOnV2fTv9XamBt =400x*)

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: CD-1
  * Weight (g): 24.5
  * Vendor: Charles Rivers
  * Physical abnormalities: none
  * Protocol (link XXX)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: 6.24E+08 FMS

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 219      | 0.36    | 77.8        | 0.95 |
  |Post 5 Aerosol     | 241      | 0.38    | 91.1        | 1.07 |
  |Post 10 Aerosol    | 189      | 0.34    | 64.8        | 0.78 |

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
    * One long stoppage during slicing (at 763/764)
    * I accidentally scraped the sample surface (slice 1050)
      
## Airway Segmentation

  * Total centerline length: 582.052 mm
  * Number of branches: 1512
  * Number of terminal branches: 758
  * Maximum generation number: 28
  * Number of outlet areas: 1855

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1197.04 (mm^3)
  * Total aerosol deposition: 862206.05

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lobes        | 5 | 239.41±105.52
Sublobes     | 56 | 20.80±20.45
Near acini   | 421 | 2.69±1.57

Lobe      | Volume (mm^3) | Aerosol deposition density
--------- | ------------- | ----------------------
left | 370.61 | 685.00±548.24
cranial | 228.63 | 978.20±664.38
middle | 151.02 | 673.51±459.21
caudal | 345.90 | 635.18±446.36
accessory | 100.88 | 627.19±424.81

## Additional Notes

  * Overall quality: B
  * Long cyromicrotome stoppage caused imaging artifacts affecting segmentations.
  * Some medium diameter airway branches close to the top of the sampe are missing.
  * Left main bronchus, after trachea, has unusual shape and some segmentation issues.
  * In some parts between cranial and caucal lobe no fissure was visible which made lobe segmentation difficult. 
  
