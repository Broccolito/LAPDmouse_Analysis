# m16

## Mouse Physiologic Parameters

  * Gender: M
  * Strain: C57BL/6
  * Weight (g): 22.0
  * Vendor: Jackson Labs
  * Physical abnormalities: None
  * Protocol (https://lapdmouse.iibi.uiowa.edu/AnimalModel/)

## Aerosol Dosing

  * Particle size: 2 microns
  * Exposure time: 15 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        | 286      | 0.23    | 64.9        | 0.80 |
  |Post 5min Aerosol  | 281      | 0.23    | 65.6        | 0.79 |
  |Post 10min Aerosol | 270      | 0.25    | 67.5        | 0.79 |

## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.67 x 4.67 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.

  |          |   mt   |   ol   |   fl   |   rd   |       Notes           |
  |:--------:|:------:|:------:|:------:|:------:|:----------------------|
  |excitation| UVND2  | UVND2  | 485/20 | 560/20 |center wavelength/fwhm |
  |emission  | N/A    |470/30  | 535/30 | 635/30 |                       |
  |**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
  |white     |    20  |   125  |  5000  |   167  |Rhodamine B in OCT     |
  |cal       |    20  |   167  |    67  |   400  |                       |
  |images    |        |    67  | 15000  |   500  |                       |
  |darks     |        |    67  | 15000  |   500  |                       |

  * Notes regarding slicing:
    * Very light aerosol signal
    * Good sample.
    
## Airway Segmentation

  * Total centerline length: 699.275 mm
  * Number of branches: 2211
  * Number of terminal branches: 1109
  * Maximum generation number: 27
  * Number of outlet areas: 2327

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1122.84 (mm^3)

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lung         | 1 | 1122.84
Lobes        | 5 | 224.57±106.12
Sublobes     | 52 | 20.88±20.97
Near acini   | 230 | 4.59±3.44

Lobe      | Volume (mm^3) | Average aerosol deposition
--------- | ------------- | ----------------------
left | 381.07 | 0.86±5.49
cranial | 187.50 | 1.64±5.51
middle | 127.18 | 1.40±2.72
caudal | 315.30 | 1.30±6.22
accessory | 111.78 | 1.11±3.31

## Additional Notes

  * Overall quality: A
  * Skeletonization for first bifurcation in left lobe looks off
  
