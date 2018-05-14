

# (005)


```
from:	Webber Jr, Charles <Cwebber@luc.edu>
to:	"Miguel P. Xochicale" <perez.xochicale@gmail.com>
cc:	"marwan@pik-potsdam.de" <marwan@pik-potsdam.de>
date:	12 May 2018 at 15:51


Hi Miguel - Below I answer your three questions to me. - Best, Chuck 05/12/18

Q1 - Window Size: I speak from my experience of selecting window size, 
not from any one publication that has explored this in detail.

Q2 - RQA Dangerous tool: This comment comes not just from common sense in the nonlinear world, 
but from a specific investigator 20 years ago who insisted he saw patterns in data using 
an embedding dimension of 300.  Because of the "curse of dimensionality" with noisy data, 
we limit the embedding to 20.  
AT 300, random signals give very nice recurrence plots signifying nothing!

Q3 - Norbet's paper: Yes, in this case I am referring to 
"How to avoid potential pitfalls in recurrence plot based data analysis" 
published in International Journal of Bifurcation and Chaos, 21(4), 2011.
```



# (004) 


```
from:	Miguel P. Xochicale <perez.xochicale@gmail.com>
to:	"Webber Jr, Charles" <Cwebber@luc.edu>
date:	9 May 2018 at 21:10
subject:	Re: Replicating of RP of the first chapter of Recurrence Quantification Analysis (2015).
mailed-by:	gmail.com

Chuck,

> I set the sliding window size to capture sufficient transition dyanamics (short windows) 
and avoid over-averaging (blurring or desensitizing) of the recurrence variables (long windows).

any paper with further evidence of those experiences?

> In this sense, RQA is a dangerous tool if one is not familiar with the pitfalls 
of implementation and interpretations.  In fact, Norbert has a nice paper on this very topic.

I like dangerous tools :), which is that Norbert's paper that you are referring to?

PD. Thanks for your reply Norbert, I will be patient!

```





# (003) replied (date:30april2018.16h54m) to # (002) NOrbert REPLIED EMAIL: date 26 April 2018 at 22:48
```
from:	Miguel P. Xochicale <perez.xochicale@gmail.com>
to:	Norbert Marwan <marwan@pik-potsdam.de>
cc:	"Charles Webber Jr." <cwebber@luc.edu>
date:	30 April 2018 at 16:54
subject:	Re: Replicating of RP of the first chapter of Recurrence Quantification Analysis (2015).
mailed-by:	gmail.com



Dear NOrbert and Chuck,

I do appreciate your replies and your code which have helped me 
to have better understanding of the RPs through a closely replication of your graphical results

* replicated figure11-v01: https://raw.githubusercontent.com/mxochicale/marwan2015-replication/master/figures/figure11/v01/figure11-v01.png
* replicated figure12-v01: https://raw.githubusercontent.com/mxochicale/marwan2015-replication/master/figures/figure12/v01/figure12-v01.png

However, I understand that the RP should not be equal to your results due because of the use 
of rand() function, initial conditions in the functions and ode45()inMATLAB and ode()inR functions to solve the differential equations,
but I am expecting, at least, to have a similar results using the same function and parameters.
For instance, for Figure 1.1, the sample rate for time variable to generate the lorenz solutions is not given, 
so I defined `times = seq(1,50, by=0.01) which has a length of 5001 samples and 
then windowed the data for each variable with only 1500 samples.
For Figure 1.2 D, I did a slightly change with the disputed parameter changing it from 
`2*rand-1` to `2*rand` and the epsilon parameter from 0.2 to 5 in the R version.

More questions:

* (1) What is your motivation to choose different time series lengths (e.g. 4500, 400 and 150) to create the RP?
* (2) I guess that every time series has its own features which might be the reason to choose
different threshold parameters as well (e.g. epsilon=0.2 and epsilon=0.4), but I am failing 
to understand what is the main reason for that. Would you please give further details?

