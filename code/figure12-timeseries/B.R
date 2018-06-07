###############################################################################	
#
# Recurrence plot for periodic (super-posited harmonic oscillations)
# 
#
#
#
#
# * If you have a question or comment that might be relevant 
#	to other people, please open an issue.
# * If you have any specific questions about the information 
#	of this repository, you can me by vising: https://mxochicale.github.io/
#
#
#
###############################################################################	
	# OUTLINE:
	# (0) Loading libraries and functions
 	# (1) Definifing paths
	# (2) Lorez Time Series
	# (3) Plotting State Spaces
	# (4) Computing Recurrence Quantification Parameters
	# (5) Plotting Recurrence Plot




#################
# Start the clock!
start.time <- Sys.time()

################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()


setwd("../../")
main_repository_path <- getwd()
setwd("../")
github_path <- getwd()

version <- 'v01'
figures_path <- paste(main_repository_path,'/figures',sep="")
figures_folder_name <- '/figure12-timeseries'




################################################################################
# (0) Loading Functions and Libraries
library(data.table)
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt
library(nonlinearTseries)

################################################################################
# (1) SineWaves
## `emailing-authors/exrps.m` L39
##N=400;X=crp(sin(.2*[1:N]').*sin(.05*[1:N]'),1,31,.4,'sil');

N <- 400
tn <- 0:N
tsn <- sin ( (1/5)*tn ) * sin ( (5/100)*tn  )
tsn <- as.data.table(tsn)

tsn [,n:= 0:(.N-1),]
setcolorder(tsn, c(2,1))
names(tsn) <- c('tn', 'ftn')


#################################################################################
## (3) Create 
##
plot_path <- paste(figures_path, figures_folder_name, '/', version,sep="")
if (file.exists(plot_path)){
    setwd(file.path(plot_path))
} else {
  dir.create(plot_path, recursive=TRUE)
  setwd(file.path(plot_path))
}



pts <- ggplot(tsn,aes(x = tn, y = ftn)) + 
	geom_line(size = 1)+
	labs(x = "Samples, n", y = 'x(n)')+
	theme_bw(18) 
	

### Save Picture
width = 800
height = 400
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

file_ext <- paste('B.png', sep='')
ggsave(filename = file_ext,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pts)



#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
