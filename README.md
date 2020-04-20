# lung_particle_deposition_analysis
This script provides a general interface and fundamental functions to process the lung particle deposition data in CSV format.

##### Database hosted on: https://lapdmouse.iibi.uiowa.edu/

## Getting Started

In order to work on this project, you should have R on your computer and Rstudio, as a powerful IDE, is strongly recommended.

Install R:
```bash
sudo apt-get update
sudo apt-get install r-base
```

Install Rstudio:
* [Rstudio](https://www.r-project.org/) - Download Rstudio from here.

### Prerequisites

Packages in R that you need prior to working on this project

```r
library(ggplot2)
library(Hmisc)
library(knitr)
library(dplyr)
library(listviewer)

#If some of the packages are not installed yet, install using:
if(!require("package_name")){
  install.packages("package_name")
  library("package_name")
}
```

## Built With

* [R](https://www.r-project.org/) - The data Analysis tool used 
* [LAPD Dataset](#) - The lung particle deposition dataset

## Contributing

The dataset is currently under beta testing. Free contributions will be accepted after the official release of the dataset


## Authors

* **Wanjun Gu** - *Initial work* - [Broccolito](https://github.com/Broccolito)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

[Chantal Darquenne Laboratory](https://medschool.ucsd.edu/som/medicine/divisions/physiology/research/labs/darquenne/)
