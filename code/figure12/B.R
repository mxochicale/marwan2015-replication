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
figures_path <- paste(main_repository_path,'/figures',sep="")
figures_folder_name <- '/figure12'




################################################################################
# (0) Loading Functions and Libraries
library(data.table)
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt

library(devtools)
load_all( paste(github_path,'/nonlinearTseries',sep='') )



################################################################################
# (1) SineWaves



################################################################################
## SineWaves Function
# dc.component <- 0
# amplitudes <- c(1,1,1)  # strength of signal components
# frequencies <- c(4,2,0) # frequency of signal components (Hz)
# delays <- c(0,0,0)      # delay of signal components (radians)
sinewaves.func <- function(t,dc.component,amplitudes,frequencies,delays, mean.additivenoise, sd.additivenoise ) {
    dc.component +
    sum( amplitudes * sin(2*pi*frequencies*t + delays) +
    rnorm(length(t), mean = mean.additivenoise, sd = sd.additivenoise  )
    )
}



##################################################################
# Time Domain setup
acq.freq <- 50  # 50 Hertz
dt <- 1/acq.freq # 0.02 seconds or 20 miliseconds

# T <- 4   ## Maximum Time in seconds
# T <- 8   ## Maximum Time in seconds
T <- 20   ## Maximum Time in seconds




df <- 1/T
n <- T/dt
t <- seq(0,T,by=dt)



################################################################################
# Create Waveforms in a data.table object


N <- (length(t)-1)
allSDnoise <- 0.00
#allSDnoise <- 0.05
# allSDnoise <- 0.1




s1 <- data.table(
  n=0:(length(t)-1),
  tn=t,
  xtn=sapply(t, sinewaves.func, dc.component=0, amplitudes=c(1,1,1), frequencies=c(1/2,1/4,0), delays=c(0,0,0), mean.additivenoise=0, sd.additivenoise=allSDnoise)
  )
s1 <- cbind(type="s1",s1) # Addind type column



#################################################################################
## (2) Computing Recurrence Quantification Parameters
##
#' @param radius Maximum distance between two phase-space points to be
#' considered a recurrence.
#
ts <- s1$xtn
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


filenametag <- paste('B-xnoise-',N, '.png',sep='')
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
