# m15

## Mouse Physiologic Parameters

  * Gender: Male
  * Strain: B6C3F1
  * Weight (g): 23.8
  * Vendor: Charles River
  * Physical abnormalities: intense pink nose
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)
  
## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        |     222  |    0.25 |      55.9   | 0.91 |
  |Post 5min Aerosol  |     182  |    0.24 |      44.0   | 0.81 |
  |Post 10min Aerosol |     191  |    0.26 |      50.6   | 0.86 |
  
## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.68 x 4.68  9.52 (microns)
  * Image exposures (msec). ISO=160, all images.
  
  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     | 33     | 200    | 8000   | 200    |Rhodamine B in OCT     |
  |cal       | 20     | 167    | 67     | 400    |                       |
  |images    |        | 77     | 20000  | 1600   |                       |
  |darks     |        | 77     | 20000  | 1600   |                       |

  * Notes regarding slicing:
    * The sample rotated a little bit clockwise in the embedding
      material.
    * The left lung touched one of the fiducial markers.
    * Good aerosol signal.
    
## Airway Segmentation

  * Total centerline length: 679.088 mm
  * Number of branches: 2142
  * Number of terminal branches: 1074
  * Maximum generation number: 27
  * Number of outlet areas: 2465

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1075.84 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1075.84
Lobes        | 5 | 215.17±109.49
Sublobes     | 52 | 20.07±20.05
Near acini   | 280 | 3.61±2.56

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 363.24 | 1.24±2.05
cranial | 164.32 | 1.98±2.73
middle | 114.71 | 0.79±1.15
caudal | 329.33 | 1.10±1.60
accessory | 104.23 | 0.67±0.96

## Additional Notes

  * Overall quality: B
  * main accessory lobe branch not perfectly segmented
  * main middle lobe branch is kinked in the sample
  * Lung tissue in part of left lobe looked unusual
