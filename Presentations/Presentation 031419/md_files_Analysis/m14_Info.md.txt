# m14

[Go to data folder](https://drive.google.com/open?id=1EYzm5aYG-IyKc-SIFHFACb5dH3d04icH)

![Screenshot showing aerosol deposition](https://drive.google.com/uc?export=download&amp;id=1KsH-wTtc0axHTXrT94vlhxgiG8iIoVdD =400x*)

## Mouse Physiologic Parameters

  * Gender: Male
  * Strain: C57Bl/6
  * Weight (g): 22.4g
  * Vendor: Jackson Labs
  * Physical abnormalities: none
  * Protocol (link %s)
  
## Aerosol Dosing

  * Particle size: 1 microns
  * Exposure time: 10 minutes
  * Relative exposure estimate: TBD

  | Time              | RR (bpm) | Vt (ml) | VE (ml/min) | I:E  |
  |:------------------|---------:|--------:|------------:|-----:|
  |Pre Aerosol        |     223  |    0.31 |      68.8   | 0.87 |
  |Post 5min Aerosol  |     252  |    0.28 |      71.3   | 0.89 |
  |Post 10min Aerosol |     225  |    0.24 |      54.8   | 0.74 |
  
## Slicing Info

  * Approximate lung orientation: LAS
  * Camera: D7100, 14-bit, 200mm Nikkor Macro lens, f/16
  * Voxel size: 4.66 x 4.66 x 9.52 (microns)
  * Image exposures (msec). ISO=160, all images.
  
|          |   mt   |   ol   |   fl   |   rd   |       Notes           |
|:--------:|:------:|:------:|:------:|:------:|:----------------------|
|excitation| UVND2  | UVND2  | 485/20 | 560/20 |wavelength (nm)        |
|emission  | n/a    |470/30  | 535/30 | 635/30 |                       |
|**Image** |**Exp** |**Exp** |**Exp** |**Exp** |    **Notes**          |
|white     |20      |125     |5000    |167     |Rhodamine B in OCT     |
|cal       |20      |167     |67      |400     |                       |
|images    |N/A     |67      |15000   |500     |                       |
|darks     |        |67      |15000   |500     |                       |

  * Notes regarding slicing:
    * Aerosol signal is good.
    * Sample nearly went out of the field of view

## Airway Segmentation

  * Total centerline length: 654.191 mm
  * Number of branches: 1621
  * Number of terminal branches: 812
  * Maximum generation number: 24
  * Number of outlet areas: 1766

## Compartment Sizes and Aerosol Deposition

  * Lung volume: 1444.02 (mm^3)
  * Total aerosol deposition: 2038777.06

Compartments | Count | Volume (mm^3)
------------ | ----- | -------------
Lobes        | 5 | 288.80±133.79
Sublobes     | 52 | 27.00±28.09
Near acini   | 485 | 2.82±1.45

Lobe      | Volume (mm^3) | Aerosol deposition density
--------- | ------------- | ----------------------
left | 471.01 | 1614.75±1126.00
cranial | 262.35 | 1777.72±1226.52
middle | 170.21 | 965.43±567.26
caudal | 413.15 | 1255.97±727.34
accessory | 127.31 | 1010.21±579.18

## Additional Notes

  * Overall quality: A
  * Skeletonization for first bifurcation in left lobe looks off
  
