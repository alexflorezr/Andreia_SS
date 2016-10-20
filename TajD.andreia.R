### Estimates Tajima's D and p-values for all and single pops
### The function requires the function nex_per_pop
TajD.andreia <- function(pop_nex, pops){
require(pegas)
temp_tajD.df <- data.frame(matrix(nrow = length(pops)+1, ncol=4))
colnames(temp_tajD.df) <- c("Pop", "TajimasD","Pvalue_normal", "Pvalue_beta")
temp_tajD <- tajima.test(pop_nex)
temp_tajD.df[1,] <- c("all", temp_tajD$D, temp_tajD$Pval.normal, temp_tajD$Pval.beta)
temp_row <- 2
for (p in seq_along(pops)){
        temp_tajD <- tajima.test(nex_per_pop(pop_nex = pop_nex, pops[p]))
        temp_tajD.df[temp_row,] <- c(pops[p], temp_tajD$D, temp_tajD$Pval.normal, temp_tajD$Pval.beta)
        temp_row <- temp_row + 1
        }
temp_tajD.df
}
tajimaD <- TajD.andreia(pop_nex, pops=c(1,2,3))
