### Estimates the nucleotide diversity and variance for all and single pops
### The function requires the function nex_per_pop
ND.andreia <- function(pop_nex, pops){
require(pegas)
temp_ND.df <- data.frame(matrix(nrow = length(pops)+1, ncol=3))
colnames(temp_ND.df) <- c("Pop", "ND","Variance_ND")
temp_ND.df[1,] <- c("all", nuc.div(pop_nex, variance = T))
temp_row <- 2
for (p in seq_along(pops)){
        temp_ND.df[temp_row,] <- c(pops[p], nuc.div(nex_per_pop(pop_nex = pop_nex, pops[p]), variance = T))
        temp_row <- temp_row + 1
}
temp_ND.df
}
ND.df <- ND.andreia(pop_nex, c(1,2,3))
