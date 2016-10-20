### Creates independent DNAbin objects for each population ####
nex_per_pop <- function(pop_nex, pop){
require(stringr)
temp_pop <- which(str_sub(labels(pop_nex), -1) == pop)
temp_pop_nex <- pop_nex[temp_pop,]
}