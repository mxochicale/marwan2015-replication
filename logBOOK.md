Log BOOK
---
# Useful replication repositories that use R

* [stojic2017](https://github.com/hstojic/HintonNowlan1987_replication)
* [stachelek2015](https://github.com/jsta/ReScience-submission/tree/STACHELEK)



## TODO

* [ ] email authors after replicating their code
	(added:30april.10h40m, sorted:???.???)


* [ ] add description about the graphical results with respect to 
	the changes of the parameters of rqa() in the article:
	`rqa.analysis=rqa(time.series = ts, embedding.dim=1, time.lag=1,
       	radius=1.5, lmin=2, vmin=2, do.plot=FALSE, distanceToBorder=2)`
		(added:24april2018.21h12m;sorted:???)



## SORTED



* [x] update figure11 with the similar parameters 
	(added:30april2018.10h40m, sorted:30april2018.16h33m)


* [x] replicate `exrps.m` equations to create RP with the use of `A,B,C,D . R`
	(added:27april2018.22h45m, sorted:31april2018.10h32m)


* [x] update the dependencies section to avoid the user get extra packages
	* [x] update `install-R-packages.R` with the right packages (sorted:28april2018.13h26m)
	* [x] move the function `/tavand/functions/functions_extra_nonlinearTseries.R` to the code path (29april2018.18h30m)
	* [x] use the main package of `nonlinearTseries` and comment left this repo for testing
	`load_all( paste(github_path,'/nonlinearTseries',sep='') )` (29april2017.19h00m)
	(added:27april2018.22h22m, sorted:29april2017.20h00)


* [x] contact the authors to ask about the equations to create the 
	time series for the RP in figures 1.1 and 1.2: `~/marwan2015-replication/emailing-authors` 
	(added:24april2018.12h04m,sorted:26april2018.22h48m)



* [x] start the draft article with figures
	(added:24april2018)


* [x] replication of figure 1.2
	(added:19april2018.14h36m;sorted:???)

	* [x] create time series for:
		* a. uniformly distributed noise
		* b. periodic ( super-positioned harmonic oscillations  )
		* c. drift (logistic map xi+1 = 4xi(1-xi)
		* d. disruped (brownian motion)

	* [x] polish previous plots and scripts and add description
		 (use same paremeters and others that create consistence in the results) 
		(added:24april2018.20h53m;sorted:24april2018.12h05m)



* [x] create path to save plots (different from the code path)
	`/marwan2015-replication/figures/figure1` 
	(added:20april2018.21h49m;sorted:23april2018.19h03m)





* [x]  create script outline as `http://datacolada.org/69`
	(added:20april2018.21h50m;sorted:23april2018.17h49m)




* [x]  tune the recurrence plot with the paramters of ggplot2()	
	(added:20april2018.21h46m;sorted:23april.14h00m)
	* [x] add/create function for recurrence plots in `~/github/tavand`
		(added:20april2018.21h47m;sorted:23april.14h55m)
		 `source("~/mxochicale/github/tavand/functions/functions_extra_nonlinearTseries.R")`


* [x] replication of figure 1.1
	(added:19april2018.14h35m;sorted:20april2018.21h44m)


