###############################################################################	
#
# Recurrence plot for drift (logistic map xi+1 = 4xi(1-xi) )
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
figures_path <- paste(main_repository_path,'/figures',sep="")
figures_folder_name <- '/figure12'




################################################################################
# (0) Loading Functions and Libraries


library(data.table) # for manipulating data
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt


library(devtools)
load_all( paste(github_path,'/nonlinearTseries',sep='') )






################################################################################
# (1) Homogeneous (uniformly distributed noise)

#REF: https://www.r-bloggers.com/logistic-map-feigenbaum-diagram/
logistic.map <- function(r, x, N, M){
  ## r: bifurcation parameter
  ## x: initial value
  ## N: Number of iteration
  ## M: Number of iteration points to be returned
  z <- 1:N
  z[1] <- x
  for(i in c(1:(N-1))){
    z[i+1] <- r *z[i]  * (1 - z[i])
  }
  ## Return the last M iterations 
  z[c((N-M):N)]
}


N <- 1000
M <- N
lm <- logistic.map(r=4, x=0.001, N=1000, M)



#################################################################################
## (2) Computing Recurrence Quantification Parameters
##
#' @param radius Maximum distance between two phase-space points to be
#' considered a recurrence.
#
ts <- lm
rqa.analysis=rqa(time.series = ts, embedding.dim=1, time.lag=1,
                radius=0.2,lmin=2,vmin=2,do.plot=FALSE,distanceToBorder=2)


#################################################################################
## (3) Plotting Recurrence Plot
##
plot_path <- paste(figures_path,figures_folder_name,sep="")
if (file.exists(plot_path)){
    setwd(file.path(plot_path))
} else {
  dir.create(plot_path, recursive=TRUE)
  setwd(file.path(plot_path))
}



## Calling `functions_extra_nonlinearTseries` 
source( paste(github_path,'/tavand/functions/functions_extra_nonlinearTseries.R',sep='') )

rm <- as.matrix(rqa.analysis$recurrence.matrix)
maxsamplerp <- dim(rm)[1]
RM <- as.data.table( melt(rm, varnames=c('a','b'),value.name='Recurrence') )

filenametag <- paste('C-',N, '.png',sep='')
filename_extension <-  paste('rp-',filenametag,sep='')  
width = 1000
height = 1000


#rplot <- plotRecurrencePlot(RM,maxsamplerp)
#savePlot(filename_extension,width,height,rplot)

rplot2 <-  plotOnlyRecurrencePlot(RM,maxsamplerp)
savePlot(filename_extension,width,height,rplot2)



#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time


################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
