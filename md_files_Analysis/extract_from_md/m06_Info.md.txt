# m06

[Go to data folder](https://drive.google.com/open?id=10HHnfGF7tKCEJnWJVAFSfg_f_K5qoj5l)

![Screenshot showing aerosol deposition](https://drive.google.com/uc?export=download&amp;id=1_BMR1mnXbPRSK1WscUZhjJ1T-K_Ggnld =400x*)

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: B6C3F1
  * Weight (g): 21.0
  * Vendor: Charles Rivers
  * Physical abnormalities: none
  * Protocol (link XXX)

## Aerosol Dosing

  * Particle size: 1 micron
  * Exposure time: 10 minutes
  * Relative exposure estimate: 1.24E08 FMS

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 133      | 0.16    | 20.9        | 1.00 |
  |Post 5 Aerosol     | 164      | 0.16    | 25.8        | 0.97 |
  |Post 10 Aerosol    | 201      | 0.27    | 55.2        | 0.93 |

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
  |white     |   25      |  125    |  6000   |  167    | 1 drop rhodamine B/10mL OCT |
  |cal       |   20      |   50    |    40   |  200    |                       |
  |images    |   N/A     |   50    | 15000   |  333    |                       |
  |darks     |           |   50    | 15000   |  333    |                       |

  * Notes regarding slicing:
    * Sample broke before embedding so the trachea is very short and
      port of the tracheal wall is missing at the top of the sample.
    * Problem with camera focus around slices 661-664.
    * Two fiducial markers are missing before slicing was finished.
      
## Airway Segmentation

  * Total centerline length: 605.276 mm
  * Number of branches: 1670
  * Number of terminal branches: 839
  * Maximum generation number: 25
  * Number of outlet areas: 1912

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1103.35 (mm^3)
  * Total aerosol deposition: 413319.87

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lobes        | 5 | 220.67±94.33
Sublobes     | 53 | 20.18±19.19
Near acini   | 386 | 2.68±1.36

Lobe      | Volume (mm^3) | Aerosol deposition density
--------- | ------------- | ----------------------
left | 356.26 | 405.96±363.41
cranial | 183.37 | 422.91±347.78
middle | 144.45 | 361.88±267.04
caudal | 306.23 | 351.27±279.84
accessory | 113.04 | 276.89±227.86

## Additional Notes

  * Overall quality: B
  * Fiducial markers were not visible to the very end of the sample leading to some larger displacements
  * Sample broke before embedding, breaking off part of the trachea. Segmented trachea piece is very short.
  
  
