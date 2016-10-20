### it requires to have a fasta file (I don't know how to do it with a nexus)

Fst_Phist_andreia <- function(pop_nex, haplo_fasta){
require(strataG)
seq.fasta <- read.fasta(haplo_fasta)
temp_haplo <- haplotype(pop_nex)
haplo.v <- vector()
for (ind in seq_along(seq.fasta)){
        haplo.v <- c(haplo.v, rep(labels(temp_haplo)[ind], length(attr(temp_haplo, "index")[[ind]])))
}
temp_gtype <- gtypes(gen.data=data.frame(labels(pop_nex),str_sub(labels(pop_nex), -1),haplo.v),id.col=1,strata.col=2,locus.col=3, dna.seq=seq.fasta)
temp_pop_diff <- pop.diff.test(temp_gtype, quietly = TRUE)
temp_pop_diff$pairwise$result
}
fst_andreia <- Fst_Phist_andreia(pop_nex, "seq_andreia.fasta")
