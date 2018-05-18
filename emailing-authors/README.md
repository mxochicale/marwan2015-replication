# (007) - draft


```
Dear Norbert 

I do appreciate your time and reply and thanks for the interest
in spending some time with your expertise to reproduce, at least,
one of your papers. Actually, you made a fair about my selection
of [marwan2015] "Mathematical and Computational Foundations of Recurrence Quantifications"
as my target to reproduce, well the reason for that is essentially 
my little understanding and knowledge in the area. I though that replicating
[marwane2014] might be a good starting point for me to understand 
better the topic of RPQ.

Norbert, I will rethink the selection of your work 
for deeper scientific investigation by taking into account your recommendations.

I will send you another email in the future about my selection 

Thanks again for your time and help.

```


# (006)

```
from:	Norbert Marwan <marwan@pik-potsdam.de>
to:	"Miguel P. Xochicale" <perez.xochicale@gmail.com>
cc:	"Charles Webber Jr." <cwebber@luc.edu>
date:	17 May 2018 at 17:14
subject:	Re: Replicating of RP of the first chapter of Recurrence Quantification Analysis (2015).


Dear Miguel,

first, I like the idea to focus on reproducibility. 
I often try to reproduce others works, e.g. as a reviewer when reviewing a manuscript, 
but quite often I fail because not all information is given. 
Therefore, I try to provide all information in my studies that are necessary to reproduce my results.

However, I’m quite concerned about the example which you have selected. 
This example is not presenting a scientific result but only used for illustration. 
We could easily replace this figure with any other but showing the same general features 
and for the same illustrative purpose.

I suggest to select a more scientific result to replicate, for example:

C. Letellier: Estimating the Shannon Entropy: Recurrence Plots versus Symbolic Dynamics, 
Physical Review Letters, 96, 254102p. (2006). DOI:10.1103/PhysRevLett.96.254102

This would be much more challenging but also more interesting!

Further answers below in your email:


1. 


Am 30.04.2018 um 17:54 schrieb Miguel P. Xochicale <perez.xochicale@gmail.com>:
Dear NOrbert and Chuck,
I do appreciate your replies and your code which have helped me
to have better understanding of the RPs through a closely replication
of your graphical results
* replicated figure11-v01:
https://raw.githubusercontent.com/mxochicale/marwan2015-replication/master/figures/figure11/v01/figure11-v01.png

Here, clearly you have not used the three components of the Lorenz system 
for the RP but only one. Why? 
For plotting the phase space trajectory you used all three components.


2. 


* replicated figure12-v01:
https://raw.githubusercontent.com/mxochicale/marwan2015-replication/master/figures/figure12/v01/figure12-v01.png

This looks similar to the original or not? 
Deviations are mainly due to different realisations for the stochastic systems.



3.



However, I understand that the RP should not be equal to your results
due because of the use
of rand() function, initial conditions in the functions and
ode45()inMATLAB and ode()inR functions to solve the differential
equations,
but I am expecting, at least, to have a similar results using the same
function and parameters.

Yes, for the deterministic systems, but not for the stochastic systems. 
But if initial conditions are different, 
then you get "slightly different" variability of your deterministic system, 
i.e. the RP looks not the same but at least has the same general features 
(e.g., diagonal lines).



4.



For instance, for Figure 1.1, the sample rate for time variable to
generate the lorenz solutions is not given,
so I defined `times = seq(1,50, by=0.01) which has a length of 5001 samples and
then windowed the data for each variable with only 1500 samples.

as far as I remember, I sent you some code. There you can find all the settings. 
The complete information for the example in Fig. 1.1 was not necessary, 
because this is just an illustration. 
As said, you can simply replace it with any other system without 
changing the explanations about it, because it just illustrates the construction of RPs. 
And again, just to replicate such example is waste of time; 
you should more focus on replicating the results of real scientific 
research questions presented in original scientific papers 
but not in overview or review papers/chapters.


5.


For Figure 1.2 D, I did a slightly change with the disputed parameter
changing it from
`2*rand-1` to `2*rand` and the epsilon parameter from 0.2 to 5 in the R version.

OK.



6.


More questions:
* (1) What is your motivation to choose different time series lengths
(e.g. 4500, 400 and 150) to create the RP?

Because of didactic and visualisation reasons. 
If using a time series for noise with 1000 or more points, 
then nothing interesting is visible in the RP when printed in such size in a book. 
If using only 150 data points for the deterministic process, 
it also looks weird because of the low resolution. 
It is really just a matter of illustrating the general differences 
of this completely different processes.



7.



* (2) I guess that every time series has its own features which might
be the reason to choose
different threshold parameters as well (e.g. epsilon=0.2 and
epsilon=0.4), but I am failing
to understand what is the main reason for that. Would you please give
further details?

It would have been nice to have the same epsilon for all. 
But at least for the 2nd example with the sine it just looked better for illustration purpose. 
As said, this is only an illustration and not for any deeper scientific investigation. 
If you are more interested in how to select the threshold then we can suggest some references. 
(we are even currently working on a more theoretical understanding how to select the threshold – 
to be published in the journal Chaos).


8.




* (3) Is there any fundamental reason to choose the following time
series parameters:
(3.1) periodic(super-positioned harmonic oscillations):
`sin(.2*[1:N]').*sin(.05*[1:N]')`
(3.2) logistic map corrupted with a linear increasing term:
`logistic.map.time.series  +  0.01*(1:(1+M)) with x=.617
(3.3) distupted brownian motion:  `x(i+1)=x(i)+(2*rand-1)`

No, absolutely not. You can completely exchange these examples 
with any other that have the same general properties 
(periodic, chaotic, trend, correlated noise).




9.





* (4) Are aware of any validation or standarisation test or
publication for the creation of Recurrence Plots.
My silly assumption is that both functions crp()inMATLAB and rqa()inR
must produce the same results, however, your algorithm implementation might
be a  slightly different from the implementation of Constantino-Garcia et al.

I don’t know the R software. In the past I have compared the results with 
the RQA software of Chuck Webber and found differences and reasons for them. 
This allowed me to figured out the procedure how to get identical results. 
See e.g. here: 
http://tocsy.pik-potsdam.de/CRPtoolbox/content_faq.php#webber

As the method is quite simple and easy to implement, 
I suggest to implement the method him-/herself.



10.




* (5) Can you share the following paper and the code to replicate your
graphical results?
```
N. Marwan, M. C. Romano, M. Thiel, J. Kurths,
Recurrence Plots for the Analysis of Complex Systems,
Physics Reports, 438(5-6), 237-329, DOI:10.1016/j.physrep.2006.11.001, 2007
```

Sure I can share the paper, but collecting all the code to prepare the figures 
is a bit too much work. Please understand that I have also other more urgent things to do. 
You have also selected the wrong paper. This is a review paper. 
Please select studies which consider ONE research question and present ONE result. 
You should then try to reproduce this result. 
You can also select one of my studies and I will then try to help 
and support you (but nothing more than 15 years old, 
as some of the old data and codes is not available 
anymore due to several moves and computer changes). 
But don’t select a paper which summarises and illustrates the method 
and selected applications in more general, like a review paper or review book chapter.




11.


NOTE:
It will take me some indefinite time but I want to let you know that
this exercise of understanding your work by replicating your graphical results
will be submitted to ReScience*



A said, I’m quite concerned about your choice. 
Please rethink it or explain why you selected these examples. 
Perhaps I understand it better then.

Feel free to ask more questions. 
But it can take some days until I can answer.




Best wishes
Norbert




```




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


