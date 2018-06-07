###############################################################################	
#
# Recurrence plot for  Homogeneous (uniformly distributed noise)
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


library(deSolve) # call deSolve first to avoid (Error in .C("unlock_solver") : )
library(data.table) # for manipulating data
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt
library(nonlinearTseries)






################################################################################
# (1) Homogeneous (uniformly distributed noise)
## `emailing-authors/exrps.m` LINE 33:
## N=400;
## X=crp(rand(N,1),1,1,.2,'sil');


## simulate 
N <- 400
unoise = runif(N)
noise <- as.data.table(unoise)


noise [,n:= 0:(.N-1),]
setcolorder(noise, c(2,1))
names(noise) <- c('n', 'x')






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



pts <- ggplot(noise,aes(x = n, y = x)) + 
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

file_ext <- paste('A.png', sep='')
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
