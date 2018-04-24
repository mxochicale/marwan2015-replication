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

figures_path <- paste(main_repository_path,'/figures',sep="")
figures_folder_name <- '/figure12'




################################################################################
# (0) Loading Functions and Libraries


library(deSolve) # call deSolve first to avoid (Error in .C("unlock_solver") : )
library(data.table) # for manipulating data
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt


library(devtools)
load_all( paste(github_path,'/nonlinearTseries',sep='') )






################################################################################
# (1) Homogeneous (uniformly distributed noise)


#randomcolorednoise.map = function(X){
#  X.new=X
#  
#  X.new[1,] = 0.95*X[1,] + rnorm(1, mean=0.01, sd=0.05)
#
#  X=X.new
#  return(X.new)  
#}
#
#
#randomcolorednoise.map.ts = function(timesteps,x) {
#    x.ts = matrix(nrow=1,ncol=timesteps)
#     x.ts[,1] = x[,1]
#    for (t in (2:timesteps)) {
#      x = randomcolorednoise.map(x)
#      x.ts[,t] = x
#   }
#    return(x.ts)
#}
# 
#
#N <- 1000
#x <- matrix(c(0),ncol=1) ## initial conditions
#
#noise<- as.data.table(  t( randomcolorednoise.map.ts(N,x)   )  ) 
#
#noise [,n:= 0:(.N-1),]
#setcolorder(noise, c(2,1))
#names(noise) <- c('n', 'x')
#



## simulate 
N <- 1000
unoise = runif(N)
noise <- as.data.table(unoise)


noise [,n:= 0:(.N-1),]
setcolorder(noise, c(2,1))
names(noise) <- c('n', 'x')




#################################################################################
## (2) Computing Recurrence Quantification Parameters
##
#' @param radius Maximum distance between two phase-space points to be
#' considered a recurrence.
#
ts <- noise$x
rqa.analysis=rqa(time.series = ts, embedding.dim=1, time.lag=1,
                radius=0.2,lmin=2,vmin=2,do.plot=FALSE, distanceToBorder=2)



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


filenametag <- paste('A-xnoise-',N, '.png',sep='')
filename_extension <-  paste('rp-',filenametag,sep='')  
width = 1000
height = 1000


rplot <- plotRecurrencePlot(RM,maxsamplerp)
savePlot(filename_extension,width,height,rplot)


#rplot2 <-  plotOnlyRecurrencePlot(RM,maxsamplerp)
#savePlot('rp2.png',width,height,rplot2)



#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time


################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
