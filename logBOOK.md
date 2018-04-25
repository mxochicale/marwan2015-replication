Log BOOK
---
# Useful replication repositories that use R

* [stojic2017](https://github.com/hstojic/HintonNowlan1987_replication)
* [stachelek2015](https://github.com/jsta/ReScience-submission/tree/STACHELEK)



## TODO


* [ ] contact the authors to ask about the equations to create the 
	time series for the RP in figures 1.1 and 1.2
	(added:24april2018.12h04m,sorted:???)

* [ ] add description about the graphical results with respect to 
	the changes of the parameters of rqa() in the article:
	`rqa.analysis=rqa(time.series = ts, embedding.dim=1, time.lag=1,
       	radius=1.5, lmin=2, vmin=2, do.plot=FALSE, distanceToBorder=2)`
		(added:24april2018.21h12m;sorted:???)



## SORTED
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


