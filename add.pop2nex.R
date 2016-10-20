setwd("/Users/afr/Desktop/PhD/Collaborations/Andreia_SS/Data")
library(ips)
### I used find "\t0(\d+_\w\d+)" replace with "\t\1" in the original .nex to ... 
### ... remove the zeros in front of some ids, Also, I used find "(_H)0(\d+)" ...
### ... to remove the zeros in front of the haplotypes IDs (e.g. HO1 -> H1)
add.pop2nex <- function(nexus_file, data.csv){
seq_nex <- read.nex(nexus_file)
pop_csv <- read.csv2(data.csv, header = T, stringsAsFactors = F, sep = ",")
new_id.v <- vector(length = dim(pop_csv)[1])
for (seq in 1:dim(seq_nex)[1]){
        temp_pop <- pop_csv$Population[which(pop_csv$ID == labels(seq_nex[seq,]))]
        new_id.v[seq] <- paste(labels(seq_nex[seq,]), temp_pop, sep = "_")
}
dimnames(seq_nex)[[1]] <- new_id.v
seq_nex
}
pop_nex <- add.pop2nex("Andreia_alignment_v3_196.nex", "andreia_data.csv")
