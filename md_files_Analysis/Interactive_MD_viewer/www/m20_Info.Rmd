# m20

## Mouse Physiologic Parameters

  * Gender: Female
  * Strain: B6C3F1
  * Weight (g): 19.9
  * Vendor: Charles River
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD
  * Problem with DAQ during exposure, so no breathing information for this animal.

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | NaN      | NaN     | NaN         | NaN  |
  |Post 5min Aerosol  | NaN      | NaN     | NaN         | NaN  |
  |Post 10min Aerosol | NaN      | NaN     | NaN         | NaN  |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.68 x 4.68 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |    33  |   200  |  8000  |   200  |Rhodamine B in OCT     |
  |cal       |    20  |   167  |    67  |   400  |                       |
  |images    |        |    77  | 20000  |  2000  |                       |
  |darks     |        |    77  | 20000  |  2000  |                       |

  * Notes regarding slicing:
    * The cardiac lobe may be oddly shaped
    * Some OCT leaks and small tears in the right lung
    * Decent aerosol signal, but some very low signal areas and a few
      saturated blobs.
    * OK sample.
      
## Airway Segmentation

  * Total centerline length: 668.307 mm
  * Number of branches: 1944
  * Number of terminal branches: 976
  * Maximum generation number: 24
  * Number of outlet areas: 2353

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1078.04 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1078.04
Lobes        | 5 | 215.61±95.56
Sublobes     | 54 | 19.33±19.41
Near acini   | 300 | 3.36±2.18

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 340.66 | 1.05±1.78
cranial | 177.11 | 2.07±3.99
middle | 135.91 | 0.92±1.01
caudal | 317.46 | 1.15±1.32
accessory | 106.91 | 0.83±1.08

## Additional Notes

  * Overall quality: A
  
