
### Load the package or install if not present
mirror_repo <- 'https://www.stats.bris.ac.uk/R/'

## OTHER UK MIRRORS
#  https://www.stats.bris.ac.uk/R/
#  http://www.stats.bris.ac.uk/R/
#  https://mirrors.ebi.ac.uk/CRAN/
#  http://mirrors.ebi.ac.uk/CRAN/
#  https://cran.ma.imperial.ac.uk/
#  http://cran.ma.imperial.ac.uk/
#  http://mirror.mdx.ac.uk/R/



### devtools
install.packages("devtools", repos=mirror_repo, dependencies = TRUE)

#### [data.table]([https://github.com/Rdatatable/data.table/wiki/Installation)
library(devtools)
install_github("Rdatatable/data.table", build_vignettes=FALSE)

### RColorBrewer
install.packages("RColorBrewer", repos=mirror_repo, dependencies = TRUE)

### ggplot2
install.packages("ggplot2", repos=mirror_repo, dependencies = TRUE)

### deSolve
install.packages("deSolve", repos=mirror_repo, dependencies = TRUE)

### reshape2
install.packages("reshape2", repos=mirror_repo, dependencies = TRUE)

### plot3D
install.packages("plot3D", repos=mirror_repo, dependencies = TRUE)
#.packages <- c('car', 'scatterplot3d', 'plot3D')
#lapply(.packages, install.packages, dependencies = TRUE, repos=mirror_repo)

### dependencies for nonlinearTseries
install.packages("tseries", repos=mirror_repo, dependencies = TRUE)
install.packages("TSA", repos=mirror_repo, dependencies = TRUE)
install.packages("RcppArmadillo", repos=mirror_repo, dependencies = TRUE)

### nonlinearTseries
install.packages("nonlinearTseries", repos=mirror_repo, dependencies = TRUE)

