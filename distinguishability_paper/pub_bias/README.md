## Publication bias simulation

This sub folder contains the code to reproduce the publication bias simulation results. To simulate data with certain level of publication bias introduced ({p_thresh}), run

```{r}
Rscript scripts/sim_pubbias_two_grp.R {p_thresh}
```

To analyze the simulated data sets by applying the distinguishability prior-PRP with default test statistics on it, run

```{r}
Rscript scripts/MCMC_analyze_pubbias_two_grp.R sim_data/pubbias_2grp_pthresh_{pthresh}.dat {pthresh}
```

To analyze the simulated data sets by applying the distinguishability prior-PRP with publication bias specific test statistics on it, run

```{r}
Rscript scripts/MCMC_analyze_pubbias_two_grp_pub_ts.R sim_data/pubbias_2grp_pthresh_{pthresh}.dat {pthresh}
```

To generate the overlay histogram plot, run

```{r}
Rscript scripts/plot_pubbias_two_grp.R
```