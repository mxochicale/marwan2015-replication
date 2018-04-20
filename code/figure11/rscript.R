###############################################################################	
#
# Recurrence plot fo the x solution of the lorenz system
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
	


#################
# Start the clock!
start.time <- Sys.time()


################################################################################
# (0) Loading Functions and Libraries


library(deSolve) # call deSolve first to avoid (Error in .C("unlock_solver") : )
library(devtools)
load_all('~/mxochicale/github/nonlinearTseries')

library(data.table) # for manipulating data
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt



################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()




################################################################################
# (2) Lorez Time Series
Lorenz <- function(t, state, parameters){
	  with(as.list( c(state,parameters)),
	      {
	      #rate of change
	      dX <- sigma*(Y-X)
	      dY <- rho*X - X*Z - Y
	      dZ <- X*Y - beta*Z

	      # return the rate of change
	      list( c(dX, dY, dZ) )
	      }
	  )# end with(as.list...
}

#define controlling parameters
# rho     - Scaled Rayleigh number.
# sigma   - Prandtl number.
# beta   - Geometry ascpet ratio.
parameters <- c(rho=28, sigma= 10, beta=8/3)

#define initial state
state <- c(X=1, Y=1, Z=1)
# state <- c(X=20, Y=41, Z=20)


# define integrations times
# times <- seq(0,100, by=0.001)
#times <- seq(0,100, by=0.01)
times <- seq(0,5, by=0.01)





#perform the integration and assign it to variable 'out'
out <- ode(y=state, times= times, func=Lorenz, parms=parameters)


lorenzdt <- as.data.table(out)

fsNNtmp <-function(x) {list("Lorenz")}
lorenzdt[,c("type"):=fsNNtmp(), ]
lorenzdt[,sample:=seq(.N)]
setcolorder(lorenzdt, c(5,6,1:4))





################################################################################
# (3) Plotting State Spaces

png(filename="A.png",
  bg = "transparent",
  type="cairo",
  width = 800, height = 800, units = "px",
  pointsize=20,
  res=75
  )
	# type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)
	#

scatter3D(
  lorenzdt$X, lorenzdt$Y, lorenzdt$Z,
  colvar = lorenzdt$sample, bty = "u", type = "l", lwd=4,
	axis.scales = TRUE,
  main = "",
  xlab = 'x(n)', ylab ='y(n)', zlab = 'z(n)',
  colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)
  )


dev.off()



#################################################################################
## (4) Computing Recurrence Quantification Parameters
##

lorenz.ts <- lorenzdt$X
rqa.analysis=rqa(time.series = lorenz.ts, embedding.dim=2, time.lag=1,
                radius=2,lmin=2,vmin=2,do.plot=FALSE,distanceToBorder=2)




#################################################################################
## (5) Plotting Recurrence Plot
##

rm <- as.matrix(rqa.analysis$recurrence.matrix)
RM <- as.data.table( melt(rm, varnames=c('a','b'),value.name='Recurrence') )
r <- ggplot(RM)+
	geom_raster( aes(x=a,y=b,fill=Recurrence) ) +  
	scale_fill_manual( values = c("#ffffff", "#000000") ) +
	labs(x="Sample", y="Sample") +
  	theme_bw(base_size=15) + 
	theme(legend.position="none")


### Save Picture
width = 1000
height = 1000
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

ggsave(filename = "rp.png",
             dpi = dpi,
             width = width.calc,
             height = height.calc,
             units = 'in',
             bg = "transparent",
             device = "png"
             , r)






#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time





################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