* (3) Is there any fundamental reason to choose the following  time series parameters:
(3.1) periodic(super-positioned harmonic oscillations): `sin(.2*[1:N]').*sin(.05*[1:N]')`
(3.2) logistic map corrupted with a linear increasing term:  `logistic.map.time.series  +  0.01*(1:(1+M)) with x=.617 
(3.3) distupted brownian motion:  `x(i+1)=x(i)+(2*rand-1)`

* (4) Are aware of any validation or standarisation test or publication for the creation of Recurrence Plots.
My silly assumption is that both functions crp()inMATLAB and rqa()inR 
must produce the same results, however, your algorithm implementation might 
be a  slightly different from the implementation of Constantino-Garcia et al. 


* (5) Can you share the following paper and the code to replicate your graphical results?
```
N. Marwan, M. C. Romano, M. Thiel, J. Kurths, 
Recurrence Plots for the Analysis of Complex Systems, 
Physics Reports, 438(5-6), 237-329, DOI:10.1016/j.physrep.2006.11.001, 2007
```


NOTE:
It will take me some indefinite time but I want to let you know that
this exercise of understanding your work by replicating your graphical results 
will be submitted to ReScience*

* ReScience is a peer-reviewed journal that targets computational research and 
encourages the explicit replication of already published research, 
promoting new and open-source implementations in order to ensure that 
the original research is reproducible. https://rescience.github.io/

Thanks again for your time and help
Miguel
```






# (002) NOrbert REPLIED EMAIL: date 26 April 2018 at 22:48

```
from:	Norbert Marwan <marwan@pik-potsdam.de>
to:	"Miguel P. Xochicale" <perez.xochicale@gmail.com>
cc:	"Charles Webber Jr." <cwebber@luc.edu>
date:	26 April 2018 at 22:48
subject:	Re: Replicating of RP of the first chapter of Recurrence Quantification Analysis (2015).
mailed-by:	pik-potsdam.de
security:	￼ Standard encryption (TLS) Learn more
```


```

Hi Miguel,

thanks for your interest in our work.

I will send you the scripts that I had used to prepare these figures. (I’m sorry that it is not well-commented)

Some remarks:
(1) For RP of Lorenz, the trajectory of the Lorenz system is used as shown in subpanel A, i.e., all three components x, y, and z of Lorenz are used.
(2) For chaotic systems, the choice of the initial value is crucial. Therefore, your logistic map differs. You can find the used value in the attached script.

If you have any further question let me know.

Best wishes
NOrbert

```



# (001) CHUCK REPLIED EMAIL: 26 April 2018 at 13:25

```
Dear Miguel - Thank you for your important questions.  
I defer to Norbert because Figs. 1.1 and 1.2 from our RQA book are generated by him.  
I note that your second link for Fig. 1.2 does not work for me. - Sincerely, Chuck 04/26/18

```






# (000) FIRST EMAIL: date 26 April 2018 at 13:04

```
from:	Miguel P. Xochicale <perez.xochicale@gmail.com>
to:	marwan@pik-potsdam.de, cwebber@luc.edu
date:	26 April 2018 at 13:04
subject:	Replicating of RP of the first chapter of Recurrence Quantification Analysis (2015).
mailed-by:	gmail.com
```


```
marwan@pik-potsdam.de, cwebber@luc.edu
Replicating of RP of the first chapter of Recurrence Quantification Analysis (2015).

Dear Norbert and Charles,

I am trying to replicate the figure 1.1 and figure 1.2 of the first chapter
of Recurrence Quantification Analysis (2015).

# Figure 1.1: 
Although I am using the same controlling parameters for the lorenz system, I get 
a different pattern in the recurrence plot(RP) which is created using embedding parameter (m=1, tau=1) 
and epsilon=5. This is the graphical result:

Replicated Figure: https://github.com/mxochicale/marwan2015-replication/blob/master/figures/figure11/figure11-v00.png

# Figure 1.2: 
I understand that giving detailed description of the time series to create the RP is not relevant for the chapter,
but I am failing to replicate your results. 
I am interested having more understanding and knowing which functions and equations that you use to create the time series, 
specially for the logistic map equation which is not even closer to your results.

Replicated Figure: https://github.com/mxochicale/marwan2015-replication/blob/master/figures/figure12/figure12-v00.png


Finally, I would like to know if you are aware of any validation or standarisation test or publication for the creation of Recurrence Plots.
It seems that my graphical results might differt slightly from yours which might lead to different conclusions.


I am using R and the R package: `https://github.com/constantino-garcia/nonlinearTseries` for replication 
of the figures and the code is available [here](https://github.com/mxochicale/marwan2015-replication/tree/master/code).


Regards,
Miguel
```


