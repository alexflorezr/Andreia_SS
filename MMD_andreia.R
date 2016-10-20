### Plots the mismatch distribution (MMD) for all and single pops
### The function requires the function nex_per_pop
MMD.andreia <- function(pop_nex, pops){
require(pegas)
par(mfrow=c(2,2), mar=c(4,4,3,3))
MMD(pop_nex, main = "all pops", legend = F)
legend(x=2, y=0.5, legend = c("Empirical", "Stable expectation"), fill =c("blue", "red"), border = F,bty = "n", yjust = 1)
for (p in seq_along(pops)){
        MMD(nex_per_pop(pop_nex = pop_nex, pops[p]), main = paste("pop =", pops[p]), legend = F )
}
}
MMD.andreia(pop_nex, pops=c(1,2, 3))
