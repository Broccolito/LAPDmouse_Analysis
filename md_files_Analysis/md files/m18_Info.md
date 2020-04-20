# m18

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: CD-1
  * Weight (g): 23.2
  * Vendor: Charles River
  * Physical abnormalities: FMS on nose and esophagus
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)
  
## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        |     244  |    0.29 |      71.0   | 0.98 |
  |Post 5min Aerosol  |     199  |    0.23 |      46.4   | 0.92 |
  |Post 10min Aerosol |     201  |    0.25 |      49.9   | 0.90 |
  
## Slicing Info

  * Approximate lung orientation: RPS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.68 x 4.68  9.52 (microns)
  * Image exposures (msec). ISO=160, all images.
  
  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |  33    |  200   |  8000  |  200   |Rhodamine B in OCT     |
  |cal       |  20    |  167   |  67    |  400   |                       |
  |images    |        |  67    |  20000 |  1600  |                       |
  |darks     |        |  57    |  20000 |  1600  |                       |

  * Notes regarding slicing:
    * Sample is rotated 180 degrees around trachea from normal -
      posterior region appears at the top of the image.
    * Good aerosol signal throughout.
    
## Airway Segmentation

  * Total centerline length: 506.222 mm
  * Number of branches: 1210
  * Number of terminal branches: 606
  * Maximum generation number: 23
  * Number of outlet areas: 1440

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1143.70 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1143.70
Lobes        | 5 | 228.74±87.89
Sublobes     | 55 | 20.39±19.67
Near acini   | 365 | 3.01±2.03

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 348.67 | 1.12±3.01
cranial | 206.61 | 1.93±3.43
middle | 144.28 | 0.89±2.99
caudal | 312.98 | 0.97±3.26
accessory | 131.16 | 1.05±3.81

## Additional Notes

  * Overall quality: B
  * some airway branches missing
  
