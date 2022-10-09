## RP:P re-analysis

This sub folder contains the code to reproduce the RP:P re-analysis. 

To generate the overlay plot (containing the Patil et al predictive interval, distinguishability PI and DC PI), run,

```{r}
Rscript plot_rpp_overlay.R 
```

Otherwise, run
```{r}
Rscript MCMC_analyze_RPP.R
```
This will generate the RP:P individual results by running the distinguishability PRP method and the comparison between the default and publication bias test statistics.