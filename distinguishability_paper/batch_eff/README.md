## Batch effect simulation

This sub folder contains the code to reproduce the batch effect simulation results. To simulate data with certain level of batch effect magnitude ({batch_magnitude}), run

```{r}
Rscript scripts/sim_batch_two_group.R {batch_magnitude}
```

To analyze the simulated data sets by applying the distinguishability prior-PRP method on it, run

```{r}
Rscript scripts/MCMC_analyze_batch_two_grp.R sim_data/batch_2grp_batch_sd_{batch_magnitude}.dat {batch_magnitude}
```

To generate the histograms and sensitivity plot for each output results, run

```{r}
Rscript scripts/MCMC_plot_batch_2grp.R output/batch_2grp_bb_sd_{batch_magnitude}.prp.out {batch_magnitude}
```